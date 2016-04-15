
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
    
    $SearchPaths = $SearchPaths + $script:NuGetModule.Config.CommandLineSearchPaths
    
    if(-not($ExcludePathVariableFromSearch.IsPresent)) {
        $paths = $env:Path -split ";"
        $SearchPaths = $SearchPaths + $paths
    }
       
    foreach ($directory in $SearchPaths) {
        $candidatePath = Join-Path $directory "nuget.exe"
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
    
}

function Install-NuGetPackages {
    param(
        [Parameter(Position=0)]
        [string[]]
        $PackageIds,
        $OutputDirectory=$null,
        [bool]
        $IncludeVersion
    )
}

$script:NuGetModule = @{}
$NuGetModule.Config = new-object psobject -Property @{
    CommandLineSearchPaths = @(".",".\.nuget",".\nuget",".build", (Join-Path $env:LOCALAPPDATA "NuGet\Exe\"));
}

Export-ModuleMember -Function Find-NuGetExe, Invoke-NuGetExeDownload, Install-NuGetpackages, Restore-NuGetPackages -Variable NuGetModule
