# Suppressing this rule because these functions are from an external module
# and are only being used as stubs
[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingUserNameAndPassWordParams', '')]
param()

function Add-PvsDeviceToDomain {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteViewName},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Domain},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${OrganizationUnit},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Add-PvsDeviceToView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Add-PvsDiskLocatorToDevice {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${DeviceId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteViewName},

        [switch]
        ${RemoveExisting},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Add-PvsDiskToUpdateTask {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${UpdateTaskId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Add-PvsDiskVersion {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Clear-PvsConnection {
    [CmdletBinding()]
    param(
        [switch]
        ${Persist}
   )

}

function Clear-PvsTask {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [uint32]
        ${TaskId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Copy-PvsDeviceProperties {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [guid]
        ${DeviceIdFrom},

        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceNameFrom},

        [object]
        ${DeviceMacFrom},

        [Alias('Guid')]
        [guid]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateRange(1, 11)]
        [uint32[]]
        ${Properties},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Copy-PvsDiskProperties {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [guid]
        ${DiskLocatorIdFrom},

        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [ValidateRange(1, 24)]
        [ValidateNotNullOrEmpty()]
        [uint32[]]
        ${Properties},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Copy-PvsServerProperties {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [guid]
        ${ServerIdFrom},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerNameFrom},

        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [ValidateNotNullOrEmpty()]
        [ValidateRange(1, 9)]
        [uint32[]]
        ${Properties},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Disable-PvsDeviceDiskLocator {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${DiskLocatorId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Dismount-PvsDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Dismount-PvsDisk', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Dismount-PvsDisk
    .ForwardHelpCategory Cmdlet

    #>


}

function Enable-PvsDeviceDiskLocator {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${DiskLocatorId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Export-PvsAuditTrail {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FileName},

        [datetime]
        ${EndDate},

        [switch]
        ${NoPurgeData}
   )

}

function Export-PvsDisk {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Export-PvsOemLicenses {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FileName},

        [Alias('Guid')]
        [guid]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsADAccount {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Domain},

        [Parameter(Mandatory=$true)]
        [ValidateLength(2, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name}
   )

}

function Get-PvsAuditActionParameter {
    [CmdletBinding()]
    param(
        [guid[]]
        ${AuditActionId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('AuditParameterName','Name','Value')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsAuditActionProperty {
    [CmdletBinding()]
    param(
        [guid[]]
        ${AuditActionId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('AuditPropertyName','Name','OldValue','NewValue')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsAuditActionSibling {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuditActionId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('AuditActionId','Guid','Type','ObjectId','ObjectName','Path','SiteId','SubId')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsAuditTrail {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuditActionId},

        [guid[]]
        ${ParentId},

        [guid[]]
        ${RootId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${DeviceId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [guid[]]
        ${DiskLocatorId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${UserName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${Domain},

        [datetime]
        ${BeginDate},

        [datetime]
        ${EndDate},

        [ValidateRange(0, 13)]
        [ValidateNotNullOrEmpty()]
        [uint32[]]
        ${Type},

        [ValidateRange(1, 7021)]
        [ValidateNotNullOrEmpty()]
        [uint32[]]
        ${Action},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('AuditActionId','Guid','Time','UserName','Domain','Type','Action','ObjectId','ObjectName','Path','SiteId','SubId','ParentId','RootId','Attachments')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsAuthGroup {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuthGroupId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string[]]
        ${AuthGroupName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [switch]
        ${Farm},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('AuthGroupId','Guid','AuthGroupName','Name','Description','Role')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsAuthGroupUsage {
    [CmdletBinding()]
    param(
        [guid[]]
        ${AuthGroupId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string[]]
        ${AuthGroupName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Id','Guid','Name','Role')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsCeipData {
    [CmdletBinding()]
    param(
        [ValidateLength(36, 36)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Uuid},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Enabled','Uuid','NextUpload','InProgress','ServerId','OneTimeUpload')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsCisData {
    [CmdletBinding()]
    param(
        [ValidateSet('CisDataId','Guid','UserName','UploadToken','Path','Password')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsCollection {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('CollectionId','Guid','CollectionName','Name','SiteId','SiteName','Description','TemplateDeviceId','TemplateDeviceName','LastAutoAddDeviceNumber','Enabled','DeviceCount','DeviceWithPVDCount','ActiveDeviceCount','MakActivateNeededCount','AutoAddPrefix','AutoAddSuffix','AutoAddZeroFill','AutoAddNumberLength','Role')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsConnection {
    [CmdletBinding()]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Get-PvsConnection', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Get-PvsConnection
    .ForwardHelpCategory Cmdlet

    #>


}

function Get-PvsCreateDiskStatus {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsDevice {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${BdmBoot},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('DeviceId','Guid','DeviceName','Name','CollectionId','CollectionName','SiteId','SiteName','Description','DeviceMac','BootFrom','ClassName','Port','Enabled','LocalDiskEnabled','Role','Authentication','User','Password','Active','Template','AdTimestamp','AdSignature','AdPassword','LogLevel','DomainName','DomainObjectSID','DomainControllerName','DomainTimeCreated','Type','PvdDriveLetter','LocalWriteCacheDiskSize','VirtualHostingPoolId','HypVmId','TemporaryVersionSet','BdmBoot','BdmType','BdmFormat','BdmUpdated','BdmCreated','XsPvsProxyUuid')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDeviceBootstrap {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Bootstrap','Name','MenuText')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDeviceCount {
    [CmdletBinding()]
    param(
        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsDeviceDiskLocatorEnabled {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${DiskLocatorId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string]
        ${DiskLocatorName},

        [guid]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsDeviceDiskTempVersion {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${DiskLocatorId},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [ValidateLength(1, 10)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Version},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('DeviceId','Guid','DeviceName','Name','DiskLocatorId','DiskLocatorName','SiteId','SiteName','StoreId','StoreName','Version')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDeviceInfo {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 1)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${BdmBoot},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteViewName},

        [switch]
        ${OnlyActive},

        [ValidateRange(0, 2)]
        [uint32]
        ${MakLicenseActivated},

        [uint32]
        ${Version},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('DeviceId','Guid','DeviceName','Name','CollectionId','CollectionName','SiteId','SiteName','Description','DeviceMac','BootFrom','ClassName','Port','Enabled','LocalDiskEnabled','Role','Authentication','User','Password','Active','Template','AdTimestamp','AdSignature','AdPassword','LogLevel','DomainName','DomainObjectSID','DomainControllerName','DomainTimeCreated','Type','PvdDriveLetter','LocalWriteCacheDiskSize','VirtualHostingPoolId','HypVmId','TemporaryVersionSet','BdmBoot','BdmType','BdmFormat','BdmUpdated','BdmCreated','XsPvsProxyUuid','Ip','ServerPortConnection','ServerIpConnection','ServerId','ServerName','DiskLocatorId','DiskLocatorName','DiskVersion','DiskVersionAccess','DiskFileName','Status','LicenseType','MakLicenseActivated','Model','License')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDevicePersonality {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Name','Value')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDeviceStatus {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('DeviceId','Guid','DeviceName','Name','Ip','ServerPortConnection','ServerIpConnection','ServerId','ServerName','DiskLocatorId','DiskLocatorName','DiskVersion','DiskVersionAccess','DiskFileName','Status','LicenseType','MakLicenseActivated')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDirectory {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [ValidateLength(1, 101)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsDisk {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Class','ImageType','DiskSize','VhdBlockSize','LogicalSectorSize','WriteCacheSize','AutoUpdateEnabled','ActivationDateEnabled','AdPasswordEnabled','HaEnabled','PrinterManagementEnabled','WriteCacheType','LicenseMode','ActiveDate','LongDescription','OperatingSystem','OsType','SerialNumber','Date','Author','Title','Company','InternalName','OriginalFile','HardwareTarget','MajorRelease','MinorRelease','Build','ClearCacheDisabled','VHDX')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskInfo {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${DeviceId},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${UpdateTaskId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${UpdateTaskName},

        [switch]
        ${Single},

        [switch]
        ${All},

        [switch]
        ${OnlyActive},

        [switch]
        ${UpdateDevice},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('DiskLocatorId','Guid','DiskLocatorName','Name','SiteId','SiteName','StoreId','StoreName','Description','MenuText','ServerId','ServerName','Enabled','Role','Mapped','EnabledForDevice','Active','RebalanceEnabled','RebalanceTriggerPercent','SubnetAffinity','DiskUpdateDeviceId','DiskUpdateDeviceName','TemporaryVersionSet','Class','ImageType','DiskSize','VhdBlockSize','LogicalSectorSize','WriteCacheSize','AutoUpdateEnabled','ActivationDateEnabled','AdPasswordEnabled','HaEnabled','PrinterManagementEnabled','WriteCacheType','LicenseMode','ActiveDate','LongDescription','OperatingSystem','OsType','SerialNumber','Date','Author','Title','Company','InternalName','OriginalFile','HardwareTarget','MajorRelease','MinorRelease','Build','ClearCacheDisabled','VHDX','DeviceCount','Locked')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskInventory {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Version','ServerId','ServerName','FilePath','FileTime','PropertiesTime','State','Active')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskLocator {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${DeviceId},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${UpdateTaskId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [switch]
        ${Single},

        [switch]
        ${All},

        [switch]
        ${OnlyActive},

        [switch]
        ${UpdateDevice},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('DiskLocatorId','Guid','DiskLocatorName','Name','SiteId','SiteName','StoreId','StoreName','Description','MenuText','ServerId','ServerName','Enabled','Role','Mapped','EnabledForDevice','Active','RebalanceEnabled','RebalanceTriggerPercent','SubnetAffinity','DiskUpdateDeviceId','DiskUpdateDeviceName','TemporaryVersionSet')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskLocatorCount {
    [CmdletBinding()]
    param(
        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${Single},

        [switch]
        ${All},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsDiskLocatorLock {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Exclusive','DeviceId','DeviceName','ServerId','ServerName','ReadOnly')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskUpdateDevice {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${UpdateTaskId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [switch]
        ${OnlyActive},

        [ValidateRange(0, 2)]
        [uint32]
        ${MakLicenseActivated},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('DeviceId','Guid','DeviceName','Name','VirtualHostingPoolId','VirtualHostingPoolName','DiskLocatorId','DiskLocatorName','SiteId','SiteName','StoreId','StoreName','Description','DeviceMac','Port','Active','AdTimestamp','AdSignature','LogLevel','DomainName','DomainObjectSID','DomainControllerName','DomainTimeCreated','AdPassword','Ip','ServerPortConnection','ServerIpConnection','ServerId','ServerName','DiskVersion','Status','LicenseType','MakLicenseActivated','Model','License')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskUpdateStatus {
    [CmdletBinding()]
    param(
        [guid[]]
        ${UpdateTaskId},

        [guid[]]
        ${DeviceId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [Alias('Guid')]
        [guid[]]
        ${DiskUpdateTaskId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('DiskUpdateTaskId','Guid','UpdateTaskId','UpdateTaskName','Description','DiskLocatorId','DiskLocatorName','Name','VirtualHostingPoolId','VirtualHostingPoolName','DeviceId','DeviceName','SiteId','SiteName','StoreId','StoreName','PreviousResult','PreviousResultMessage','CurrentStatus','CurrentStatusMessage')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsDiskVersion {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [ValidateRange(1, 3)]
        [uint32]
        ${Type},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Version','Description','Type','CreateDate','ScheduledDate','DeleteWhenFree','Access','DiskFileName','Name','DeviceCount','GoodInventoryStatus','TaskId','CanDelete','CanMerge','CanMergeBase','CanPromote','CanRevertTest','CanRevertMaintenance','CanSetScheduledDate','CanOverride','IsPending','TemporaryVersionSet')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsExists {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHostingPoolName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${UpdateTaskName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string]
        ${DiskLocatorName},

        [guid]
        ${SiteId},

        [guid]
        ${StoreId}
   )

}

function Get-PvsFarm {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${FarmId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('FarmId','Guid','FarmName','Name','Description','AutoAddEnabled','AuditingEnabled','LastAuditArchiveDate','DefaultSiteId','DefaultSiteName','OfflineDatabaseSupportEnabled','AdGroupsEnabled','LicenseServer','LicenseServerPort','LicenseTradeUp','AutomaticMergeEnabled','MaxVersions','MergeMode','DatabaseServerName','DatabaseInstanceName','DatabaseName','FailoverPartnerServerName','FailoverPartnerInstanceName','MultiSubnetFailover','Role')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsFarmView {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${FarmViewId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('FarmViewId','Guid','FarmViewName','Name','Description','DeviceCount','ActiveDeviceCount','MakActivateNeededCount')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsGroup {
    [CmdletBinding()]
    param(
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Domain},

        [ValidateLength(1, 20)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${User},

        [switch]
        ${AdGroupsEnabled},

        [ValidateSet('Name','Guid')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsLocalServer {
    [CmdletBinding()]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Get-PvsLocalServer', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Get-PvsLocalServer
    .ForwardHelpCategory Cmdlet

    #>


}

function Get-PvsMaintenanceVersionExists {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsMinimumLastAutoAddDeviceNumber {
    [CmdletBinding()]
    param(
        [guid]
        ${CollectionId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateLength(1, 12)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AutoAddPrefix},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 12)]
        [string]
        ${AutoAddSuffix},

        [uint32]
        ${AutoAddNumberLength},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsMountedDisk {
    [CmdletBinding()]
    param(
        [guid]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [guid]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsMountedDriveLetter {
    [CmdletBinding()]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Get-PvsMountedDriveLetter', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Get-PvsMountedDriveLetter
    .ForwardHelpCategory Cmdlet

    #>


}

function Get-PvsNewDiskVersion {
    [CmdletBinding()]
    param(
        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [switch]
        ${AutoAddEnabled},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Name','Status')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServer {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${DiskLocatorId},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [switch]
        ${All},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('ServerId','Guid','ServerName','Name','SiteId','SiteName','Description','AdMaxPasswordAge','LicenseTimeout','VDiskCreatePacing','FirstPort','LastPort','ThreadsPerPort','BuffersPerThread','ServerCacheTimeout','IoBurstSize','MaxTransmissionUnits','MaxBootDevicesAllowed','MaxBootSeconds','BootPauseSeconds','AdMaxPasswordAgeEnabled','EventLoggingEnabled','NonBlockingIoEnabled','Role','Ip','InitialQueryConnectionPoolSize','InitialTransactionConnectionPoolSize','MaxQueryConnectionPoolSize','MaxTransactionConnectionPoolSize','RefreshInterval','UnusedDbConnectionTimeout','BusyDbConnectionRetryCount','BusyDbConnectionRetryInterval','LocalConcurrentIoLimit','RemoteConcurrentIoLimit','Active','LogLevel','LogFileSizeMax','LogFileBackupCopiesMax','PowerRating','ServerFqdn','ManagementIp','LastCeipUploadAttempt','LastBugReportAttempt','LastBugReportStatus','LastBugReportResult','LastBugReportSummary')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerBiosBootstrap {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Enabled','DhcpEnabled','Lookup','VerboseMode','InterruptSafeMode','PaeMode','BootFromHdOnFail','RecoveryTime','PollingTimeout','GeneralTimeout','ServerName','Name','Bootserver1_Ip','Bootserver1_Port','Bootserver2_Ip','Bootserver2_Port','Bootserver3_Ip','Bootserver3_Port','Bootserver4_Ip','Bootserver4_Port','Domain','DnsIpAddress1','DnsIpAddress2')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerBootstrap {
    [CmdletBinding()]
    param(
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('Bootserver1_Ip','Bootserver1_Netmask','Bootserver1_Gateway','Bootserver1_Port','Bootserver2_Ip','Bootserver2_Netmask','Bootserver2_Gateway','Bootserver2_Port','Bootserver3_Ip','Bootserver3_Netmask','Bootserver3_Gateway','Bootserver3_Port','Bootserver4_Ip','Bootserver4_Netmask','Bootserver4_Gateway','Bootserver4_Port','VerboseMode','InterruptSafeMode','PaeMode','BootFromHdOnFail','RecoveryTime','PollingTimeout','GeneralTimeout')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerBootstrapName {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsServerCount {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid]
        ${SiteId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsServerInfo {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${DiskLocatorId},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [switch]
        ${All},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('ServerId','Guid','ServerName','Name','SiteId','SiteName','Description','AdMaxPasswordAge','LicenseTimeout','VDiskCreatePacing','FirstPort','LastPort','ThreadsPerPort','BuffersPerThread','ServerCacheTimeout','IoBurstSize','MaxTransmissionUnits','MaxBootDevicesAllowed','MaxBootSeconds','BootPauseSeconds','AdMaxPasswordAgeEnabled','EventLoggingEnabled','NonBlockingIoEnabled','Role','Ip','InitialQueryConnectionPoolSize','InitialTransactionConnectionPoolSize','MaxQueryConnectionPoolSize','MaxTransactionConnectionPoolSize','RefreshInterval','UnusedDbConnectionTimeout','BusyDbConnectionRetryCount','BusyDbConnectionRetryInterval','LocalConcurrentIoLimit','RemoteConcurrentIoLimit','Active','LogLevel','LogFileSizeMax','LogFileBackupCopiesMax','PowerRating','ServerFqdn','ManagementIp','LastCeipUploadAttempt','LastBugReportAttempt','LastBugReportStatus','LastBugReportResult','LastBugReportSummary','ContactIp','ContactPort','DeviceCount')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerName {
    [CmdletBinding()]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Get-PvsServerName', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Get-PvsServerName
    .ForwardHelpCategory Cmdlet

    #>


}

function Get-PvsServerStatus {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('ServerId','Guid','ServerName','Name','Ip','Port','DeviceCount','Status')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerStore {
    [CmdletBinding()]
    param(
        [guid[]]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('StoreId','StoreName','ServerId','ServerName','Path','CachePath')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsServerStoreActiveDeviceCount {
    [CmdletBinding()]
    param(
        [guid]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsSite {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${SiteId},

        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('SiteId','Guid','SiteName','Name','Description','DefaultCollectionId','DefaultCollectionName','InventoryFilePollingInterval','EnableDiskUpdate','DiskUpdateServerId','DiskUpdateServerName','MakUser','MakPassword','Role')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsSiteView {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('SiteViewId','Guid','SiteViewName','Name','SiteId','SiteName','Description','DeviceCount','DeviceWithPVDCount','ActiveDeviceCount','MakActivateNeededCount','Role')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsStore {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${StoreId},

        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('StoreId','Guid','StoreName','Name','SiteId','SiteName','Description','Path','CachePath','Role','PathType')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsStoreFreeSpace {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid]
        ${StoreId},

        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [guid]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName}
   )

}

function Get-PvsStoreSharedOrServerPath {
    [CmdletBinding()]
    param(
        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('StoreId','StoreName','Path')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsTask {
    [CmdletBinding()]
    param(
        [uint32]
        ${TaskId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [ValidateRange(0, 2)]
        [uint32]
        ${State},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('TaskId','SiteId','SiteName','Handle','ServerFqdn','Ip','Port','StartTime','ExpirationTime','State','CommandType','Command','MapiException','Results')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsTaskStatus {
    [CmdletBinding()]
    param(
        [uint32]
        ${TaskId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Get-PvsUndefinedDisk {
    [CmdletBinding()]
    param(
        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [switch]
        ${AutoAddEnabled},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('Name','Status','VHDX')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsUpdateTask {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${UpdateTaskId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('UpdateTaskId','Guid','UpdateTaskName','Name','SiteId','SiteName','Description','Enabled','Hour','Minute','Recurrence','DayMask','Date','MonthlyOffset','EsdType','PreUpdateScript','PreVmScript','PostUpdateScript','PostVmScript','Domain','OrganizationUnit','PostUpdateApprove')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsUploadCeip {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 3)]
        [string]
        ${OneTimeUpload}
   )

}

function Get-PvsVersion {
    [CmdletBinding()]
    param(
        [ValidateSet('MapiVersion','DbVersion','Type','DbEdition','DbSize','MapiVersionNumber')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Get-PvsVirtualHostingPool {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${VirtualHostingPoolId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${VirtualHostingPoolName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateNotNullOrEmpty()]
        [ValidateSet('VirtualHostingPoolId','Guid','VirtualHostingPoolName','Name','SiteId','SiteName','Type','Description','Server','Port','Datacenter','UpdateLimit','UpdateTimeout','ShutdownTimeout','UserName','Password','XdHostingUnitUuid','PrepopulateEnabled','XsPvsSiteUuid','PlatformVersion','XdHcHypervisorConnectionName','XdHcHypervisorConnectionUid','XdHcRevision','XdHcCustomProperties','XdHcSslThumbprints')]
        [string[]]
        ${Fields}
   )

}

function Get-PvsXDSite {
    [CmdletBinding()]
    param(
        [Alias('Guid')]
        [guid[]]
        ${XdSiteId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object},

        [ValidateSet('XdSiteId','Guid','ConfigServices')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Fields}
   )

}

function Grant-PvsAuthGroup {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuthGroupId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string[]]
        ${AuthGroupName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [ValidateRange(300, 400)]
        [uint32]
        ${Role},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Import-PvsDevices {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FileName},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [switch]
        ${CopyTemplate},

        [switch]
        ${DoNotCreateNewSites},

        [switch]
        ${DoNotCreateNewCollections},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Import-PvsDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [guid]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [string]
        ${MenuText},

        [switch]
        ${Enabled},

        [switch]
        ${RebalanceEnabled},

        [ValidateRange(5, 5000)]
        [uint32]
        ${RebalanceTriggerPercent},

        [ValidateRange(0, 2)]
        [uint32]
        ${SubnetAffinity},

        [switch]
        ${VHDX},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Import-PvsOemLicenses {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FileName}
   )

}

function Invoke-PvsActivateDeviceMAK {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${MakUsedToActivate},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Invoke-PvsMarkDown {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [guid[]]
        ${DeviceId},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${ServerId},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Invoke-PvsPromoteDiskVersion {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [datetime]
        ${ScheduledDate},

        [uint32]
        ${TestVersion},

        [switch]
        ${Test},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Invoke-PvsRebalanceDevices {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Invoke-PvsRevertDiskVersion {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [switch]
        ${Test},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Merge-PvsDisk {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [ValidateRange(0, 2)]
        [uint32]
        ${Access},

        [switch]
        ${NewBase},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Mount-PvsDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [guid]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [uint32]
        ${MaxDiskLetterWaitSeconds},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Move-PvsDeviceToCollection {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [switch]
        ${CopyTemplate},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Move-PvsServerToSite {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function New-PvsAuthGroup {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 450)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AuthGroupName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description}
   )

}

function New-PvsCeipData {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(0, 1)]
        [uint32]
        ${Enabled},

        [datetime]
        ${NextUpload},

        [ValidateRange(0, 0)]
        [uint32]
        ${InProgress},

        [guid]
        ${ServerId},

        [ValidateRange(0, 0)]
        [uint32]
        ${OneTimeUpload}
   )

}

function New-PvsCisData {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${UserName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Path},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password}
   )

}

function New-PvsCollection {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [ValidateRange(0, 0)]
        [uint32]
        ${LastAutoAddDeviceNumber},

        [switch]
        ${Disabled},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 12)]
        [string]
        ${AutoAddPrefix},

        [ValidateLength(1, 12)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AutoAddSuffix},

        [switch]
        ${NoAutoAddZeroFill},

        [ValidateRange(3, 9)]
        [uint32]
        ${AutoAddNumberLength}
   )

}

function New-PvsDevice {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string]
        ${DeviceName},

        [guid]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(Mandatory=$true)]
        [object]
        ${DeviceMac},

        [ValidateRange(1, 3)]
        [uint32]
        ${BootFrom},

        [ValidateLength(1, 41)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ClassName},

        [ValidateRange(1025, 65534)]
        [uint32]
        ${Port},

        [switch]
        ${Disabled},

        [switch]
        ${LocalDiskEnabled},

        [ValidateRange(0, 2)]
        [uint32]
        ${Authentication},

        [ValidateLength(1, 20)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${User},

        [ValidateLength(1, 100)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password},

        [switch]
        ${CopyTemplate},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdTimestamp},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdSignature},

        [ValidateLength(1, 256)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AdPassword},

        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainName},

        [ValidateLength(1, 186)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainObjectSID},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 4000)]
        [string]
        ${DomainControllerName},

        [datetime]
        ${DomainTimeCreated},

        [ValidateRange(0, 2)]
        [uint32]
        ${Type},

        [ValidateRange(0, 2048)]
        [uint32]
        ${LocalWriteCacheDiskSize},

        [guid]
        ${VirtualHostingPoolId},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${HypVmId},

        [switch]
        ${BdmBoot},

        [ValidateRange(0, 0)]
        [uint32]
        ${BdmType},

        [ValidateRange(0, 0)]
        [uint32]
        ${BdmFormat},

        [datetime]
        ${BdmUpdated},

        [datetime]
        ${BdmCreated},

        [guid]
        ${XsPvsProxyUuid},

        [ValidateNotNullOrEmpty()]
        [string]
        ${EnableXsProxy}
   )

}

function New-PvsDeviceWithPersonalvDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [guid]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [Parameter(Mandatory=$true)]
        [guid]
        ${DiskLocatorId},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(Mandatory=$true)]
        [object]
        ${DeviceMac},

        [ValidateRange(1025, 65534)]
        [uint32]
        ${Port},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdTimestamp},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdSignature},

        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainName},

        [ValidateLength(1, 186)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainObjectSID},

        [ValidateLength(1, 4000)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainControllerName},

        [datetime]
        ${DomainTimeCreated},

        [ValidateRange(3, 4)]
        [uint32]
        ${Type},

        [ValidateLength(1, 1)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PvdDriveLetter},

        [ValidateRange(0, 2048)]
        [uint32]
        ${LocalWriteCacheDiskSize},

        [switch]
        ${BdmBoot},

        [guid]
        ${XdSiteId},

        [ValidateRange(0, 0)]
        [uint32]
        ${XdCatalogId},

        [guid]
        ${VirtualHostingPoolId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${EnableXsProxy}
   )

}

function New-PvsDirectory {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 101)]
        [string[]]
        ${Path},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function New-PvsDiskLocator {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string]
        ${DiskLocatorName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [string]
        ${MenuText},

        [guid]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [switch]
        ${Disabled},

        [switch]
        ${RebalanceEnabled},

        [ValidateRange(5, 5000)]
        [uint32]
        ${RebalanceTriggerPercent},

        [ValidateRange(0, 2)]
        [uint32]
        ${SubnetAffinity},

        [ValidateNotNullOrEmpty()]
        [string]
        ${NewDiskWriteCacheType},

        [switch]
        ${VHDX}
   )

}

function New-PvsDiskMaintenanceVersion {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [guid]
        ${DiskLocatorId},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function New-PvsDiskUpdateDevice {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [guid]
        ${VirtualHostingPoolId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHostingPoolName},

        [Parameter(Mandatory=$true)]
        [guid]
        ${DiskLocatorId},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [object]
        ${DeviceMac},

        [ValidateRange(1025, 65534)]
        [uint32]
        ${Port},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdTimestamp},

        [ValidateRange(0, 0)]
        [uint32]
        ${AdSignature},

        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${DomainName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 186)]
        [string]
        ${DomainObjectSID},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 4000)]
        [string]
        ${DomainControllerName},

        [datetime]
        ${DomainTimeCreated},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 256)]
        [string]
        ${AdPassword}
   )

}

function New-PvsFarmView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description}
   )

}

function New-PvsServer {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [ValidateRange(1, 30)]
        [uint32]
        ${AdMaxPasswordAge},

        [ValidateRange(15, 300)]
        [uint32]
        ${LicenseTimeout},

        [ValidateRange(0, 5)]
        [uint32]
        ${VDiskCreatePacing},

        [ValidateRange(1025, 65534)]
        [uint32]
        ${FirstPort},

        [ValidateRange(1025, 65534)]
        [uint32]
        ${LastPort},

        [ValidateRange(1, 60)]
        [uint32]
        ${ThreadsPerPort},

        [ValidateRange(1, 128)]
        [uint32]
        ${BuffersPerThread},

        [ValidateRange(5, 60)]
        [uint32]
        ${ServerCacheTimeout},

        [ValidateRange(4096, 61440)]
        [uint32]
        ${IoBurstSize},

        [ValidateRange(502, 16426)]
        [uint32]
        ${MaxTransmissionUnits},

        [ValidateRange(1, 1000)]
        [uint32]
        ${MaxBootDevicesAllowed},

        [ValidateRange(10, 900)]
        [uint32]
        ${MaxBootSeconds},

        [ValidateRange(1, 60)]
        [uint32]
        ${BootPauseSeconds},

        [switch]
        ${AdMaxPasswordAgeEnabled},

        [switch]
        ${EventLoggingEnabled},

        [switch]
        ${NonBlockingIoDisabled},

        [Parameter(Mandatory=$true)]
        [string[]]
        ${Ip},

        [ValidateRange(1, 1000)]
        [uint32]
        ${InitialQueryConnectionPoolSize},

        [ValidateRange(1, 1000)]
        [uint32]
        ${InitialTransactionConnectionPoolSize},

        [ValidateRange(1, 32767)]
        [uint32]
        ${MaxQueryConnectionPoolSize},

        [ValidateRange(1, 32767)]
        [uint32]
        ${MaxTransactionConnectionPoolSize},

        [ValidateRange(0, 32767)]
        [uint32]
        ${RefreshInterval},

        [ValidateRange(0, 32767)]
        [uint32]
        ${UnusedDbConnectionTimeout},

        [ValidateRange(0, 32767)]
        [uint32]
        ${BusyDbConnectionRetryCount},

        [ValidateRange(0, 10000)]
        [uint32]
        ${BusyDbConnectionRetryInterval},

        [ValidateRange(0, 128)]
        [uint32]
        ${LocalConcurrentIoLimit},

        [ValidateRange(0, 128)]
        [uint32]
        ${RemoteConcurrentIoLimit},

        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [ValidateRange(1, 50)]
        [uint32]
        ${LogFileSizeMax},

        [ValidateRange(1, 50)]
        [uint32]
        ${LogFileBackupCopiesMax},

        [ValidateRange(0.1, 1000)]
        [float]
        ${PowerRating},

        [datetime]
        ${LastCeipUploadAttempt},

        [datetime]
        ${LastBugReportAttempt},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${LastBugReportStatus},

        [ValidateLength(1, 4000)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LastBugReportResult},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${LastBugReportSummary}
   )

}

function New-PvsSite {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [ValidateRange(1, 600)]
        [uint32]
        ${InventoryFilePollingInterval},

        [switch]
        ${EnableDiskUpdate},

        [guid]
        ${DiskUpdateServerId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskUpdateServerName},

        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${MakUser},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [string]
        ${MakPassword},

        [ValidateNotNullOrEmpty()]
        [string]
        ${EnableXsProxy},

        [Parameter(Mandatory=$true)]
        [guid]
        ${VirtualHostingPoolId},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHostingPoolName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XsPvsSiteUuid}
   )

}

function New-PvsSiteView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description}
   )

}

function New-PvsStore {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(Mandatory=$true)]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [string[]]
        ${CachePath}
   )

}

function New-PvsUpdateTask {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${UpdateTaskName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [switch]
        ${Disabled},

        [ValidateRange(0, 23)]
        [uint32]
        ${Hour},

        [ValidateRange(0, 59)]
        [uint32]
        ${Minute},

        [ValidateRange(0, 5)]
        [uint32]
        ${Recurrence},

        [ValidateRange(1, 255)]
        [uint32]
        ${DayMask},

        [ValidateRange(1, 31)]
        [uint32[]]
        ${Date},

        [ValidateRange(0, 5)]
        [uint32]
        ${MonthlyOffset},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${EsdType},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PreUpdateScript},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PreVmScript},

        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PostUpdateScript},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${PostVmScript},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Domain},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${OrganizationUnit},

        [ValidateRange(0, 2)]
        [uint32]
        ${PostUpdateApprove}
   )

}

function New-PvsVirtualHostingPool {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${VirtualHostingPoolName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [ValidateRange(0, 3)]
        [uint32]
        ${Type},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Server},

        [ValidateRange(80, 65534)]
        [uint32]
        ${Port},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Datacenter},

        [ValidateRange(2, 1000)]
        [uint32]
        ${UpdateLimit},

        [ValidateRange(2, 240)]
        [uint32]
        ${UpdateTimeout},

        [ValidateRange(2, 30)]
        [uint32]
        ${ShutdownTimeout},

        [Parameter(Mandatory=$true)]
        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${UserName},

        [Parameter(Mandatory=$true)]
        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password},

        [guid]
        ${XdHostingUnitUuid},

        [switch]
        ${PrepopulateEnabled},

        [guid]
        ${XsPvsSiteUuid},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PlatformVersion},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcHypervisorConnectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${XdHcHypervisorConnectionUid},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${XdHcRevision},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${XdHcCustomProperties},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcSslThumbprints},

        [ValidateNotNullOrEmpty()]
        [string]
        ${DisableHostXsProxy}
   )

}

function Remove-PvsAuthGroup {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuthGroupId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string[]]
        ${AuthGroupName},

        [switch]
        ${Force},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsCollection {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${CollectionId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDevice {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDeviceDiskCacheFile {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${DiskLocatorId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDeviceFromDomain {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${Domain},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDeviceFromView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteViewName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDirectory {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateLength(1, 101)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Path},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDiskFromUpdateTask {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${UpdateTaskId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDiskLocator {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [switch]
        ${DeleteDiskFile},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDiskLocatorFromDevice {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${DeviceId},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDiskUpdateDevice {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsDiskVersion {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsFarmView {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${FarmViewId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${FarmViewName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsServer {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsServerStore {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsSite {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${SiteId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsSiteView {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${SiteViewId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsStore {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${StoreId},

        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsUpdateTask {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${UpdateTaskId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Remove-PvsVirtualHostingPool {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${VirtualHostingPoolId},

        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${VirtualHostingPoolName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Reset-PvsDatabase {
    [CmdletBinding(ConfirmImpact='Medium')]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Reset-PvsDatabase', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Reset-PvsDatabase
    .ForwardHelpCategory Cmdlet

    #>


}

function Reset-PvsDeviceForDomain {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${CollectionId},

        [guid[]]
        ${SiteViewId},

        [guid[]]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${Domain},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string[]]
        ${OrganizationUnit},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Restart-PvsStreamService {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Revoke-PvsAuthGroup {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${AuthGroupId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string[]]
        ${AuthGroupName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${CollectionId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${CollectionName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Set-PvsAuthGroup {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${AuthGroup},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${AuthGroupId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 450)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AuthGroupName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 450)]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description}
   )

}

function Set-PvsCeipData {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${CeipData},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(36, 36)]
        [string]
        ${Uuid},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 1)]
        [uint32]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${NextUpload},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${InProgress},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${OneTimeUpload}
   )

}

function Set-PvsCisData {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${CisData},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${CisDataId},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${UserName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password}
   )

}

function Set-PvsCollection {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Collection},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${CollectionId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${CollectionName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${TemplateDeviceId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${TemplateDeviceName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${LastAutoAddDeviceNumber},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 12)]
        [string]
        ${AutoAddPrefix},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 12)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AutoAddSuffix},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AutoAddZeroFill},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(3, 9)]
        [uint32]
        ${AutoAddNumberLength}
   )

}

function Set-PvsConnection {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Position=0)]
        [Alias('Name')]
        [string]
        ${Server},

        [ValidateNotNullOrEmpty()]
        [ValidateRange(1025, 65534)]
        [int]
        ${Port},

        [string]
        ${User},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Domain},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Password},

        [switch]
        ${Persist},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Connection},

        [switch]
        ${PassThru}
   )

}

function Set-PvsDevice {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Device},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${DeviceId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DeviceName},

        [Parameter(ParameterSetName='nonObject')]
        [object]
        ${DeviceMac},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${CollectionId},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteViewId},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${FarmViewId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [object]
        ${MAC},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 3)]
        [uint32]
        ${BootFrom},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 41)]
        [string]
        ${ClassName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65534)]
        [uint32]
        ${Port},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${LocalDiskEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2)]
        [uint32]
        ${Authentication},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 20)]
        [string]
        ${User},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 100)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${AdTimestamp},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${AdSignature},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 256)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${AdPassword},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 186)]
        [string]
        ${DomainObjectSID},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 4000)]
        [string]
        ${DomainControllerName},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${DomainTimeCreated},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 4)]
        [uint32]
        ${Type},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2048)]
        [uint32]
        ${LocalWriteCacheDiskSize},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${BdmBoot},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${BdmType},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${BdmFormat},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${BdmUpdated},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${BdmCreated},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${XsPvsProxyUuid},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${EnableXsProxy}
   )

}

function Set-PvsDeviceBootstrap {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${DeviceBootstrap},

        [switch]
        ${PassThru}
   )

}

function Set-PvsDevicePersonality {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${DevicePersonality},

        [switch]
        ${PassThru}
   )

}

function Set-PvsDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Disk},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 40)]
        [string]
        ${Class},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 40)]
        [string]
        ${ImageType},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 131072)]
        [uint64]
        ${WriteCacheSize},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AutoUpdateEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${ActivationDateEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AdPasswordEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${HaEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${PrinterManagementEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 9)]
        [uint32]
        ${WriteCacheType},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2)]
        [uint32]
        ${LicenseMode},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${ActiveDate},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 399)]
        [string]
        ${LongDescription},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${OperatingSystem},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 40)]
        [string]
        ${OsType},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 36)]
        [string]
        ${SerialNumber},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 40)]
        [string]
        ${Date},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 40)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Author},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 40)]
        [string]
        ${Title},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 40)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Company},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 63)]
        [string]
        ${InternalName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 127)]
        [string]
        ${OriginalFile},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 127)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${HardwareTarget},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 4294967295)]
        [uint64]
        ${MajorRelease},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 4294967295)]
        [uint64]
        ${MinorRelease},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 4294967295)]
        [uint64]
        ${Build},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ClearCacheDisabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${VHDX}
   )

}

