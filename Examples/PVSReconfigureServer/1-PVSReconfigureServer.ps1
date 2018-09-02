PVSReconfigureServer "PVS-ReconfigureServer"
{
    IsSingleInstance            = 'Yes'
    LicenseServer               = 'vstestlabcdc01.testlab.local'
    LicenseServerPort           = 27000
    StreamingIPs                = '192.168.2.14','192.168.2.15'
    Username                    = 'testlab.local\sa-pvs'
    Password                    = Get-Credential -UserName 'testlab.local\sa-pvs' 
    PXEService                  = $true
    FirstStreamingPort          = 6890
    LastStreamingPort           = 6910
    PasswordManagementInverval  = 7
}