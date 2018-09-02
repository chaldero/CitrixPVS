PVSJoinFarm "PVS-JoinFarm"
{
    Ensure                      = 'Present'
    IsSingleInstance            = 'Yes'
    DatabaseServer              = 'sqlserver.testlab.local'
    DatabaseName                = 'PVS'
    DatabaseInstance            = 'SQLEXPRESS'
    FarmName                    = 'Farm01'
    SiteName                    = 'Lucerne'
    StoreName                   = 'Store'
    LicenseServer               = 'vstestlabcdc01.testlab.local'
    StreamingIPs                = '192.168.2.14','192.168.2.15'
    Username                    = 'testlab.local\sa-pvs'
    Password                    = Get-Credential -UserName 'testlab.local\sa-pvs' 
    PXEService                  = $true
    FirstStreamingPort          = 6890
    LastStreamingPort           = 6910
    PasswordManagementInverval  = 7
}