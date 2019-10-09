[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
param ()

$here = Split-Path -Parent $MyInvocation.MyCommand.Path;
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.ps1', '')
$moduleRoot = Split-Path -Path (Split-Path -Path $here -Parent) -Parent;
Import-Module (Join-Path $moduleRoot -ChildPath "\DSCResources\$sut\$sut.psm1") -Force;

# Import Stub Module of PVS Console Snapin
Import-Module (Join-Path $moduleRoot -ChildPath "\Tests\Unit\Stubs\PVSConsoleStub.psm1") -Force -Global;

InModuleScope $sut {

    Describe 'CitrixPVS\CTX_PVSJoinFarm' {

        Context 'Get-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                Ensure                      = 'Present'
                IsSingleInstance            = 'Yes'
                DatabaseServer              = 'sqlserver.testlab.local'
                DatabaseName                = 'PVS'
                DatabaseInstance            = 'SQLEXPRESS'
                FarmName                    = 'MockFarm'
                SiteName                    = 'Lucerne'
                StoreName                   = 'Store'
                LicenseServer               = 'vstestlabcdc01.testlab.local'
                LicenseServerPort           = 27000
                StreamingIP                 = '192.168.2.14'
                ManagementIP                 = '192.168.2.14'
                StreamingIPs                = '192.168.2.14'
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
                PXEService                  = $false
                FirstStreamingPort          = 6890
                LastStreamingPort           = 6910
                PasswordManagementInverval  = 7
                SoapPort                    = 54321
                BootstrapFile               = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'
            }

            $MockPVSServerInfo = [PSCustomObject]@{
                ContactIp           = $testParams.StreamingIPs
                ManagementIp        = $testParams.ManagementIp
                FirstPort           = $testParams.FirstStreamingPort
                LastPort            = $testParams.LastStreamingPort
                AdMaxPasswordAge    = $testparams.PasswordManagementInverval
            }

            $Bootservers = [PSCustomObject]@{
                Bootserver1_Ip = "192.168.144.15"
                Bootserver2_Ip = "192.168.144.16"
                Bootserver3_Ip = "0.0.0.0"
                Bootserver4_Ip = "0.0.0.0"
            }

            $MockPVSFarm = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarm'
                Name                          = 'MockFarm'
                Description                   = ''
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $False
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $True
                MaxVersions                   = 5
                MergeMode                     = 2
                DatabaseServerName            = 'vslabcdc01.lab.local'
                DatabaseInstanceName          = 'SQLEXPRESS'
                DatabaseName                  = 'PVS'
                FailoverPartnerServerName     = ''
                FailoverPartnerInstanceName   = ''
                MultiSubnetFailover           = $False
                Role                          = 100
            }

            $MockPVSFarmIncorrect = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarmBad'
                Name                          = 'MockFarmBad'
                Description                   = ''
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $False
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $True
                MaxVersions                   = 5
                MergeMode                     = 2
                DatabaseServerName            = 'vslabcdc01.lab.local'
                DatabaseInstanceName          = 'SQLEXPRESS'
                DatabaseName                  = 'PVS'
                FailoverPartnerServerName     = ''
                FailoverPartnerInstanceName   = ''
                MultiSubnetFailover           = $False
                Role                          = 100
            }

            Mock -CommandName Get-ItemPropertyValue -MockWith { return 'c:\wrongpath\' } -ParameterFilter { $Name -like 'ConsoleTargetDir' }
            Mock -CommandName Test-Path -MockWith { return $true } -ParameterFilter {$Path.EndsWith("Citrix.PVS.SnapIn.dll") }
            Mock -CommandName Import-Module -MockWith { }
            Mock -CommandName Get-PvsStore -MockWith { return "MockStore" }
            Mock -CommandName Get-PvsAuthGroup -MockWith { return [PSCustomObject]@{AuthGroupName = 'mock.local/Users/Domain Admins'} }
            Mock -CommandName Get-PvsCollection -MockWith { return [PSCustomObject]@{CollectionName = 'XenApp'} }
            Mock -CommandName Get-PvsServerInfo -MockWith { return $MockPVSServerInfo }
            Mock -CommandName Get-PvsConnection -MockWith { return [PSCustomObject]@{Port = 54321} }
            Mock -CommandName Get-PvsServerBootstrap -MockWith { return $Bootservers }
            Mock -CommandName Get-ItemPropertyValue -ParameterFilter {$Path -like 'HKLM:\Software\Citrix\ProvisioningServices\Admin\'} 
            

            It 'Returns a System.Collections.Hashtable.' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Get-TargetResource @testParams;
                $targetResource -is [System.Collections.Hashtable] | Should Be $true;
            }

            It 'Returns "Ensure" = "Present" when PVS Farm exists' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm  }
                $targetResource = Get-TargetResource @testParams;
                $targetResource['Ensure'] | Should Be 'Present';
            }

            It 'Returns "Ensure" = "Absent" when Farm doesn''t exist'  {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Get-TargetResource @testParams;
                $targetResource['Ensure'] | Should Be 'Absent';
            }

        } #end context Get-TargetResource

        Context 'Test-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                IsSingleInstance            = 'Yes'
                DatabaseServer              = 'sqlserver.testlab.local'
                DatabaseName                = 'PVS'
                DatabaseInstance            = 'SQLEXPRESS'
                FarmName                    = 'MockFarm'
                SiteName                    = 'Lucerne'
                StoreName                   = 'Store'
                LicenseServer               = 'vstestlabcdc01.testlab.local'
                LicenseServerPort           = 27000
                StreamingIP                 = '192.168.2.14'
                ManagementIP                 = '192.168.2.14'
                StreamingIPs                = '192.168.2.14'
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
                PXEService                  = $false
                FirstStreamingPort          = 6890
                LastStreamingPort           = 6910
                PasswordManagementInverval  = 7
                SoapPort                    = 54321
                BootstrapFile               = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'
            }

            $MockPVSServerInfo = [PSCustomObject]@{
                ContactIp           = $testParams.StreamingIPs
                ManagementIp        = $testParams.ManagementIp
                FirstPort           = $testParams.FirstStreamingPort
                LastPort            = $testParams.LastStreamingPort
                AdMaxPasswordAge    = $testparams.PasswordManagementInverval
            }

            $Bootservers = [PSCustomObject]@{
                Bootserver1_Ip = "192.168.144.15"
                Bootserver2_Ip = "192.168.144.16"
                Bootserver3_Ip = "0.0.0.0"
                Bootserver4_Ip = "0.0.0.0"
            }

            $MockPVSFarm = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarm'
                Name                          = 'MockFarm'
                Description                   = ''
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $False
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $True
                MaxVersions                   = 5
                MergeMode                     = 2
                DatabaseServerName            = 'vslabcdc01.lab.local'
                DatabaseInstanceName          = 'SQLEXPRESS'
                DatabaseName                  = 'PVS'
                FailoverPartnerServerName     = ''
                FailoverPartnerInstanceName   = ''
                MultiSubnetFailover           = $False
                Role                          = 100
            }

            $MockPVSFarmIncorrect = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarmBad'
                Name                          = 'MockFarmBad'
                Description                   = ''
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $False
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $True
                MaxVersions                   = 5
                MergeMode                     = 2
                DatabaseServerName            = 'vslabcdc01.lab.local'
                DatabaseInstanceName          = 'SQLEXPRESS'
                DatabaseName                  = 'PVS'
                FailoverPartnerServerName     = ''
                FailoverPartnerInstanceName   = ''
                MultiSubnetFailover           = $False
                Role                          = 100
            }

            Mock -CommandName Get-ItemPropertyValue -MockWith { return 'c:\wrongpath\' } -ParameterFilter { $Name -like 'ConsoleTargetDir' }
            Mock -CommandName Test-Path -MockWith { return $true } -ParameterFilter {$Path.EndsWith("Citrix.PVS.SnapIn.dll") }
            Mock -CommandName Import-Module -MockWith { }
            Mock -CommandName Get-PvsStore -MockWith { return "MockStore" }
            Mock -CommandName Get-PvsAuthGroup -MockWith { return [PSCustomObject]@{AuthGroupName = 'mock.local/Users/Domain Admins'} }
            Mock -CommandName Get-PvsCollection -MockWith { return [PSCustomObject]@{CollectionName = 'XenApp'} }
            Mock -CommandName Get-PvsServerInfo -MockWith { return $MockPVSServerInfo }
            Mock -CommandName Get-PvsConnection -MockWith { return [PSCustomObject]@{Port = 54321} }
            Mock -CommandName Get-PvsServerBootstrap -MockWith { return $Bootservers }
            Mock -CommandName Get-ItemPropertyValue -ParameterFilter {$Path -like 'HKLM:\Software\Citrix\ProvisioningServices\Admin\'} 

            It 'Returns a System.Boolean type.' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource -is [System.Boolean] | Should Be $true;
            }

            It 'Returns True when "Ensure" = "Present" and PVS Farm exists' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource | Should Be $true;
            }

            It 'Returns False when "Ensure" = "Present" and PVS Farm doesn''t exist' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource | Should Be $false;
            }

            It 'Returns False when "Ensure" = "Absent" and PVS Farm exists' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Test-TargetResource @testParams -Ensure 'Absent';
                $targetResource | Should Be $false;
            }

            It 'Returns True when "Ensure" = "Absent" and PVS Farm doesn''t exist' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                 $targetResource = Test-TargetResource @testParams -Ensure 'Absent';
                $targetResource | Should Be $true;
            }

        } #end context Test-TargetResource        

        Context 'Set-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                Ensure                      = 'Present'
                IsSingleInstance            = 'Yes'
                DatabaseServer              = 'sqlserver.testlab.local'
                DatabaseName                = 'PVS'
                DatabaseInstance            = 'SQLEXPRESS'
                FarmName                    = 'MockFarm'
                SiteName                    = 'Lucerne'
                StoreName                   = 'Store'
                LicenseServer               = 'vstestlabcdc01.testlab.local'
                LicenseServerPort           = 27000
                StreamingIP                 = '192.168.2.14'
                ManagementIP                 = '192.168.2.14'
                StreamingIPs                = '192.168.2.14'
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
                PXEService                  = $false
                FirstStreamingPort          = 6890
                LastStreamingPort           = 6910
                PasswordManagementInverval  = 7
                SoapPort                    = 54321
                BootstrapFile               = 'C:\ProgramData\Citrix\Provisioning Services\Tftpboot\ARDBP32.BIN'
            }

            It 'Throws when no active network card has been found' {
                Mock -CommandName Get-WmiObject -ParameterFilter {$Class -eq 'Win32_NetworkAdapter'} -MockWith {return @()}
                { Set-TargetResource @testParams } | Should Throw 
            }

            It 'Doesn''t throw when an active network card has been found' {
                $nic = [PSCustomObject]@{
                    ServiceName      = 'mrvlpcie8897'
                    MACAddress       = '00:00:00:00:00:00'
                    AdapterType      = 'Ethernet 802.3'
                    DeviceID         = 4
                    Name             = 'Marvell AVASTAR Wireless-AC Network Controller'
                    NetworkAddresses = ''
                    Speed            = 300000000
                }

                $ConfigWizardEXE = "$env:ProgramFiles\Citrix\Provisioning Services\ConfigWizard.exe"

                Mock -CommandName Get-WmiObject -ParameterFilter {$Class -eq 'Win32_NetworkAdapter'} -MockWith {return $nic}
                Mock -CommandName Get-WmiObject -ParameterFilter {$Class -eq 'Win32_NetworkAdapterConfiguration'} -MockWith {return @{IPAddress = @('192.168.2.15')} }
                Mock -CommandName Test-Path -ParameterFilter {$Path -eq $ConfigWizardEXE} -MockWith { return $true }
                Mock -CommandName Start-Process -MockWith { }
                Mock -CommandName Get-ItemPropertyValue -MockWith { return 'c:\wrongpath\' } -ParameterFilter { $Name -like 'ConsoleTargetDir' }
                Mock -CommandName Test-Path -MockWith { return $true } -ParameterFilter {$Path.EndsWith("Citrix.PVS.SnapIn.dll") }
                Mock -CommandName Import-Module -MockWith { }
                Mock -CommandName Get-PvsStore -MockWith { return @{ Name = "MockStore"; Path = $testDrivePath + "\Store" } }
                { Set-TargetResource @testParams } | Should not Throw 
            } 
            
            It "should execute Start-Process 1 time" {
                Set-TargetResource @testParams
                Assert-MockCalled -CommandName Start-Process -Exactly 1 -Scope It;
            }

            $content = get-content "$env:Temp\ConfigWizardPVS.ans" -Encoding UTF8

            It 'should set FarmConfiguration=2' {                
                $content | Select-String -Pattern ("FarmConfiguration=2") | Should be $true
            }

            if ($testParams['PXEService'])
            {
                It 'should set PXEServiceType=1' {
                    $content | Select-String -Pattern ("PXEServiceType=1") | Should BeTrue
                }
            }
            else {
                It 'should NOT set PXEServiceType=1' {
                    $content | Select-String -Pattern ("PXEServiceType=1") | Should Be $null
                }
            }            

            It "should set DatabaseServer=$($testParams['DatabaseServer'])" {
                $content | Select-String -Pattern ("DatabaseServer=" + $testParams['DatabaseServer']) | Should be $true
            }

            if ([string]::IsNullOrEmpty($testParams['DatabaseInstance']))
            {
                It 'should NOT set DatabaseInstance' {
                    $content | Select-String -Pattern ("DatabaseInstance=" + $testParams['DatabaseInstance']) | Should $null
                }
            }
            else {
                It "should set DatabaseInstance=$($testParams['DatabaseInstance'])" {
                    $content | Select-String -Pattern ("DatabaseInstance=" + $testParams['DatabaseInstance']) | Should BeTrue
                }
            }   

            It "should set FarmExisting=$($testParams['DatabaseName'])" {
                $content | Select-String -Pattern ("FarmExisting=" + $testParams['DatabaseName']) | Should be $true
            }

            It "should set ExistingSite=$($testParams['SiteName'])" {
                $content | Select-String -Pattern ("ExistingSite=" + $testParams['SiteName']) | Should be $true
            }

            It "should set Store=$($testParams['StoreName'])" {
                $content | Select-String -Pattern ("Store=" + $testParams['StoreName']) | Should be $true
            }

            It "should set LicenseServer=$($testParams['LicenseServer'])" {
                $content | Select-String -Pattern ([regex]::Escape("LicenseServer=" + $testParams['LicenseServer'])) | Should be $true
            }
            
            It "should set LicenseServerPort=$($testParams['LicenseServerPort'])" {
                $content | Select-String -Pattern ([regex]::Escape("LicenseServerPort=" + $testParams['LicenseServerPort'])) | Should be $true
            }

            It "should set UserName=$($testParams['Username'])" {
                $content | Select-String -Pattern ([regex]::Escape("UserName=" + $testParams['Username'])) | Should be $true
            }

            It "should set UserPass=$($testParams['Password'].GetNetworkCredential().Password)" {
                $content | Select-String -Pattern ([regex]::Escape("UserPass=" + $testParams['Password'].GetNetworkCredential().Password)) | Should be $true
            }

            It "should set PasswordManagementInterval=$($testParams['PasswordManagementInverval'])" {
                $content | Select-String -Pattern ("PasswordManagementInterval=" + $testParams['PasswordManagementInverval']) | Should be $true
            }

            It "should set StreamNetworkAdapterIP=$($testParams['StreamingIP'])" {
                $content | Select-String -Pattern ("StreamNetworkAdapterIP=" + $testParams['StreamingIP']) | Should be $true
            }

            It "should set ManagementNetworkAdapterIP=$($testParams['ManagementIP'])" {
                $content | Select-String -Pattern ("ManagementNetworkAdapterIP=" + $testParams['ManagementIP']) | Should be $true
            }

            It "should set IpcPortBase=$($testParams['FirstStreamingPort'])" {
                $content | Select-String -Pattern ("IpcPortBase=" + $testParams['FirstStreamingPort']) | Should be $true
            }

            It "should set IpcPortCount=$($testParams['LastStreamingPort']-$testParams['FirstStreamingPort'])" {
                $content | Select-String -Pattern ("IpcPortCount=" + ($testParams['LastStreamingPort']-$testParams['FirstStreamingPort'])) | Should be $true
            }

            It "should set SoapPort=$($testParams['SoapPort'])" {
                $content | Select-String -Pattern ("SoapPort=" + $testParams['SoapPort']) | Should be $true
            }

            It "should set SoapPort=$($testParams['BootstrapFile'])" {
                $content | Select-String -Pattern ([regex]::Escape("BootstrapFile=" + $testParams['BootstrapFile'])) | Should be $true
            }

            It "should set 'LS1=192.168.2.14,0.0.0.0,0.0.0.0,6910'" {
                $content | Select-String -Pattern ([regex]::Escape("LS1=192.168.2.14,0.0.0.0,0.0.0.0,6910")) | Should be $true
            }

        } #end context Set-TargetResource

    } #end describe CitrixPVS
} #end inmodulescope
