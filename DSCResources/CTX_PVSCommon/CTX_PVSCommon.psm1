Import-LocalizedData -BindingVariable localized -FileName CTX_PVSCommon.Resources.psd1;

#region Private Functions

function StartWaitProcess {
    <#
    .SYNOPSIS
        Starts and waits for a process to exit.
    .NOTES
        This is an internal function and shouldn't be called from outside.
#>
    [CmdletBinding(SupportsShouldProcess)]
    [OutputType([System.Int32])]
    param (
        # Path to process to start.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FilePath,

        # Arguments (if any) to apply to the process.
        [Parameter()]
        [AllowNull()]
        [System.String[]] $ArgumentList,

        # Credential to start the process as.
        [Parameter()]
        [AllowNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        # Working directory
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $WorkingDirectory = (Split-Path -Path $FilePath -Parent)
    )
    process {

        $startProcessParams = @{
            FilePath         = $FilePath;
            WorkingDirectory = $WorkingDirectory;
            NoNewWindow      = $true;
            PassThru         = $true;
        };
        $displayParams = '<None>';
        if ($ArgumentList) {
            $displayParams = [System.String]::Join(' ', $ArgumentList);
            $startProcessParams['ArgumentList'] = $ArgumentList;
        }
        Write-Verbose ($localized.StartingProcess -f $FilePath, $displayParams);
        if ($Credential) {
            Write-Verbose ($localized.StartingProcessAs -f $Credential.UserName);
            $startProcessParams['Credential'] = $Credential;
        }
        if ($PSCmdlet.ShouldProcess($FilePath, 'Start Process')) {
            $process = Start-Process @startProcessParams -ErrorAction Stop;
        }
        if ($PSCmdlet.ShouldProcess($FilePath, 'Wait Process')) {
            Write-Verbose ($localized.ProcessLaunched -f $process.Id);
            Write-Verbose ($localized.WaitingForProcessToExit -f $process.Id);
            $process.WaitForExit();
            $exitCode = [System.Convert]::ToInt32($process.ExitCode);
            Write-Verbose ($localized.ProcessExited -f $process.Id, $exitCode);
        }
        return $exitCode;

    } #end process
} #end function StartWaitProcess

function Add-PSSnapin {
    <#
    .SYNOPSIS
        Proxy function to load Citrix PowerShell snapins within a module
        at the global scope.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [System.String[]] $Name
    )
    process {

        foreach ($snapinName in $Name) {

            $modulePath = Join-Path -Path $PSScriptRoot -ChildPath "$snapinName.psm1";
            Import-Module -Name $modulePath -Global -Verbose:$false;

        } #end foreach snapin

    } #end process
} #end function Add-PSSnapin


function TestPVSInstalledRole {
    <#
    .SYNOPSIS
        Tests whether a Citrix PVS role is installed.
#>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        ## Citrix PVS role to query.
        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String[]] $Role
    )
    process {
        $installedRoles = GetPVSInstalledRole -Role $Role;
        foreach ($r in $Role) {

            if ($installedRoles -notcontains $r) {
                return $false;
            }
        }

        return $true;

    } #end process
} #end function TestXDRole


function GetPVSInstalledRole {
    <#
    .SYNOPSIS
        Returns installed Citrix PVS installed products.
#>
    [CmdletBinding()]
    [OutputType([System.String[]])]
    param (
        ## Citrix PVS role to query.
        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String[]] $Role
    )
    process {
        Write-Host "Testing roles 3: $Role"
        $installedProducts = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -like '*Citrix*' -and $_.DisplayName -notlike '*snap-in' } |
            Select-Object -ExpandProperty DisplayName;


        $installedRoles = @();
        foreach ($r in $Role) {
            switch ($r) {

                'Console' {
                    $filter = '*Provisioning Services Console x64';
                }
                'Server' {
                    $filter = '*Provisioning Services x64';
                }
                'TDS' {
                    $filter = '*Provisioning Services Target Device x64';
                }
            }

            $role_locales = $filter.Split(",")

            foreach ($locale in $role_locales) {
                
                $result = $installedProducts -like $locale;
        
                if ([System.String]::IsNullOrEmpty($result)) {

                }
                elseif ($result) {
                    $installedRoles += $r;
                    Write-Verbose "Role found: $installedRoles"
                    break;
                }
                
            }
        }

        return $installedRoles;

    } #end process
} #end function GetXDInstalledProduct

