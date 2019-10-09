
function Get-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', 'global:DSCMachineStatus')]
    param (

        [Parameter(Mandatory)]
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance = 'Yes',

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LicenseServerPort = 27000,

        [Parameter()]
        [System.String] $StreamingIP = '',

        [Parameter()]
        [System.String] $ManagementIP = '',

        [Parameter()]
        [System.String[]] $StreamingIPs = '',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $FirstStreamingPort = 6890,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LastStreamingPort = 6910,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $PXEService = $true,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $BootstrapFile = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $PasswordManagementInverval = 7

    )

    if (!(TestPVSInstalledRole -Role 'Console'))
    {
        Throw "PVS Console not found, please install PVS Console first..."
    }

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

    try {
        $pvsfarm = Get-PvsFarm
        $pvsStore = Get-PvsStore
        $pvsAuthGroup = Get-PvsAuthGroup | Select-Object -ExpandProperty AuthGroupName
        $pvsCollection = Get-PvsCollection | Select-Object -ExpandProperty CollectionName
        $pvsServerInfo = Get-PvsServerInfo
        $pvsConnection = Get-PvsConnection
        $pvsBootServer = Get-PvsServerBootstrap -ServerName $env:computername -Name ARDBP32.BIN | Select-Object Bootserver*_Ip
    }
    catch {
        Write-Verbose "Couldn't get PVS configuration..."

        $targetResource = @{
            DatabaseServer             = ""
            DatabaseInstance           = ""
            DatabaseName               = ""
            FarmName                   = ""
            SiteName                   = ""
            CollectionName             = ""
            FarmAdminGroupName         = ""
            StoreName                  = ""
            StorePath                  = ""
            LicenseServer              = ""
            LicenseServerPort          = ""
            StreamingIP                = ""
            ManagementIP               = ""
            FirstStreamingPort         = 0
            LastStreamingPort          = 0
            SoapPort                   = 0
            BootstrapFile              = ""
            PasswordManagementInverval = 0
            StreamingIPs               = ""                  
        }

        return $targetResource
    }
    $streamIPs = $pvsBootServer.Bootserver1_Ip.IPAddressToString, $pvsBootServer.Bootserver2_Ip.IPAddressToString, $pvsBootServer.Bootserver3_Ip.IPAddressToString, $pvsBootServer.Bootserver4_Ip.IPAddressToString | Where-Object { $_ -ne "0.0.0.0" }
    $targetResource = @{
        LicenseServer              = $pvsfarm.LicenseServer
        LicenseServerPort          = $pvsfarm.LicenseServerPort
        StreamingIP                = $pvsServerInfo.ContactIp
        ManagementIP               = $pvsServerInfo.ManagementIp
        FirstStreamingPort         = $pvsServerInfo.FirstPort
        LastStreamingPort          = $pvsServerInfo.LastPort
        SoapPort                   = $pvsConnection.Port
        BootstrapFile              = Get-ItemPropertyValue "HKLM:\Software\Citrix\ProvisioningServices\Admin\" "Bootstrap"
        PasswordManagementInverval = $pvsServerInfo.AdMaxPasswordAge
        StreamingIPs               = $streamIPs
    }

    return $targetResource

} #end function Get-TargetResource

