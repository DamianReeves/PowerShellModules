
function Find-NuGetExe {
    [CmdletBinding()]
    param(
        [string[]]
        $SearchPaths=$null
    )
    
    if(-not ($SearchPaths)){
        $SearchPaths = $script:NuGetModule.Config.CommandLineSearchPaths
    }
}

function Invoke-NuGetExeDownload {
    [CmdletBinding()]
    param(
        
    )
}

function Get-NuGetCommandLine {
    
}

function Restore-NuGetPackages {
    param(
        $TargetDirectory
    )
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

Export-ModuleMember -Function Find-NuGetExe, Invoke-NuGetExeDownload, Install-NuGetpackages -Variable NuGetModule
