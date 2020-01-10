<#
	.NOTES
	===========================================================================
	 Created with: 	Vscode
	 Created on:   	13/10/2019 6:51 PM
	 Created by:   	Strooth
	 Organization: 	Trollnet
	 Filename:     	XgApi.psm1
	-------------------------------------------------------------------------
	 Module Name: XgApi
	===========================================================================
#>
# This will be used in file paths below, so avoid using spaces and special characters
#Script/Module name
Get-ChildItem -Path $PSScriptRoot | Unblock-File
set-variable -name moduleconnection -value "Data Source=$env:COMPUTERNAME\MSQL;Initial Catalog=XgApi;Integrated Security=True;User ID=;Password=" -Scope global -Force
$warning = "Please run New-XgApi first to setup and configure the api connection url"
$msg = "Running New-XgApi -Test will populate with an example which you can see by running Show-XgApi `
Alternatively once setup you can use the class variable `$xg.api.####"
Write-Warning -Message $warning
write-host $msg