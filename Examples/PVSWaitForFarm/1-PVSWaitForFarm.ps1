# Example 1 - All available parameters
PVSWaitForFarm "PVS-WaitForFarm"
{
    FarmName            = 'Farm01'
    ExistingPVSServer   = 'PVSServer01.lab.local'
    SoapPort            = 54321
    RetryIntervalSec    = 40
    RetryCount          = 15
    Credential          = Get-Credential -Message 'Enter credentials of a user that is PVS Farm Admin and can remotely invoke Powershell commands on the PVS server'
}

# Example 2 - Minimum required parameters
# RetryIntervalSec default is 30
# RetryCount default is 10
# SoapPort default is 54321
PVSWaitForFarm "PVS-WaitForFarm"
{
    FarmName            = 'Farm01'
    ExistingPVSServer   = 'PVSServer01.lab.local'    
}