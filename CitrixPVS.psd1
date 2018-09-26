@{
    ModuleVersion        = '1.0.2';
    GUID                 = '7c9cfb51-e89f-4d8e-9142-2f77700f3b72';
    Author               = 'Michael Wenger';
    CompanyName          = 'arcade solutions ag';
    Copyright            = '(c) 2018 arcade solutions ag. All rights reserved.';
    Description          = 'The PVS DSC resources can automate the deployment and configuration of PVS. These DSC resources are provided AS IS, and are not supported through any means.'
    PowerShellVersion    = '4.0';
    DscResourcesToExport = @(
                                'PVSFeature'
                                'PVSCreateFarm'
                                'PVSJoinFarm'
                                'PVSReconfigureServer'
                                'PVSWaitForFarm'
				                'PVSFarmConfig'
                            );
    PrivateData = @{
        PSData = @{
            Tags       = @('arcade','Citrix','PVS','DSC');
            LicenseUri = 'https://github.com/chaldero/CitrixPVS/blob/master/LICENSE';
            ProjectUri = 'https://github.com/chaldero/CitrixPVS';
            IconUri    = 'https://raw.githubusercontent.com/chaldero/CitrixPVS/master/CitrixReceiver.png';
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}
