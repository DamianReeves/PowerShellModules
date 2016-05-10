
function Find-NuGetExe {
    [CmdletBinding()]
    param(
        [string[]]
        $AdditionalSearchPaths=$null,
        [switch]
        $ExcludePathVariableFromSearch
    )
    
    $SearchPaths = @()
    
    if($AdditionalSearchPaths -ne $null) {
        $SearchPaths = $SearchPaths + $AdditionalSearchPaths
    }
    
    $SearchPaths = $SearchPaths + $script:NuGetSettings.CommandLineSearchPaths
    
    if(-not($ExcludePathVariableFromSearch.IsPresent)) {
        $paths = $env:Path -split ";"
        $SearchPaths = $SearchPaths + $paths
    }
       
    foreach ($directory in $SearchPaths) {
        $candidatePath = Join-Path "$directory" "nuget.exe"
        if(Test-Path $candidatePath){
            return Join-Path $directory "nuget.exe" -Resolve
        }
    }
    
    $null
}

function Invoke-NuGetExeDownload {
    [CmdletBinding()]
    param(
        
    )
}

function Get-NuGetCommandLine {
    
}

function Restore-NuGetPackages {
<#
.SYNOPSIS 
Restores NuGet packages using the available NuGet command line executable.

.PARAMETER Target
A solution file, package.config, or package.json file which is used as the basis of the restore operation if it is provided.

.PARAMETER Sources
The source feeds to use in package resolution.
#>    
    [CmdletBinding()]
    param(
        [Parameter(Position=0, Mandatory=$false)]
        [string]$Target=$null,
        [Parameter()]
        [string[]]$Sources=$null
    )
    
    
}

function Ensure-NuGetExeIsAvailable {
    [CmdletBinding()]
    param(
        [string[]]
        $AdditionalSearchPaths=$null,
        [switch]
        $ExcludePathVariableFromSearch
    )
    if($Script:NuGetExe -eq $null){
        $Script:NuGetExe = Find-NuGetExe -AdditionalSearchPaths $AdditionalSearchPaths -ExcludePathVariableFromSearch:$ExcludePathVariableFromSearch
    }
}

function Install-NuGetPackages {
    param(
        [Parameter(Position=0)]
        [string[]]
        $PackageIds,
        [string]
        $OutputDirectory=$null,
        [switch]
        $Prerelease,
        [switch]
        $ExcludeVersion
    )
    Ensure-NuGetExeIsAvailable
    $nugetExe = $Script:NuGetExe
    $commandLineArgs = @();
    if(-not [String]::IsNullOrEmpty($OutputDirectory)){
        $commandLineArgs += @('-OutputDirectory', $OutputDirectory)
    }
    
    if($ExcludeVersion.IsPresent){
        $commandLineArgs += @('-ExcludeVersion')
    }
    
    if($Prerelease.IsPresent){
        $commandLineArgs += @('-Prerelease')
    }
    
    foreach ($package in $PackageIds) {
        $installArgs = @("install",$package)
        $installArgs += $commandLineArgs
        &$nugetExe $installArgs     
    }    
}

$Script:NuGetExe = $null
$script:NuGetSettings = @{}
$NuGetSettings = new-object psobject -Property @{
    CommandLineSearchPaths = @(".",".\.nuget",".\nuget",".build", (Join-Path $env:LOCALAPPDATA "NuGet"));
}

Export-ModuleMember -Function Find-NuGetExe, Invoke-NuGetExeDownload, Install-NuGetpackages, Restore-NuGetPackages -Variable NuGetSettings