function Test-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (

        [Parameter(Mandatory)]
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance = 'Yes',

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LicenseServerPort = 27000,

        [Parameter()]
        [System.String] $StreamingIP = '',

        [Parameter()]
        [System.String] $ManagementIP = '',

        [Parameter()]
        [System.String[]] $StreamingIPs = '',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $FirstStreamingPort = 6890,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LastStreamingPort = 6910,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $PXEService = $true,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $BootstrapFile = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $PasswordManagementInverval = 7

    )

    $targetResource = Get-TargetResource @PSBoundParameters;
    $inCompliance = $true;

    foreach ($property in $PSBoundParameters.Keys) {

        if ($targetResource.ContainsKey($property)) {

            $expected = $PSBoundParameters[$property];
            $actual = $targetResource[$property];
            if ($property -eq 'StreamingIPs')
            {
                if (@(Compare-Object $expected $actual).length -ne 0)
                {
                    Write-Verbose "Not in desired state, $property should be $expected, acutaly is $actual"
                    $inCompliance = $false;
                }
            }
            else
            {
                if ($expected -ne $actual) {
                    Write-Verbose "Not in desired state, $property should be $expected, acutaly is $actual"
                    $inCompliance = $false;
                }
            }

        }
    }
    if ($inCompliance) {

        Write-Verbose ("PVSReconfigureServer is in desired state.");
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
        [ValidateSet('Yes')]
        [System.String] $IsSingleInstance = 'Yes',

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $LicenseServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LicenseServerPort = 27000,

        [Parameter()]
        [System.String] $StreamingIP = '',

        [Parameter()]
        [System.String] $ManagementIP = '',

        [Parameter()]
        [System.String[]] $StreamingIPs = '',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $FirstStreamingPort = 6890,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $LastStreamingPort = 6910,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $SoapPort = 54321,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Username,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Password,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean] $PXEService = $true,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String] $BootstrapFile = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt64] $PasswordManagementInverval = 7

    )

    # Get current IP address
    try {
        $AvailableNICs = gwmi Win32_NetworkAdapter -Filter "NetEnabled='True'"
        switch ($AvailableNICs.Count) { 
            {$_ -eq 0 } {
                Write-Verbose "No enabled network card could be found!"
                Write-Verbose "Please make sure at least one network card exists and is connected to the network."
                #throw "No enabled network card found"
            }
            {$_ -gt 1 } {
                Write-Verbose "More than one enabled network card was found! This script cannot determine which network card to use."
                Write-Verbose "Please enter the preferred IP address in the DSC configuration."
            }
            default {
                Write-Verbose "One enabled network card was found."
            }
        }
        ForEach ($Adapter in $AvailableNICs) {
            $IPv4Address = $(gwmi Win32_NetworkAdapterConfiguration -Filter "Index = '$($Adapter.Index)'").IPAddress[0]
        }
        Write-Verbose "The IPv4 address of the main network card is $IPv4Address"

    
    }
    catch {
        throw "An error occurred trying to retrieve the IPv4 address (error: $($Error[0]))"
    }

    # At the moment it's only possible to join an existing Site and existing Store
    $PVSConfig += "FarmConfiguration=0" + "`r`n"   # 0 = farm already configures, 1= create farm, 2 = join farm

    if ($PXEService) {
        $PVSConfig += "PXEServiceType=1" + "`r`n"
    }
                
    $PVSConfig += "LicenseServer=" + $LicenseServer + "`r`n"
    $PVSConfig += "LicenseServerPort=" + $LicenseServerPort + "`r`n"
    $PVSConfig += "UserName=" + $Username + "`r`n"
    $PVSConfig += "UserPass=" + $Password.GetNetworkCredential().Password + "`r`n"
    $PVSConfig += "PasswordManagementInterval=" + $PasswordManagementInverval + "`r`n"
                
    if ( [string]::IsNullOrEmpty($StreamingIP) ) {
        $PVSConfig += "StreamNetworkAdapterIP=" + $IPv4Address + "`r`n"
    }
    else {
        $PVSConfig += "StreamNetworkAdapterIP=" + $StreamingIP + "`r`n"
    }
                
    if ( [string]::IsNullOrEmpty($ManagementIP) ) {
        $PVSConfig += "ManagementNetworkAdapterIP=" + $IPv4Address + "`r`n"
    }
    else {
        $PVSConfig += "ManagementNetworkAdapterIP=" + $ManagementIP + "`r`n"
    }
                
    $PVSConfig += "IpcPortBase=" + $FirstStreamingPort + "`r`n"
    $PVSConfig += "IpcPortCount=" + ($LastStreamingPort - $FirstStreamingPort) + "`r`n"
    $PVSConfig += "SoapPort=" + $SoapPort + "`r`n"
    $PVSConfig += "BootstrapFile=" + $BootstrapFile + "`r`n"
                
    if ( [string]::IsNullOrEmpty($StreamingIPs) ) {
        if ( [string]::IsNullOrEmpty($StreamingIP) ) {
            $PVSConfig += "LS1=" + $IPv4Address + ",0.0.0.0,0.0.0.0,6910" + "`r`n"
        }
        else {
            $PVSConfig += "LS1=" + $StreamingIP + ",0.0.0.0,0.0.0.0,6910" + "`r`n"
        }
    }
    else {
        # ALL Streaming IPs hinzufügen
        $i = 1
        foreach ($ip in $StreamingIPs) {
            $PVSConfig += "LS" + $i + "=" + $StreamingIPs[$i - 1] + ",0.0.0.0,0.0.0.0,6910" + "`r`n"   
            ++$i
        }
    }

    # Create answer file
    $ConfWizardANSFile = "$env:Temp\ConfigWizardPVS.ans"

    Set-Content $ConfWizardANSFile -value ($PVSConfig) -Encoding Unicode -Force

    # Execute the ConfigWizard and either join or create the Provisioning Server farm
    $ConfigWizardEXE = "$env:ProgramFiles\Citrix\Provisioning Services\ConfigWizard.exe"
    $ConfigWizardLogFile = "$env:Temp\PVSConfigWizard.log"
    if ( Test-Path $ConfigWizardEXE ) {
        $params = "/a:$ConfWizardANSFile /o:$ConfigWizardLogFile"
        Write-Verbose "Command: $ConfigWizardEXE $params -WindowStyle Hidden -Wait"   
        start-process $ConfigWizardEXE $params -WindowStyle Hidden -Wait  # There is no need for a try / catch statement since the ConfigWizard always exists with code 0
    }
    else {
        Write-Error "ConfigWizard.exe not found..."
    }

} #end function Set-TargetResource


$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;

## Import the PVSCommon library functions
$moduleParent = Split-Path -Path $moduleRoot -Parent;
Import-Module (Join-Path -Path $moduleParent -ChildPath 'CTX_PVSCommon');

Export-ModuleMember -Function *-TargetResource;
