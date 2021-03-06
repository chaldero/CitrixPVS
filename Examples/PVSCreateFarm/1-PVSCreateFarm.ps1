PVSCreateFarm "PVS-CreateFarm"
{
    Ensure                      = 'Present'
    IsSingleInstance            = 'Yes'
    DatabaseServer              = 'sqlserver.testlab.local'
    DatabaseName                = 'PVS'
    DatabaseInstance            = 'SQLEXPRESS'
    FarmName                    = 'Farm01'
    SiteName                    = 'Lucerne'
    CollectionName              = 'XenApp'
    StoreName                   = 'Store'
    StorePath                   = 'D:\Store'
    LicenseServer               = 'vstestlabcdc01.testlab.local'
    StreamingIPs                = '192.168.2.14'
    Username                    = 'testlab.local\sa-pvs'
    Password                    = Get-Credential -UserName 'testlab.local\sa-pvs' 
    FarmAdminGroupName          = 'lab.local/Users/Domain Admins'
    PXEService                  = $true
    FirstStreamingPort          = 6890
    LastStreamingPort           = 6910
    PasswordManagementInverval  = 7
}