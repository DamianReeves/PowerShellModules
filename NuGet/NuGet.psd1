@{

# Script module or binary module file associated with this manifest.
ModuleToProcess = 'NuGet.psm1'

# Version number of this module.
ModuleVersion = '0.1.0'

# ID used to uniquely identify this module
GUID = '03392baa-4f5c-4a74-868d-fccba4e9d890'

# Author of this module
Author = 'Damian Reeves'

# Copyright statement for this module
Copyright = 'Copyright (c) 2016 by Damian Reeves, licensed under MIT License.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '2.0'

# Functions to export from this module
FunctionsToExport = @(
    'Restore-NuGetPackages',
    'Find-NuGetExe',
    'Install-NuGetPackages'
)

# # Cmdlets to export from this module
# CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = @(
    'NuGetModule'
)


# # Aliases to export from this module
# AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()


# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

