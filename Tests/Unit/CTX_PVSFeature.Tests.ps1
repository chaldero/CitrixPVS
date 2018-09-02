[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidGlobalVars', '')]
param ()

$here = Split-Path -Parent $MyInvocation.MyCommand.Path;
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace('.Tests.ps1', '')
$moduleRoot = Split-Path -Path (Split-Path -Path $here -Parent) -Parent;
Import-Module (Join-Path $moduleRoot -ChildPath "\DSCResources\$sut\$sut.psm1") -Force;

InModuleScope $sut {

    Describe 'CitrixPVS\CTX_PVSFeature' {

        Context 'Get-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                Roles = 'Console';
                SourcePath = $testDrivePath;
                Credential = $mycreds;
                LogPath = $testDrivePath;
                Ensure = 'Present';
            }

            It 'Returns a System.Collections.Hashtable.' {
                Mock -CommandName TestPVSInstalledRole -MockWith { }
                $targetResource = Get-TargetResource @testParams;
                $targetResource -is [System.Collections.Hashtable] | Should Be $true;
            }

            It 'Returns "Ensure" = "Present" when role is installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $true; }
                $targetResource = Get-TargetResource @testParams;
                $targetResource['Ensure'] | Should Be 'Present';
            }

            It 'Returns "Ensure" = "Absent" when role is not installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $false; }
                $targetResource = Get-TargetResource @testParams;
                $targetResource['Ensure'] | Should Be 'Absent';
            }

        } #end context Get-TargetResource

        Context 'Test-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root;

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)

            $testParams = @{
                Roles = 'Console';
                SourcePath = $testDrivePath;
                Credential = $mycreds;
                LogPath = $testDrivePath;
            }

            It 'Returns a System.Boolean type.' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $true; }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource -is [System.Boolean] | Should Be $true;
            }

            It 'Returns True when "Ensure" = "Present" and role is installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $true; }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource | Should Be $true;
            }

            It 'Returns False when "Ensure" = "Present" and role is not installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $false; }
                $targetResource = Test-TargetResource @testParams -Ensure 'Present';
                $targetResource | Should Be $false;
            }

            It 'Returns False when "Ensure" = "Absent" and role is not installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $false; }
                $targetResource = Test-TargetResource @testParams -Ensure 'Absent';
                $targetResource | Should Be $true;
            }

            It 'Returns True when "Ensure" = "Absent" and role is installed' {
                Mock -CommandName TestPVSInstalledRole -MockWith { return $true; }
                $targetResource = Test-TargetResource @testParams -Ensure 'Absent';
                $targetResource | Should Be $false;
            }

        } #end context Test-TargetResource
#>
        Context 'Set-TargetResource' {
            $testDrivePath = (Get-PSDrive -Name TestDrive).Root

            $secpasswd = ConvertTo-SecureString "password" -AsPlainText -Force
            $mycreds = New-Object System.Management.Automation.PSCredential ("username", $secpasswd)


            It 'Throws with an invalid directory path.' {
                Mock -CommandName Test-Path -MockWith { return $false; }
                { Set-TargetResource -Roles 'Console' -SourcePath 'Z:\HopefullyThisPathNeverExists' -Credential $mycreds -Ensure 'Present' } | Should Throw;
            }

            It 'Throws with a valid file path.' {
                [ref] $null = New-Item -Path 'TestDrive:\PVS_Console_x64.exe' -ItemType File;
                { Set-TargetResource -Role 'Controller' -SourcePath "$testDrivePath\Console\PVS_Console_x64.exe" -Ensure 'Present' } | Should Throw;
            }

            foreach ($state in @('Present','Absent')) {
                foreach ($role in @('Console','TDS', 'Server')) {
                    It "runs a setup 1 time when ""Ensure"" = ""$state"", ""Role"" = ""$($role -join ',')"" and exit code ""0""" {
                        [System.Int32] $global:DSCMachineStatus = 0;
                        Mock -CommandName StartWaitProcess -MockWith { return 0; }
                        Mock -CommandName ResolvePVSSetupMedia -MockWith { return $testDrivePath; }
                        Mock -CommandName ResolvePVSSetupArguments -MockWith { }
                        Mock -CommandName GetPVSUninstallString -MockWith { "UninstallString" }
                        Mock -CommandName Test-Path -MockWith { return $true; }
                        Mock -CommandName Rename-ItemProperty -ParameterFilter {$Path -eq "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager"} -MockWith {} 
                        Set-TargetResource -Roles $role -SourcePath $testDrivePath -Ensure $state -Credential $mycreds;
                        [System.Int32] $global:DSCMachineStatus | Should Be 0;
                        Assert-MockCalled -CommandName StartWaitProcess -Exactly 1 -Scope It;
                    }
                }
            }

            foreach ($state in @('Present','Absent')) {
                foreach ($role in @(@('Console','Server'),@('Console','TDS'),@('Server','TDS'))) {
                    It "Does run 2 different setups when ""Ensure"" = ""$state"", ""Role"" = ""$($role -join ',')"" and exit code ""0""" {
                        [System.Int32] $global:DSCMachineStatus = 0;
                        Mock -CommandName StartWaitProcess -MockWith { return 0; }
                        Mock -CommandName ResolvePVSSetupMedia -MockWith { return $testDrivePath; }
                        Mock -CommandName ResolvePVSSetupArguments -MockWith { }
                        Mock -CommandName GetPVSUninstallString -MockWith { "UninstallString" }
                        Mock -CommandName Test-Path -MockWith { return $true; }
                        Mock -CommandName Rename-ItemProperty -ParameterFilter {$Path -eq "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager"} -MockWith {} 
                        Set-TargetResource -Roles $role -SourcePath $testDrivePath -Ensure $state -Credential $mycreds;
                        [System.Int32] $global:DSCMachineStatus | Should Be 0;
                        Assert-MockCalled -CommandName StartWaitProcess -Exactly 2 -Scope It;
                    }
                }
            }

        } #end context Set-TargetResource
    } #end describe CitrixPVS
} #end inmodulescope
