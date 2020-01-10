<#
	.NOTES
	===========================================================================
	 Created with: 	Vscode
	 Created on:   	13/10/2019 7:00 PM
	 Created by:   	Strooth
	 Organization: 	trollnet
	 Filename:     	Xg-Credentials.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
function Get-XgCredential()
{
	[CmdletBinding(DefaultParameterSetName = "0")]
	Param (
		[Parameter(ParameterSetName = '0', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[switch]$Search,
		[Parameter(ParameterSetName = '1', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xgcred]$Cred,
		[Parameter(ParameterSetName = '2', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[api]$api,
		[Parameter(ParameterSetName = '3', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xg]$xg
	)
	switch ($PsCmdlet.ParameterSetName)
 {
		0 { $get = [xgcred]::new().get() }
		1 { $get = [xgcred]::new().get($cred) }
		2 { $get = [xgcred]::new().get($api.cred) }
		3 { $get = [xgcred]::new().get($xg.api.cred) }
		Default { $get = [xgcred]::new().get() }
	}
	return $get
}
function Set-XgCredential()
{
	[CmdletBinding(DefaultParameterSetName = "0")]
	Param (
		[Parameter(ParameterSetName = '0', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[switch]$Search,
		[Parameter(ParameterSetName = '1', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xgcred]$Cred,
		[Parameter(ParameterSetName = '2', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[api]$api,
		[Parameter(ParameterSetName = '3', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xg]$xg
	)
	switch ($PsCmdlet.ParameterSetName)
 {
		0 { $get = [xgcred]::new().get() }
		1 { $get = [xgcred]::new().get($cred) }
		2 { $get = [xgcred]::new().get($api.cred) }
		3 { $get = [xgcred]::new().get($xg.api.cred) }
		Default { $get = [xgcred]::new().get() }
	}
	return $get
}
function Set-XgCredential()
{
	[CmdletBinding(DefaultParameterSetName = "0")]
	Param (
		[Parameter(ParameterSetName = '0', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[switch]$Search,
		[Parameter(ParameterSetName = '1', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xgcred]$Cred,
		[Parameter(ParameterSetName = '2', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[api]$api,
		[Parameter(ParameterSetName = '3', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xg]$xg
	)
	switch ($PsCmdlet.ParameterSetName)
 {
		0 { $get = [xgcred]::new().get() }
		1 { $get = [xgcred]::new().get($cred) }
		2 { $get = [xgcred]::new().get($api.cred) }
		3 { $get = [xgcred]::new().get($xg.api.cred) }
		Default { $get = [xgcred]::new().get() }
	}
	$set = [xgcred]::new().save($get)
	return $set
}
function Remove-XgCredential()
{
	[CmdletBinding(DefaultParameterSetName = "0")]
	[Alias('Rem-XgCredential')]
	Param (
		[Parameter(ParameterSetName = '0', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[switch]$Search,
		[Parameter(ParameterSetName = '1', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xgcred]$Cred,
		[Parameter(ParameterSetName = '2', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[api]$api,
		[Parameter(ParameterSetName = '3', Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
		[xg]$xg
	)
	switch ($PsCmdlet.ParameterSetName)
 {
		0 { $get = [xgcred]::new().get() }
		1 { $get = [xgcred]::new().get($cred) }
		2 { $get = [xgcred]::new().get($api.cred) }
		3 { $get = [xgcred]::new().get($xg.api.cred) }
		Default { $get = [xgcred]::new().get() }
	}
	$remove = [xgcred]::new().remove($get)
	return $remove
}