function Set-PvsDiskLocator {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${DiskLocator},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [string]
        ${MenuText},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${RebalanceEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(5, 5000)]
        [uint32]
        ${RebalanceTriggerPercent},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2)]
        [uint32]
        ${SubnetAffinity}
   )

}

function Set-PvsDiskUpdateDevice {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${DiskUpdateDevice},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${DeviceId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string]
        ${DeviceName},

        [Parameter(ParameterSetName='nonObject')]
        [object]
        ${DeviceMac},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${DiskLocatorId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string]
        ${DiskLocatorName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65534)]
        [uint32]
        ${Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${AdTimestamp},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 0)]
        [uint32]
        ${AdSignature},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 186)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainObjectSID},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 4000)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DomainControllerName},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${DomainTimeCreated},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 256)]
        [string]
        ${AdPassword}
   )

}

function Set-PvsDiskVersion {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${DiskVersion},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${DiskLocatorId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string]
        ${DiskLocatorName},

        [Parameter(Mandatory=$true)]
        [uint32]
        ${Version},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${ScheduledDate}
   )

}

function Set-PvsFarm {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Farm},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${FarmId},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AutoAddEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AuditingEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${LastAuditArchiveDate},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${DefaultSiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DefaultSiteName},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${OfflineDatabaseSupportEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${LicenseServer},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65534)]
        [uint32]
        ${LicenseServerPort},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${LicenseTradeUp},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AutomaticMergeEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(3, 50)]
        [uint32]
        ${MaxVersions},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2)]
        [uint32]
        ${MergeMode}
   )

}

