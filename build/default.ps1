properties {
    $rootDir = Join-Path (Get-ScriptDirectory) ".." -Resolve
    $toolsDir = Join-Path (Get-ScriptDirectory) "tools"    
    $buildDir = Join-Path $rootDir "build"
}

task default -depends ShowVariables, BuildTools-Install, DNVM-Install

task ShowVariables {
    Write-Host "ToolsDir: $toolsDir"
    #$nugetExe = $NugetModule.Nugetexe
    Write-Host "NuGetExe: $nugetExe"
    Write-Host "BuilDir: $buildDir"
}

task DNVM-Download {
    
}

task DNVM-Install -depends DNVM-Download {
    
}

task BuildTools-Install {
    
}

function Get-ScriptDirectory {
	if (Test-Path variable:\hostinvocation) {
		$FullPath = $hostinvocation.MyCommand.Path
	} else {
        $FullPath = (get-variable myinvocation -scope script).value.Mycommand.Definition 
	}    
    if (Test-Path $FullPath) {
        (Split-Path $FullPath) 
    } else {
        $FullPath=(Get-Location).path
        Write-Warning ("Get-ScriptDirectory: Powershell Host <" + $Host.name + "> may not be compatible with this function, the current directory <" + $FullPath + "> will be used.")
        $FullPath
	}
}