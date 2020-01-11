<#
	===========================================================================
	 Created with: 	Vscode
	 Created on:   	13/10/2019 6:51 PM
	 Created by:   	Strooth
	 Organization: 	Trollnet
	 Filename:     	XgApi.psd1
	 -------------------------------------------------------------------------
	 Module Manifest
	-------------------------------------------------------------------------
	 Module Name: XgApi
	===========================================================================
#>


@{

	# Script module or binary module file associated with this manifest
	ModuleToProcess        = 'XgApi.psm1'

	# Version number of this module.
	ModuleVersion          = '1.0.0.0'

	# ID used to uniquely identify this module
	GUID                   = 'e29f98e8-9ddf-4f28-a15e-6f9c842af53c'

	# Author of this module
	Author                 = 'Strooth'

	# Company or vendor of this module
	CompanyName            = ''

	# Copyright statement for this module
	Copyright              = '(c) 2019. All rights reserved.'

	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion      = '3.0'

	# Name of the Windows PowerShell host required by this module
	PowerShellHostName     = ''

	# Minimum version of the Windows PowerShell host required by this module
	PowerShellHostVersion  = ''

	# Minimum version of the .NET Framework required by this module
	DotNetFrameworkVersion = ''

	# Minimum version of the common language runtime (CLR) required by this module
	CLRVersion             = '4.0.30319.42000'

	# Processor architecture (None, X86, Amd64, IA64) required by this module
	ProcessorArchitecture  = ''

	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules        = 'PoShSQLLocalDB',
	'Write-ObjectToSQL',
	'pposhsqltools',
	'sqlserver',
	'BetterCredentials',
	'PowerShell.PowerLibrary.Encryption'

	# Assemblies that must be loaded prior to importing this module
	#	RequiredAssemblies     = @()

	# Script files (.ps1) that are run in the caller's environment prior to
	# importing this module
	#ScriptsToProcess       = @(
	#	'Resources\XgHelpers.ps1', 'Resources\XgClasses.ps1'
	#)
	#ScriptsToProcess = @('Resources\XgHelpers.ps1','Resources\XgClasses.ps1', 'XgApi.ps1')

	# Type files (.ps1xml) to be loaded when importing this module
	#	TypesToProcess         = @()

	# Format files (.ps1xml) to be loaded when importing this module
	#	FormatsToProcess       = @()

	# Modules to import as nested modules of the module specified in
	# ModuleToProcess
	#NestedModules = @('Private\XgHelpers.ps1','Private\XgClasses.ps1')

	NestedModules          = 'Resources/Convert-FromXgKey.ps1',
	'Resources/Convert-ToXgKey.ps1',
	'Resources/Convert-XgCredential.ps1',
	'Resources/XgClasses.ps1',
	'Resources/XgHelpers.ps1',
	'Resources/Xg-Api.ps1',
	'Resources/Xg-Uri.ps1',
	'Resources/Xg-Credentials.ps1'

	# Functions to export from this module
	FunctionsToExport      = #'Convert-FromXgKey',
	#'Convert-ToXgKey',
	#'Convert-XgCredential',
	#'Get-XgUri',
	#'New-XgUri',
	#'Rem-XgUri',
	#'Remove-XgUri',
	#'Set-XgUri',
	#'Cred-XgUri',
	#'write-log',
	#'Get-InputFromType',
	#'confirm-cmd',
	#'get-answer',
	#'write-heading',
	#'Convert-FromBase64ToAscii',
	#'Convert-FromAsciiToBase64',
	#'get-vectors',
	#'make-alias',
	#'get-securestring',
	#'set-sstring',
	#'get-plaintext',
	'Get-XgCredential',
	'Set-XgCredential',
	'Remove-XgCredential',
	'New-XgCredential',
	'Get-XgApi',
	'New-XgApi',
	'Remove-XgApi',
	'Set-XgApi',
	'Clear-XgApi',
	'Invoke-XgApi',
	'Show-XgApi',
	'Get-XgApiFilter'

	# Cmdlets to export from this module
	CmdletsToExport        = @()

	# Variables to export from this module
	VariablesToExport      = '*'

	# Aliases to export from this module
	AliasesToExport        =
	'Rem-XgCredential',
	'Rem-XgApi'
	#For performanace, list alias explicity

	# List of all modules packaged with this module
	#ModuleList             = @()

	# List of all files packaged with this module
	#FileList               = @()

	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	#PrivateData            = @{

	#Support for PowerShellGet galleries.
	#		PSData = @{

	# Tags applied to this module. These help with module discovery in online galleries.
	# Tags = @()

	# A URL to the license for this module.
	# LicenseUri = ''

	# A URL to the main website for this project.
	# ProjectUri = ''

	# A URL to an icon representing this module.
	# IconUri = ''

	# ReleaseNotes of this module
	# ReleaseNotes = ''

	#		} # End of PSData hashtable

	#	} # End of PrivateData hashtable
}







