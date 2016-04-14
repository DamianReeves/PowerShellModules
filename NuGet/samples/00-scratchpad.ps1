$Result = Import-Module "../NuGet.psm1"
"PWD: $pwd"
"CWD: $cwd"
$NugetModule.Config | Format-Table
$commandLineSearchPaths = $NugetModule.Config.CommandLineSearchPaths
$commandLineSearchPaths | Format-Table