function Set-PvsFarmView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${FarmView},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${FarmViewId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description}
   )

}

function Set-PvsOverrideVersion {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [uint32]
        ${Version},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Set-PvsServer {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Server},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 30)]
        [uint32]
        ${AdMaxPasswordAge},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(15, 300)]
        [uint32]
        ${LicenseTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 5)]
        [uint32]
        ${VDiskCreatePacing},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65534)]
        [uint32]
        ${FirstPort},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65534)]
        [uint32]
        ${LastPort},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 60)]
        [uint32]
        ${ThreadsPerPort},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 128)]
        [uint32]
        ${BuffersPerThread},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(5, 60)]
        [uint32]
        ${ServerCacheTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(4096, 61440)]
        [uint32]
        ${IoBurstSize},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(502, 16426)]
        [uint32]
        ${MaxTransmissionUnits},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 1000)]
        [uint32]
        ${MaxBootDevicesAllowed},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(10, 900)]
        [uint32]
        ${MaxBootSeconds},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 60)]
        [uint32]
        ${BootPauseSeconds},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${AdMaxPasswordAgeEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${EventLoggingEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${NonBlockingIoEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [string[]]
        ${Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 1000)]
        [uint32]
        ${InitialQueryConnectionPoolSize},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 1000)]
        [uint32]
        ${InitialTransactionConnectionPoolSize},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 32767)]
        [uint32]
        ${MaxQueryConnectionPoolSize},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 32767)]
        [uint32]
        ${MaxTransactionConnectionPoolSize},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 32767)]
        [uint32]
        ${RefreshInterval},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 32767)]
        [uint32]
        ${UnusedDbConnectionTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 32767)]
        [uint32]
        ${BusyDbConnectionRetryCount},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 10000)]
        [uint32]
        ${BusyDbConnectionRetryInterval},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 128)]
        [uint32]
        ${LocalConcurrentIoLimit},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 128)]
        [uint32]
        ${RemoteConcurrentIoLimit},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 6)]
        [uint32]
        ${LogLevel},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 50)]
        [uint32]
        ${LogFileSizeMax},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 50)]
        [uint32]
        ${LogFileBackupCopiesMax},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0.1, 1000)]
        [float]
        ${PowerRating},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${LastCeipUploadAttempt},

        [Parameter(ParameterSetName='nonObject')]
        [datetime]
        ${LastBugReportAttempt},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LastBugReportStatus},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 4000)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LastBugReportResult},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${LastBugReportSummary}
   )

}

