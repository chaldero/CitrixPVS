
function Get-TargetResource {
    [CmdletBinding()]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', 'DSCMachineStatus')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', 'global:DSCMachineStatus')]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $ExistingPVSServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [System.UInt64] $RetryIntervalSec = 30,

        [Parameter()]
        [System.UInt32] $RetryCount = 10
    )

    try {
        Write-Verbose "Loading module 'C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll'"
        Import-Module 'C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll' -Verbose:$false
    }
    catch {
        throw "Error loading PVS Powershell module..."
    }

        # No point testing availability here in Get-TargetResource!
        $targetResource = @{
            FarmName = $FarmName;
            ExistingPVSServer = $ExistingPVSServer;
            RetryIntervalSec = $RetryIntervalSec;
            RetryCount = $RetryCount;
            Credential = $Credential
        }

        return $targetResource;

} #end function Get-TargetResource

function Test-TargetResource {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $ExistingPVSServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [System.UInt64] $RetryIntervalSec = 30,

        [Parameter()]
        [System.UInt32] $RetryCount = 10
    )

    $targetResource = Get-TargetResource @PSBoundParameters;
    $inDesiredState = $true;

    if ($null -ne $Credential) {   
        $retrievedFarmName = TestPVSFarm -FarmName $FarmName -ExistingPVSServer $ExistingPVSServer -SoapPort $SoapPort -Credential $Credential
    }
    else {
        $retrievedFarmName = TestPVSFarm -FarmName $FarmName -ExistingPVSServer $ExistingPVSServer -SoapPort $SoapPort
    }
    
    if ($retrievedFarmName -ne $targetResource.Ensure) {
        Write-Verbose "Not in desired state..."
        $inDesiredState = $false;
    }

    return $inDesiredState

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

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $ExistingPVSServer,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $SoapPort = 54321,

        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential,

        [Parameter()]
        [System.UInt64] $RetryIntervalSec = 30,

        [Parameter()]
        [System.UInt32] $RetryCount = 10
    )

    for ($count = 0; $count -lt $RetryCount; $count++) {

        Write-Verbose "Looking for PVS FARM $FarmName on server $ExistingPVSServer"


        if ($null -ne $Credential) {   
            $FarmNameFound = TestPVSFarm -FarmName $FarmName -ExistingPVSServer $ExistingPVSServer -SoapPort $SoapPort -Credential $Credential
        }
        else {
            $FarmNameFound = TestPVSFarm -FarmName $FarmName -ExistingPVSServer $ExistingPVSServer -SoapPort $SoapPort
        }
            
        if ($FarmNameFound) {
            Write-Verbose "in desired state..."
            break;
        }
        else {            
            Write-Verbose "$FarmName not found, trying again in $RetryIntervalSec seconds..."
            Start-Sleep -Seconds $RetryIntervalSec
        }

    } #end foreach

    if (-not $FarmNameFound) {
        Write-Verbose "Operation timeout, Farm couldn't be found..."
    }

} #end function Set-TargetResource


#region Private Functions

function TestPVSFarm 
{
    [OutputType([System.Boolean])]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $FarmName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $ExistingPVSServer,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.UInt32] $SoapPort  = 54321,

        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.CredentialAttribute()]
        $Credential
    )
    
    $scriptBlock = {        
        $VerbosePreference ='Continue';
        Write-Verbose "Loading module 'C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll'"
        Import-Module 'C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll' -Verbose:$false -ErrorAction SilentlyContinue
        try {
        
            #Set-PvsConnection -Server $Using:ExistingPVSServer -Port $Using:SoapPort #-ErrorAction SilentlyContinue;
            Write-Verbose "PVS Server: $Using:ExistingPVSServer"
            Write-Verbose "PVS Port: $Using:SoapPort"
            Write-Verbose "Looking for PVS Farm: $Using:FarmName"
            Set-PvsConnection -Server $Using:ExistingPVSServer -Port $Using:SoapPort -ErrorAction SilentlyContinue
            $retrievedFarmName = (Get-PvsFarm -ErrorAction SilentlyContinue).FarmName
        }
        catch {
            #throw $Error[0]
        } 

        if ($retrievedFarmName -like $Using:FarmName) 
        {
            Write-Verbose "Farm $retrievedFarmName found..."
            return $true
        }
        elseif (-not ([System.String]::IsNullOrEmpty($retrievedFarmName))) {
            Write-Verbose "Incorrect Farm name found: $retrievedFarmName - schould be $Using:FarmName"
            return $false
        }
        else
        {
            Write-Verbose "Farm $FarmName NOT found..."
            return $false
        }
                

    } #end scriptBlock

    $invokeCommandParams = @{
        ScriptBlock = $scriptBlock;
        ErrorAction = 'Stop';
        ComputerName = $ExistingPVSServer;
    }

    if ($null -ne $Credential) {       
        $invokeCommandParams["Credential"] = $Credential
        #$invokeCommandParams["Authentication"] = 'Credssp';
    }
    else {

        $invokeCommandParams['ScriptBlock'] = [System.Management.Automation.ScriptBlock]::Create($scriptBlock.ToString().Replace('$using:','$'));
    }

    $result = Invoke-Command @invokeCommandParams

    Write-Verbose "Farm Name: $result"
    return $result;

}




$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path -Parent;

## Import the PVSCommon library functions
$moduleParent = Split-Path -Path $moduleRoot -Parent;
Import-Module (Join-Path -Path $moduleParent -ChildPath 'CTX_PVSCommon');

Export-ModuleMember -Function *-TargetResource;
