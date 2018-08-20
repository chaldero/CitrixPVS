@{
    RootModule        = 'CTX_PVSCommon.psm1'
    ModuleVersion     = '1.0'
    GUID              = '7b9563f2-4bf7-41a7-8ebb-980054644705'
    Author            = 'Michael Wenger'
    CompanyName       = 'arcade solutions ag'
    Copyright         = '(c) 2018 arcade solutions ag. All rights reserved.'
    Description       = 'Citrix PVS 7.x Common DSC Resource library'
    PowerShellVersion = '4.0'
    FunctionsToExport = @(
                            'Add-PSSnapin',
                            'GetPVSInstalledRole',
                            'ResolvePVSSetupMedia',
                            'ResolvePVSSetupArguments',
                            'StartWaitProcess',
                            'TestPVSInstalledRole',
                            'TestPVSModule'
                        );
}
