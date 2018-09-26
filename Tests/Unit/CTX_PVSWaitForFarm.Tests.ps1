[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
param ()

$here = Split-Path -Parent $MyInvocation.MyCommand.Path;
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.ps1', '')
$moduleRoot = Split-Path -Path (Split-Path -Path $here -Parent) -Parent;
Import-Module (Join-Path $moduleRoot -ChildPath "\DSCResources\$sut\$sut.psm1") -Force;

InModuleScope $sut {

    Describe 'CitrixPVS\CTX_PVSWaitForFarm' {

        Mock -CommandName Start-Sleep -MockWith { }

        $testParams = @{
            FarmName = "MockFarm";
            ExistingPVSServer = "vslabcdc01.lab.local";
            RetryIntervalSec = 30;
            RetryCount = 10;
        }

        Context 'Get-TargetResource' {

            $testParams = @{
                FarmName = "MockFarm";
                ExistingPVSServer = "vslabcdc01.lab.local";
                RetryIntervalSec = 1;
                RetryCount = 10;
            }

            Mock -CommandName LoadPVSConsoleSnapin -MockWith { }

            It 'Returns a System.Collections.Hashtable.' {
                $targetResource = Get-TargetResource @testParams;
                $targetResource -is [System.Collections.Hashtable] | Should Be $true;
            }

            Mock -CommandName LoadPVSConsoleSnapin -MockWith { Throw "Error" }

            It 'Throws when PVS Console module cannot be loaded.' {
                { Get-TargetResource @testParams } | Should Throw;
            }

        } #end context Get-TargetResource

        Context 'Test-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $testParams = @{
                FarmName = "MockFarm";
                ExistingPVSServer = "vslabcdc01.lab.local";
                RetryIntervalSec = 30;
                RetryCount = 10;
            }
            Mock -CommandName LoadPVSConsoleSnapin -MockWith { }
            Mock -CommandName TestPVSFarm -MockWith { return $true; }

            It 'Returns a System.Boolean type.' {
                Mock -CommandName TestPVSFarm -MockWith { return $true; }
                $targetResource = Test-TargetResource @testParams;
                $targetResource -is [System.Boolean] | Should Be $true;
            }

            It 'Returns True when PVS Farm exists' {
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $true;
            }

            It 'Returns False when PVS Farm doesn''t exist' {
                Mock -CommandName TestPVSFarm -MockWith { return $false; }
                $targetResource = Test-TargetResource @testParams;
                $targetResource | Should Be $false;
            }

        } #end context Test-TargetResource
#>
        Context 'Set-TargetResource' {

            Mock -CommandName TestPVSFarm -MockWith { return $false; }

            It "Runs TestPVSFarm function $($testParams['RetryCount']) times when PVS Farm cannot be found." {
                Set-TargetResource @testParams;
                Assert-MockCalled -CommandName TestPVSFarm -Times $testParams['RetryCount'] -Exactly -Scope It
            }

            Mock -CommandName TestPVSFarm -MockWith { return $true; }

            It "Runs TestPVSFarm function once when PVS Farm can be found." {
                Set-TargetResource @testParams;
                Assert-MockCalled -CommandName TestPVSFarm -Times 1 -Exactly -Scope It
            }

        } #end context Set-TargetResource
    } #end describe CitrixPVS
} #end inmodulescope
