
function Get-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', 'global:DSCMachineStatus')]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter()]
        [ValidateLength(0,250)]
        [System.String] $Description,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutoAddEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AuditingEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $DefaultSiteName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $OfflineDatabaseSupportEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $LicenseServerPort,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $LicenseTradeUp,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutomaticMergeEnabled,

        [Parameter()]
        [ValidateRange(3,50)]
        [System.UInt32] $MaxVersions,

        [Parameter()]
        [ValidateRange(0,2)]
        [System.UInt32] $MergeMode,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $PVSServerName = 'localhost',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password
    )

    try {
        Write-Verbose "Loading Powershell Citrix PVS Snapin..."
        [reg] $null = LoadPVSConsoleSnapin
    }
    catch {
       throw "Error loading PVS Powershell module..."
    }

    try {
        $pvsfarm = Get-PvsFarm
    }
    catch {
        Throw "Couldn't get PVS Farm configuration..."
    }

    $targetResource = @{
        FarmName                      = $pvsfarm.FarmName
        Description                   = $pvsfarm.Description
        AutoAddEnabled                = $pvsfarm.AutoAddEnabled
        AuditingEnabled               = $pvsfarm.AuditingEnabled
        DefaultSiteName               = $pvsfarm.DefaultSiteName
        OfflineDatabaseSupportEnabled = $pvsfarm.OfflineDatabaseSupportEnabled
        LicenseServer                 = $pvsfarm.LicenseServer
        LicenseServerPort             = $pvsfarm.LicenseServerPort
        LicenseTradeUp                = $pvsfarm.LicenseTradeUp
        AutomaticMergeEnabled         = $pvsfarm.AutomaticMergeEnabled
        MaxVersions                   = $pvsfarm.MaxVersions
        MergeMode                     = $pvsfarm.MergeMode
    }

    #$targetResource | Out-Host
    return $targetResource

} #end function Get-TargetResource

function Test-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter()]
        [ValidateLength(0,250)]
        [System.String] $Description,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutoAddEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AuditingEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $DefaultSiteName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $OfflineDatabaseSupportEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $LicenseServerPort,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $LicenseTradeUp,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutomaticMergeEnabled,

        [Parameter()]
        [ValidateRange(3,50)]
        [System.UInt32] $MaxVersions,

        [Parameter()]
        [ValidateRange(0,2)]
        [System.UInt32] $MergeMode,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $PVSServerName = 'localhost',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password
    )

    $targetResource = Get-TargetResource @PSBoundParameters;
    $inCompliance = $true;

    foreach ($property in $PSBoundParameters.Keys) {

        if ($targetResource.ContainsKey($property)) {

            $expected = $PSBoundParameters[$property];
            $actual = $targetResource[$property];

            if ($expected -ne $actual) {
                Write-Verbose "Not in desired state, $property should be $expected, acutaly is $actual"
                $inCompliance = $false;
            }
        }
    }
    if ($inCompliance) {

        Write-Verbose ("PVSFarmConfig is in desired state.");
        return $true;
    }
    else {

        Write-Verbose ("PVSReconfigureServer is NOT in desired state.");
        return $false;
    }

} #end function Test-TargetResource

function Set-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', 'global:DSCMachineStatus')]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter()]
        [ValidateLength(0,250)]
        [System.String] $Description,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutoAddEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AuditingEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $DefaultSiteName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $OfflineDatabaseSupportEnabled,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $LicenseServerPort,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $LicenseTradeUp,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $AutomaticMergeEnabled,

        [Parameter()]
        [ValidateRange(3,50)]
        [System.UInt32] $MaxVersions,

        [Parameter()]
        [ValidateRange(0,2)]
        [System.UInt32] $MergeMode,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $PVSServerName = 'localhost',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password
    )

    $targetResource = Get-TargetResource @PSBoundParameters;
    $farmconfig = Get-PvsFarm -Fields FarmId

    foreach ($property in $PSBoundParameters.Keys) {

        if ($targetResource.ContainsKey($property)) {

            $expected = $PSBoundParameters[$property];
            $actual = $targetResource[$property];

            if ($expected -ne $actual) {
                Write-Verbose "Changing '$property' from '$actual' to '$expected'"
                $farmconfig.$property = $expected
            }
        }
    }

    Write-Verbose "PVS Farm changes are being applied..."
    $farmconfig | Set-PvsFarm

} #end function Set-TargetResource


$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;

## Import the PVSCommon library functions
$moduleParent = Split-Path -Path $moduleRoot -Parent;
Import-Module (Join-Path -Path $moduleParent -ChildPath 'CTX_PVSCommon');

Export-ModuleMember -Function *-TargetResource;