function Set-PvsServerBiosBootstrap {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${ServerBiosBootstrap},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${DhcpEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Lookup},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${VerboseMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${InterruptSafeMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${PaeMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${BootFromHdOnFail},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(10, 60000)]
        [uint32]
        ${RecoveryTime},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1000, 60000)]
        [uint32]
        ${PollingTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1000, 60000)]
        [uint32]
        ${GeneralTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver1_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver1_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver2_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver2_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver3_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver3_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver4_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver4_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Domain},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DnsIpAddress1},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DnsIpAddress2}
   )

}

function Set-PvsServerBootstrap {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${ServerBootstrap},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver1_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver1_Netmask},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver1_Gateway},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver1_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver2_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver2_Netmask},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver2_Gateway},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver2_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver3_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver3_Netmask},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver3_Gateway},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver3_Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver4_Ip},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver4_Netmask},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Bootserver4_Gateway},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1025, 65536)]
        [uint32]
        ${Bootserver4_Port},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${VerboseMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${InterruptSafeMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${PaeMode},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${BootFromHdOnFail},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(10, 60000)]
        [uint32]
        ${RecoveryTime},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1000, 60000)]
        [uint32]
        ${PollingTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1000, 60000)]
        [uint32]
        ${GeneralTimeout}
   )

}

