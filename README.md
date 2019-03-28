# CitrixPVS

The **CitrixPVS** module contains DSC resources
for deployment and configuration of Citrix PVS 7.x components.

## Contributing

There are several ways you can contribute.
You can submit an issue to report a bug.
You can submit an issue to request an improvement.
You can take part in discussions for issues.
You can review pull requests and comment on other contributors changes.
You can also improve the resources and tests,
or even create new resources,
by sending in pull requests yourself.

## Installation

To install from the PowerShell gallery using PowerShellGet (in PowerShell 5.0)
run the following command:

```powershell
Find-Module -Name CitrixPVS -Repository PSGallery | Install-Module
```

To confirm installation, run the below command:

```powershell
Get-DscResource -Module CitrixPVS
```

## Requirements

The minimum Windows Management Framework (PowerShell) version required is 5.0
or higher, which ships with Windows 10 or Windows Server 2016,
but can also be installed on Windows 7 SP1, Windows 8.1,
Windows Server 2008 R2 SP1, Windows Server 2012 and Windows Server 2012 R2.

## Examples

You can review the [Examples](/Examples) directory in the CitrixPVS module for some general use scenarios for all of the resources that are in the module.

## Change log

A full list of changes in each version can be found in the [change log](CHANGELOG.md).

## Resources