function GetPVSUninstallString {
    <#
        .SYNOPSIS
            Returns Citrix PVS uninstall string.
    #>
    [CmdletBinding()]
    [OutputType([System.Collections.ArrayList])]
    param (
        ## Citrix PVS role to query.
        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String] $Role
    )
    process {
    
        $installedProducts = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' -ErrorAction SilentlyContinue |
            Where-Object { $_.DisplayName -like '*Citrix*' -and $_.DisplayName -notlike '*snap-in' } |
            Select-Object DisplayName, UninstallString;
    
    
        $uninstallStrings = New-Object System.Collections.ArrayList;
 
    
        switch ($Role) {

            'Console' {
                $filter = '*Provisioning Services Console x64';
            }
            'Server' {
                $filter = '*Provisioning Services x64';
            }
            'TDS' {
                $filter = '*Provisioning Services Target Device x64';
            }
        }
    
        $role_locales = $filter.Split(",")

        foreach ($locale in $role_locales) {
                
            Write-Verbose "Locale: $locale"

            foreach ($installedProduct in $installedProducts)
            {
                if ($installedProduct.DisplayName -like $locale)
                {
                    Write-Verbose "$($installedProduct.DisplayName) found..."
                    $null = $uninstallStrings.Add($installedProduct.UninstallString)
                }

            }
        
            if ([System.String]::IsNullOrEmpty($uninstallStrings)) {
                Write-Host "ist null"
            }
                
        }
    
        return $uninstallStrings;
    
    } #end process
} #end function GetPVSUninstallString

function ResolvePVSSetupMedia {
    <#
    .SYNOPSIS
        Resolve the correct installation media source for the
        local architecture depending on the role.
#>
    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        ## Citrix PVS role to install/uninstall.
        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String] $Role,

        ## Citrix PVS installation media path.
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $SourcePath
    )
    process {

        $architecture = 'x86';
        if ([System.Environment]::Is64BitOperatingSystem) {
            $architecture = 'x64';
        }

        if ($Role -contains 'Console') {
            $installMedia = 'Console\PVS_Console_x64.exe';
        }
        elseif ($Role -contains 'Server') {
            $installMedia = 'Server\PVS_Server_x64.exe';
        }
        else {
            $installMedia = 'Device\PVS_Device_x64.exe';
        }

        $installMediaPath = Get-ChildItem -Path $SourcePath -Filter $installMedia -File;

        if (-not $installMediaPath) {
            throw ($localized.NoValidSetupMediaError -f $installMedia, $SourcePath);
        }

        return $installMediaPath.FullName;

    } #end process
} #end function ResolveXDSetupMedia


function ResolvePVSSetupArguments {
    <#
    .SYNOPSIS
        Resolve the installation arguments for the associated PVS role.
#>
    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        ## Citrix PVS role to install/uninstall.
        [Parameter(Mandatory)]
        [ValidateSet('Console', 'Server', 'TDS')]
        [System.String] $Role,

        ## Citrix PVS installation media path.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $LogPath = (Join-Path -Path $env:TMP -ChildPath '\Citrix\PVS Installer\PVS.log'),

        ## Uninstall Citrix PVS product.
        [Parameter()]
        [System.Management.Automation.SwitchParameter] $Uninstall
    )
    process {
        $parentLogFolder = Split-Path $LogPath -Parent
        if (!(Test-Path $LogPath))
        {
            [ref] $null = New-Item -ItemType Directory -Force -Path $parentLogFolder
        }

        $arguments = New-Object -TypeName System.Collections.ArrayList -ArgumentList @();
        $arguments.AddRange(@('/s', '/v"', '/qn', "/l `\`"$LogPath`\`"`""));
        #$arguments.AddRange(@('/s', '/v"', '/qn', "/l c:\windows\temp\citrix\pvs.log`""));

        ## Additional install parameters per role
        if ($Role -contains 'TDS') {
            # TBD - [ref] $null = $arguments.Add('/NOSQL');
        }

        Write-Verbose "arguments: $arguments"

        return [System.String]::Join(' ', $arguments.ToArray());

    } #end process
} #end function ResolveXDSetupArguments

function RemovePVSServerFromFarm {
    <#
        .SYNOPSIS
            Removes Citrix PVS server from farm.
    #>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (
        ## Citrix PVS server to be removed.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $ServerName
    )
    process {
        try
        {
            LoadPVSConsoleSnapin
            Stop-PvsStreamService -ServerName $ServerName
            Remove-PvsServer -ServerName $ServerName
        }
        catch
        {
            Write-Verbose "Removing PVS Server failed: $Error[0]"
        }

        return $true;
    
    } #end process
} #end function RemovePVSServerFromFarm

function LoadPVSConsoleSnapin {
    <#
        .SYNOPSIS
            Loads PVS Console Powershell Snapin.
    #>
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param ()

    process {

        if (Get-Module Citrix.PVS.SnapIn) { return $true}

        try {
            $key = "HKLM:\SOFTWARE\Citrix\ProvisioningServices"
            $PVSConsoleTargetDir = Get-ItemPropertyValue -Path $key -Name ConsoleTargetDir -ErrorAction:SilentlyContinue
            $PVSConsoleSnapin = $PVSConsoleTargetDir + "Citrix.PVS.SnapIn.dll"
    
            if (Test-Path $PVSConsoleSnapin)
            {
                Write-Verbose "Loading module '$PVSConsoleSnapin'"
                Import-Module $PVSConsoleSnapin -Verbose:$false
            }
            else
            {
                throw "PVS Console Snapin $PVSConsoleSnapin not found, make sure PVS Console is installed on the target server..."
            }
        }
        catch {
            throw "Error loading PVS Powershell module..."
        }

        return $true;
    
    } #end process
} #end function RemovePVSServerFromFarm

#endregion Private Functions