function Set-PvsServerStore {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${ServerStore},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${ServerId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Path},

        [Parameter(ParameterSetName='nonObject')]
        [string[]]
        ${CachePath}
   )

}

function Set-PvsSite {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Site},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${DefaultCollectionId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DefaultCollectionName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 600)]
        [uint32]
        ${InventoryFilePollingInterval},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${EnableDiskUpdate},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${DiskUpdateServerId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskUpdateServerName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${MakUser},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 64)]
        [string]
        ${MakPassword},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${EnableXsProxy},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${VirtualHostingPoolId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHostingPoolName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XsPvsSiteUuid}
   )

}

function Set-PvsSiteView {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${SiteView},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${SiteViewId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description}
   )

}

function Set-PvsStore {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${Store},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${StoreId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Path},

        [Parameter(ParameterSetName='nonObject')]
        [string[]]
        ${CachePath}
   )

}

function Set-PvsUpdateTask {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${UpdateTask},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${UpdateTaskId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${UpdateTaskName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${Enabled},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 23)]
        [uint32]
        ${Hour},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 59)]
        [uint32]
        ${Minute},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 5)]
        [uint32]
        ${Recurrence},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 255)]
        [uint32]
        ${DayMask},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(1, 31)]
        [uint32[]]
        ${Date},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 5)]
        [uint32]
        ${MonthlyOffset},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${EsdType},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PreUpdateScript},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${PreVmScript},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PostUpdateScript},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PostVmScript},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Domain},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 255)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${OrganizationUnit},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 2)]
        [uint32]
        ${PostUpdateApprove}
   )

}