* [**PVSCreateFarm**](#pvscreatefarm)
  resource to create a new PVS farm.
* [**PVSJoinFarm**](#pvsjoinfarm)
  Join an existing PVS farm.
* [**PVSReconfigureServer**](#pvsreconfigureserver)
  reconfigure an existing PVS server that is already joined to a PVS farm.
* [**PVSFeature**](#pvsfeature)
  Install or uninstall PVS features.
* [**PVSWaitForFarm**](#pvswaitforfarm)
  Waits until a certain PVS farm exists.
* [**PVSFarmConfig**](#pvsreconfigureserver)
  Configure an existing PVS farm


### PVSFeature

This resource is used to install/uninstall PVS features: Server, Console and Target Device Software. 

#### Requirements

* Target machine must be running Windows Server 2008 R2 or later.
* Path to PVS SW sources must exist
* AD user that can remotely invoke PS commands on an existing PVS server and is Farm Admin
* PVS Console software must be installed on the PVS Server

#### Parameters

* **`[String[]]` Roles** _(Required)_: Citrix PVS features to install. { Console | Server | TDS }
* **`[String]` SourcePath** _(Required)_: Citrix PVS installation media source path.
* **`[PSCredential]` Credential** _(Write)_: Specify a user account that is local Admin and can install the PVS feature.
* **`[String]` LogPath** _(Write)_: Installation log path. Defaults to %temp%\Citrix\PVS Installer\PVS.log of the running user.
* **`[String]` Ensure** _(Key)_: Specifies if the PVS feature should be
  present or absent. { Present | Absent }

#### Examples

* [Install PVS Server and PVS Console](/Examples/PVSJoinFarm/1-InstallPVSServerConsole.ps1)


### PVSCreateFarm

This resource is used to create a new PVS farm.

#### Requirements

* Target machine must be running Windows Server 2008 R2 or later.
* An existing SQL Server or SQL Server Express must exist in order to hold the
* A Service Account User that runs the PVS services
* PVS Server software must be installed on the system

#### Parameters

* **`[String]` IsSingleInstance** _(Key)_: Specifies the resource is a single instance, the value must be 'Yes'. Default is 'Yes'
* **`[String]` DatabaseServer** _(Required)_: Database server for PVS SQL DB.
* **`[String]` DatabaseInstance** _(Write)_: Database instance of database server. Default set to none.
* **`[String]` DatabaseName** _(Write)_: Database name of PVS SQL DB. Default is 'ProvisioningServices'
* **`[String]` FarmName** _(Required)_: PVS Farm name.
* **`[String]` SiteName** _(Write)_: PVS Site name. Default is 'Site'.
* **`[String]` CollectionName** _(Write)_: PVS Collection name. Default is 'Collection'.
* **`[String]` StoreName** _(Write)_: PVS Store name. Default is 'Store'.
* **`[String]` StorePath** _(Required)_: PVS Store path.
* **`[String]` LicenseServer** _(Required)_: PVS License server.
* **`[UInt64]` LicenseServerPort** _(Write)_: PVS License server port. Default set to 27000
* **`[String]` StreamingIP** _(Write)_: Streaming IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String]` ManagementIP** _(Write)_: Management IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String[]]` StreamingIPs** _(Write)_: Additional Streaming IPs.
* **`[UInt64]` FirstStreamingPort** _(Write)_: First streaming port.
* **`[UInt64]` LastStreamingPort** _(Write)_: Last streaming port.
* **`[UInt64]` SoapPort** _(Write)_: SOAP port.
* **`[String]` Username** _(Required)_: Username for Service Account.
* **`[PSCredential]` Password** _(Required)_: Password for Service Account.
* **`[String` FarmAdminGroupName** _(Required)_: Farm Admin Group Name.
* **`[Boolean]` PXEService** _(Write)_: PXE service needs to run on this server. Default is $true.
* **`[String` BootstrapFile** _(Write)_: Bootstrap file path. Defaults to 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'.
* **`[String]` PasswordManagementInverval** _(Write)_: Passwort Change interval. Default is 7 days.
* **`[String]` Ensure** _(Write)_: Specifies if the PVS Farm should be
  present or absent. Only checks if the PVS Farm name exists, doesn't check every setting that can be configured by that DSC resource. Default is Present. { *Present* | Absent }


#### Examples

* [Create a new PVS Farm](/Examples/PVSCreateFarm/1-PVSCreateFarm.ps1)


### PVSJoinFarm

This resource is used to join an existing PVS farm.

#### Requirements

* Target machine must be running Windows Server 2008 R2 or later.
* A PVS farm must exist
* A Service Account User that runs the PVS services
* PVS Server software must be installed on the system

#### Parameters

* **`[String]` IsSingleInstance** _(Key)_: Specifies the resource is a single instance, the value must be 'Yes'. Default is 'Yes'
* **`[String]` DatabaseServer** _(Required)_: Database server for PVS SQL DB.
* **`[String]` DatabaseInstance** _(Write)_: Database instance of database server. Default set to none.
* **`[String]` DatabaseName** _(Write)_: Database name of PVS SQL DB. Default is 'ProvisioningServices'.
* **`[String]` FarmName** _(Required)_: Existing PVS Farm name.
* **`[String]` SiteName** _(Write)_: Existing PVS Site name. Default is 'Site'.
* **`[String]` StoreName** _(Write)_: PVS Store name. Default is 'Store'. At the moment only existing Stores can be joined. Will be changed in an upcoming release.
* **`[String]` LicenseServer** _(Required)_: PVS License server.
* **`[UInt64]` LicenseServerPort** _(Write)_: PVS License server port. Default set to 27000
* **`[String]` StreamingIP** _(Write)_: Streaming IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String]` ManagementIP** _(Write)_: Management IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String[]]` StreamingIPs** _(Write)_: Additional Streaming IPs.
* **`[UInt64]` FirstStreamingPort** _(Write)_: First streaming port.
* **`[UInt64]` LastStreamingPort** _(Write)_: Last streaming port.
* **`[UInt64]` SoapPort** _(Write)_: SOAP port.
* **`[String]` Username** _(Required)_: Username for Service Account.
* **`[PSCredential]` Password** _(Required)_: Password for Service Account.
* **`[Boolean]` PXEService** _(Write)_: PXE service needs to run on this server. Default is $true.
* **`[String` BootstrapFile** _(Write)_: Bootstrap file path. Defaults to 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'.
* **`[String]` PasswordManagementInverval** _(Write)_: Passwort Change interval. Default is 7 days.
* **`[String]` Ensure** _(Write)_: Specifies if the PVS Farm should be
  present or absent. Default is Present. { *Present* | Absent }


#### Examples

* [Join an existing PVS Farm](/Examples/PVSJoinFarm/1-PVSJoinFarm.ps1)

### PVSReconfigureServer

This resource is used to reconfigure an existing PVS server.

#### Requirements

* Target machine must be running Windows Server 2008 R2 or later.
* A PVS farm must exist
* A Service Account User that runs the PVS services
* PVS Server software must be installed on the system

#### Parameters

* **`[String]` IsSingleInstance** _(Key)_: Specifies the resource is a single instance, the value must be 'Yes'. Default is 'Yes'
* **`[String]` LicenseServer** _(Required)_: PVS License server.
* **`[UInt64]` LicenseServerPort** _(Write)_: PVS License server port. Default set to 27000
* **`[String]` StreamingIP** _(Write)_: Streaming IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String]` ManagementIP** _(Write)_: Management IP. If not defined, one of the IPv4 addresses of the server is being used.
* **`[String[]]` StreamingIPs** _(Write)_: Additional Streaming IPs.
* **`[UInt64]` FirstStreamingPort** _(Write)_: First streaming port.
* **`[UInt64]` LastStreamingPort** _(Write)_: Last streaming port.
* **`[UInt64]` SoapPort** _(Write)_: SOAP port.
* **`[String]` Username** _(Required)_: Username for Service Account.
* **`[PSCredential]` Password** _(Required)_: Password for Service Account.
* **`[Boolean]` PXEService** _(Write)_: PXE service needs to run on this server. Default is $true.
* **`[String` BootstrapFile** _(Write)_: Bootstrap file path. Defaults to 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'.
* **`[String]` PasswordManagementInverval** _(Write)_: Passwort Change interval. Default is 7 days.


#### Examples

* [Reconfigure an existing PVS Server](/Examples/PVSReconfigureServer/1-PVSReconfigureServer.ps1)

### PVSWaitForFarm

This resource is used to wait a certain time for a PVS Farm and continue when the Farm exists. This DSC resource can be used before a second PVS server is being joined to a PVS Farm that won't exist right at the beginning.

#### Requirements

* Target machine must be running Windows Server 2008 R2 or later.
* A PVS farm must exist
* AD user that can remotely invoke PS commands on an existing PVS server and is Farm Admin
* PVS Console software must be installed on the PVS Server

#### Parameters

* **`[String]` FarmName** _(Required)_: PVS Farm name to look for.
* **`[String]` ExistingPVSServer** _(Key)_: Citrix PVS Server name.
* **`[UInt32]` SoapPort** _(Write)_: SOAP port. Defaults to 54321
* **`[UInt64]` RetryIntervalSec** _(Write)_: Interval between retries in seconds. Defaults to 30
* **`[UInt32]` RetryCount** _(Write)_: Retry count before timing out. Defaults to 10
* **`[PSCredential]` Credential** _(Write)_: Specify a user account that is PVS Farm admin and can remotely invoke a PS command on the PVS server.


#### Examples

* [Wait for an existing PVS Farm](/Examples/PVSWaitForFarm/1-PVSWaitForFarm.ps1)




