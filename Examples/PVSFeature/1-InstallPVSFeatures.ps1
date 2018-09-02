# Install PVS Console
PVSFeature "PVSFeatures-InstallConsole"
{
    IsSingleInstance = 'Yes'
    Roles = 'Console'
    SourcePath = 'C:\temp\Sources\ProvisioningServicesISO'
    Ensure = 'Present'
}

# Install PVS Server and Console
PVSFeature "PVSFeatures-InstallConsoleServer"
{
    IsSingleInstance = 'Yes'
    Roles = 'Console','Server'
    SourcePath = 'C:\temp\Sources\ProvisioningServicesISO'
    Ensure = 'Present'
}

# Install Target Device Software
PVSFeature "PVSFeatures-InstallTDS"
{
    IsSingleInstance = 'Yes'
    Roles = 'TDS'
    SourcePath = 'C:\temp\Sources\ProvisioningServicesISO'
    Ensure = 'Present'
}