function Set-PvsVirtualHostingPool {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${VirtualHostingPool},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${VirtualHostingPoolId},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Name')]
        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${VirtualHostingPoolName},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${SiteId},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${NewName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(0, 3)]
        [uint32]
        ${Type},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 255)]
        [string]
        ${Server},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(80, 65534)]
        [uint32]
        ${Port},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Datacenter},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(2, 1000)]
        [uint32]
        ${UpdateLimit},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(2, 240)]
        [uint32]
        ${UpdateTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateRange(2, 30)]
        [uint32]
        ${ShutdownTimeout},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${UserName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 64)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Password},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${XdHostingUnitUuid},

        [Parameter(ParameterSetName='nonObject')]
        [switch]
        ${PrepopulateEnabled},

        [Parameter(ParameterSetName='nonObject')]
        [guid]
        ${XsPvsSiteUuid},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${PlatformVersion},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcHypervisorConnectionName},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcHypervisorConnectionUid},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcRevision},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcCustomProperties},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${XdHcSslThumbprints},

        [Parameter(ParameterSetName='nonObject')]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DisableHostXsProxy}
   )

}

function Set-PvsXDSite {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(ParameterSetName='object', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
        [object]
        ${XDSite},

        [Parameter(ParameterSetName='nonObject')]
        [Alias('Guid')]
        [guid]
        ${XdSiteId},

        [switch]
        ${PassThru},

        [Parameter(ParameterSetName='nonObject')]
        [string[]]
        ${ConfigServices}
   )

}

