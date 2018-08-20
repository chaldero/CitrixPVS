Import-LocalizedData -BindingVariable localizedData -FileName CTX_PVSFeature.Resources.psd1;

function Get-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSDSCUseVerboseMessageInDSCResource', '')]
    [OutputType([System.Collections.Hashtable])]
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance,

        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String[]] $Roles,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $SourcePath,

        [Parameter()]
        [AllowNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String] $Ensure = 'Present',

        [Parameter()] [ValidateNotNullOrEmpty()]
        [System.String] $LogPath = (Join-Path -Path $env:TMP -ChildPath '\Citrix\PVS Installer\PVS.log')
    )
    process {

        $targetResource = @{
            Roles      = $Roles;
            SourcePath = $SourcePath;
            Ensure     = 'Absent';
        }
        Write-Verbose "Testing roles: $Roles"
        if (TestPVSInstalledRole -Role $Roles) {
            $targetResource['Ensure'] = 'Present';
        }

        return $targetResource;

    } #end process
} #end function Get-TargetResource


function Test-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (

        [Parameter(Mandatory)]
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance,

        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String[]] $Roles,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $SourcePath,

        [Parameter()]
        [AllowNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String] $Ensure = 'Present',

        [Parameter()] [ValidateNotNullOrEmpty()]
        [System.String] $LogPath = (Join-Path -Path $env:TMP -ChildPath '\Citrix\PVS Installer\PVS.log')
    )
    process {

        $targetResource = Get-TargetResource @PSBoundParameters;
        if ($Ensure -eq $targetResource.Ensure) {

            Write-Verbose ($localizedData.ResourceInDesiredState -f $Roles);
            return $true;
        }
        else {

            Write-Verbose ($localizedData.ResourceNotInDesiredState -f $Roles);
            return $false;
        }

    } #end process
} #end function Test-TargetResource

function Set-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', 'global:DSCMachineStatus')]
    param (

        [Parameter(Mandatory)]
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance,

        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String[]] $Roles,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $SourcePath,

        [Parameter()]
        [AllowNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String] $Ensure = 'Present',

        [Parameter()] [ValidateNotNullOrEmpty()]
        [System.String] $LogPath = (Join-Path -Path $env:TMP -ChildPath '\Citrix\PVS Installer\PVS.log')
    )
    begin {

        if (-not (Test-Path -Path $SourcePath -PathType Container)) {
            throw ($localizedData.InvalidSourcePathError -f $SourcePath);
        }

    }
    process {

        if ($Ensure -eq 'Present') {

            foreach ($role in $Roles) {
                Write-Verbose ($localizedData.InstallingRole -f $role);
                $installArguments = ResolvePVSSetupArguments -Role $role -LogPath $LogPath;                
    
                Write-Verbose ($localizedData.LogDirectorySet -f $logPath);
                Write-Verbose ($localizedData.SourceDirectorySet -f $SourcePath);
        
                $startWaitProcessParams = @{
                    FilePath     = ResolvePVSSetupMedia -Role $role -SourcePath $SourcePath;
                    ArgumentList = $installArguments;
                }
        
                if ($PSBoundParameters.ContainsKey('Credential')) {
                    $startWaitProcessParams['Credential'] = $Credential;
                }
        
                $exitCode = StartWaitProcess @startWaitProcessParams -Verbose:$Verbose;
                # Check for reboot
                if ($exitCode -eq 3010) {
                    $global:DSCMachineStatus = 1;
                }
            }

        }
        else {

            foreach ($role in $Roles) {
                ## Uninstall
                Write-Verbose ($localizedData.UninstallingRole -f $role);
            
                $uninstall = GetPVSUninstallString -Role $role

                $startWaitProcessParams = @{
                    FilePath     = "cmd.exe";
                    ArgumentList = "/c '$uninstall'";
                }
            
                if ($PSBoundParameters.ContainsKey('Credential')) {
                    $startWaitProcessParams['Credential'] = $Credential;
                }

                #$startWaitProcessParams = Start-Process -FilePath cmd.exe -ArgumentList '/c', $application.UninstallString -wait
                $exitCode = StartWaitProcess @startWaitProcessParams -Verbose:$Verbose;
                # Check for reboot
                if ($exitCode -eq 3010) {
                    $global:DSCMachineStatus = 1;
                }
            }


        }

    } #end process
} #end function Set-TargetResource


$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;

## Import the PVSCommon library functions
$moduleParent = Split-Path -Path $moduleRoot -Parent;
Import-Module (Join-Path -Path $moduleParent -ChildPath 'CTX_PVSCommon');

Export-ModuleMember -Function *-TargetResource;
