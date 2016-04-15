Remove-Module "../NuGet.psm1" -ErrorAction SilentlyContinue
$Result = Import-Module "../NuGet.psm1"
"PWD: $pwd"
"CWD: $cwd"
$NugetModule.Config | Format-Table
$commandLineSearchPaths = $NugetModule.Config.CommandLineSearchPaths
$commandLineSearchPaths | Format-Table

Write-Host "==========================================================="
Write-Host "NuGet Samples"
Write-Host "==========================================================="

Write-Host "1. Let's find nuget.exe"
$nugetExePath = Find-NuGetExe
Write-Host "====> NuGet.exe Path: $nugetExePath"

man Restore-NuGetPackages