function Start-PvsAutoUpdate {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsCreateDisk {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Name},

        [Parameter(Mandatory=$true)]
        [uint64]
        ${Size},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [guid]
        ${ServerId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string]
        ${ServerName},

        [ValidateLength(1, 250)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Description},

        [switch]
        ${CreateDiskDisabled},

        [switch]
        ${VHDX},

        [switch]
        ${Dynamic},

        [ValidateRange(512, 262144)]
        [uint32]
        ${VhdBlockSize},

        [ValidateRange(512, 4096)]
        [uint32]
        ${LogicalSectorSize},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDeviceBoot {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [ValidateCount(0, 216)]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateCount(0, 500)]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDeviceDiskTempVersionMode {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${DiskLocatorId},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDeviceReboot {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [ValidateCount(0, 216)]
        [guid[]]
        ${DeviceId},

        [ValidateCount(0, 500)]
        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [guid]
        ${DiskLocatorId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteViewName},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Message},

        [uint32]
        ${Delay},

        [uint32]
        ${Version},

        [guid]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDeviceShutdown {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [ValidateCount(0, 216)]
        [guid[]]
        ${DeviceId},

        [ValidateCount(0, 500)]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${FarmViewName},

        [guid]
        ${DiskLocatorId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteViewName},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${DiskLocatorName},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Message},

        [uint32]
        ${Delay},

        [uint32]
        ${Version},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [guid]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDeviceUpdateBdm {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [ValidateCount(0, 216)]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [ValidateCount(0, 500)]
        [string[]]
        ${DeviceName},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsDisplayMessage {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Message},

        [ValidateCount(0, 216)]
        [guid[]]
        ${DeviceId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [ValidateCount(0, 500)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid]
        ${CollectionId},

        [guid]
        ${SiteViewId},

        [guid]
        ${FarmViewId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${FarmViewName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${CollectionName},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteViewName},

        [guid]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsReportBug {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid]
        ${SiteId},

        [guid]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string]
        ${SiteName},

        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Summary},

        [ValidateNotNullOrEmpty()]
        [string]
        ${SrNumber},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 250)]
        [string]
        ${Description},

        [ValidateLength(1, 101)]
        [ValidateNotNullOrEmpty()]
        [string]
        ${Path},

        [datetime]
        ${DateTime},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsStreamService {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Start-PvsUpdateTask {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [guid[]]
        ${UpdateTaskId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Stop-PvsCreateDisk {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Name},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Stop-PvsDeviceDiskTempVersionMode {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DeviceId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 15)]
        [string[]]
        ${DeviceName},

        [object]
        ${DeviceMac},

        [guid[]]
        ${DiskLocatorId},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [ValidateLength(1, 52)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DiskLocatorName},

        [ValidateLength(1, 10)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${Version},

        [guid[]]
        ${StoreId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Stop-PvsStreamService {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 21)]
        [string[]]
        ${ServerName},

        [guid[]]
        ${SiteId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Stop-PvsTask {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [uint32]
        ${TaskId},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Stop-PvsUpdateTask {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [guid[]]
        ${UpdateTaskId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${UpdateTaskName},

        [guid[]]
        ${DeviceId},

        [ValidateLength(1, 15)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${DeviceName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Test-PvsDirectory {
    [CmdletBinding(ConfirmImpact='Low')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${ServerId},

        [Alias('Name')]
        [ValidateLength(1, 21)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${ServerName},

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 101)]
        [string[]]
        ${Path},

        [switch]
        ${ReadOnly},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Unlock-PvsAllDisk {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Unlock-PvsDisk {
    [CmdletBinding(ConfirmImpact='Medium')]
    param(
        [Alias('Guid')]
        [guid[]]
        ${DiskLocatorId},

        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 52)]
        [string[]]
        ${DiskLocatorName},

        [guid[]]
        ${OwnerId},

        [guid[]]
        ${SiteId},

        [ValidateLength(1, 50)]
        [ValidateNotNullOrEmpty()]
        [string[]]
        ${SiteName},

        [guid[]]
        ${StoreId},

        [ValidateNotNullOrEmpty()]
        [ValidateLength(1, 50)]
        [string[]]
        ${StoreName},

        [Parameter(ValueFromPipeline=$true)]
        [object]
        ${Object}
   )

}

function Update-PvsInventory {
    [CmdletBinding()]
    param()

    begin
    {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Citrix.PVS.SnapIn\Update-PvsInventory', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }

    process
    {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }

    end
    {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    <#

    .ForwardHelpTargetName Citrix.PVS.SnapIn\Update-PvsInventory
    .ForwardHelpCategory Cmdlet

    #>


}


