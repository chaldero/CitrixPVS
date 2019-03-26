[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
param ()

$here = Split-Path -Parent $MyInvocation.MyCommand.Path;
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.ps1', '')
$moduleRoot = Split-Path -Path (Split-Path -Path $here -Parent) -Parent;
Import-Module (Join-Path $moduleRoot -ChildPath "\DSCResources\$sut\$sut.psm1") -Force;

# Import Stub Module of PVS Console Snapin
Import-Module (Join-Path $moduleRoot -ChildPath "\Tests\Unit\Stubs\PVSConsoleStub.psm1") -Force -Global;

$pathli = (Join-Path $moduleRoot -ChildPath "\Tests\Unit\Stubs\PVSConsoleStub.psm1")
#Write-Host $pathli

InModuleScope $sut {

    Describe 'CitrixPVS\CTX_PVSFarmConfig' {

        Context 'Get-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                FarmName                      = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
                MaxVersions                   = 5
                MergeMode                     = 2
                PVSServerName                 = "localhost"
                SoapPort                      = 54321
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
            }

            $MockPVSFarm = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarm'
                Name                          = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
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

            Mock -CommandName 'LoadPVSConsoleSnapin' -MockWith {   } 
            Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
            

            It 'Returns a System.Collections.Hashtable.' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Get-TargetResource @testParams;
                $targetResource -is [System.Collections.Hashtable] | Should Be $true;
            }

            It "Returns 'FarmName' = $($MockPVSFarm.FarmName)"  {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Get-TargetResource @testParams;
                $targetResource['FarmName'] | Should Be $MockPVSFarm.FarmName;
            }

            It 'Throws when PVS Console Snapin cannot be loaded' {
                Mock -CommandName LoadPVSConsoleSnapin -MockWith {throw 'Problem'}
                { Set-TargetResource @testParams } | Should Throw 
            }

        } #end context Get-TargetResource

        Context 'Test-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                FarmName                      = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
                MaxVersions                   = 5
                MergeMode                     = 2
                PVSServerName                 = "localhost"
                SoapPort                      = 54321
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
            }

            $MockPVSFarm = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarm'
                Name                          = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
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

            Mock -CommandName LoadPVSConsoleSnapin -MockWith {  } 

            It 'Returns a System.Boolean type.' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Test-TargetResource @testParams;
                $targetResource -is [System.Boolean] | Should Be $true;
            }

            It 'Returns True when all parameters are set properly' {
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarm }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $true;
            }

            It 'Returns False when FarmName is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.FarmName = "Bad"
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when Description is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.Description = "Bad"
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when AutoAddEnabled is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.AutoAddEnabled = $true
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when AuditingEnabled is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.AuditingEnabled = $true
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when DefaultSiteName is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.DefaultSiteName = $true
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when OfflineDatabaseSupportEnabled  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.OfflineDatabaseSupportEnabled  = $false
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when LicenseServer  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.LicenseServer  = "BAD"
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when LicenseServerPort  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.LicenseServerPort  = 0
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when LicenseTradeUp  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.LicenseTradeUp  = $false
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when AutomaticMergeEnabled  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.AutomaticMergeEnabled  = $true
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when MaxVersions  is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.MaxVersions  = 1
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

            It 'Returns False when MergeMode is incorrect' {
                $MockPVSFarmIncorrect = $MockPVSFarm
                $MockPVSFarmIncorrect.MergeMode  = 1
                Mock -CommandName Get-PvsFarm -MockWith { return $MockPVSFarmIncorrect }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

        } #end context Test-TargetResource        

        Context 'Set-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            Mock -CommandName LoadPVSConsoleSnapin -MockWith {  } 

            $testParams = @{
                FarmName                      = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
                MaxVersions                   = 5
                MergeMode                     = 2
                PVSServerName                 = "localhost"
                SoapPort                      = 54321
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
            }

            $testParamsBAD = @{
                FarmName                      = '_MockFarm'
                Description                   = '_Description of MockFarm'
                AutoAddEnabled                = $True
                AuditingEnabled               = $True
                DefaultSiteName               = '_Lucerne'
                OfflineDatabaseSupportEnabled = $False
                LicenseServer                 = '_vslabcdc01.lab.local'
                LicenseServerPort             = 1
                LicenseTradeUp                = $False
                AutomaticMergeEnabled         = $True
                MaxVersions                   = 3
                MergeMode                     = 1
                PVSServerName                 = "localhost"
                SoapPort                      = 54321
                Username                    = 'testlab.local\sa-pvs'
                Password                    = $mycreds
            }

            $MockPVSFarm = [PSCustomObject]@{
                FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                FarmName                      = 'MockFarm'
                Name                          = 'MockFarm'
                Description                   = 'Description of MockFarm'
                AutoAddEnabled                = $False
                AuditingEnabled               = $False
                LastAuditArchiveDate          = ''
                DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                DefaultSiteName               = 'Lucerne'
                OfflineDatabaseSupportEnabled = $True
                AdGroupsEnabled               = 'True'
                LicenseServer                 = 'vslabcdc01.lab.local'
                LicenseServerPort             = 27000
                LicenseTradeUp                = $True
                AutomaticMergeEnabled         = $False
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



            It 'Doesn''t throw when executing Set-TargetResource' {
                Mock -CommandName Get-PVSFarm -MockWith { return $MockPVSFarm }
                Mock -CommandName Set-PVSFarm -MockWith { }
                { Set-TargetResource @testParams } | Should not Throw 
            } 
            
            #$properties = Get-Member -InputObject $testParams -MemberType NoteProperty
            $properties = $testParams.Keys

            foreach ($property in $properties)  
            {
                $testParamsTEMP = $testParams.Clone()
                $testParamsTEMP[$property] = $testParamsBAD[$property]

                $MockPVSFarm = [PSCustomObject]@{
                    FarmId                        = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                    Guid                          = 'b39d0d24-693f-4a92-916b-ccb0f7c8057d'
                    FarmName                      = 'MockFarm'
                    Name                          = 'MockFarm'
                    Description                   = 'Description of MockFarm'
                    AutoAddEnabled                = $False
                    AuditingEnabled               = $False
                    LastAuditArchiveDate          = ''
                    DefaultSiteId                 = 'ed0d4b95-73cf-44c1-80ea-559dfc6a4d64'
                    DefaultSiteName               = 'Lucerne'
                    OfflineDatabaseSupportEnabled = $True
                    AdGroupsEnabled               = 'True'
                    LicenseServer                 = 'vslabcdc01.lab.local'
                    LicenseServerPort             = 27000
                    LicenseTradeUp                = $True
                    AutomaticMergeEnabled         = $False
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
                if ($property -notin @("Username";"Password";"PVSServerName";"SoapPort"))
                {
                    It "should execute Write-Verbose 1 time when $property is incorrect" {
                        Mock -CommandName Get-PVSFarm -MockWith { return $MockPVSFarm }
                        Mock -CommandName Set-PVSFarm -MockWith { }
                        Mock -CommandName Write-Verbose -ParameterFilter {$Message -like "Changing*"} -MockWith {}
                        Set-TargetResource @testParamsTEMP                        
                        Assert-MockCalled -CommandName Write-Verbose -ParameterFilter {$Message -like "Changing*" } -Exactly 1 -Scope It;
                    }   
                }
                
                Clear-Variable testParamsTEMP

            }       
                  
        } #end context Set-TargetResource

    } #end describe CitrixPVS
} #end inmodulescope
