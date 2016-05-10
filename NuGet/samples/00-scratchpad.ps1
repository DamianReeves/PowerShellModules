Remove-Module "../NuGet.psm1" -ErrorAction SilentlyContinue
$Result = Import-Module "../NuGet.psm1"
"PWD: $pwd"
"CWD: $cwd"
$NuGetSettings | Format-Table
$commandLineSearchPaths = $NuGetSettings.CommandLineSearchPaths
$commandLineSearchPaths | Format-Table

Write-Host "==========================================================="
Write-Host "NuGet Samples"
Write-Host "==========================================================="

Write-Host "1. Let's find nuget.exe: "
$nugetExePath = Find-NuGetExe
Write-Host "====> NuGet.exe Path: $nugetExePath"

man Restore-NuGetPackages

Write-Host "2. Install packages: "
Install-NuGetPackages Microsoft.AspNet.JsonPatch -OutputDirectory c:\temp\packages -Prerelease
Install-NuGetPackages Pester -OutputDirectory c:\temp\packages -Prerelease -ExcludeVersion