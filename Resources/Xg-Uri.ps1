<#
	.NOTES
	===========================================================================
	 Created with: 	Vscode
	 Created on:   	13/10/2019 7:00 PM
	 Created by:   	Strooth
	 Organization: 	trollnet
	 Filename:     	Xg-Uri.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
function New-XgUri
{
  param(
    [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $True)]
    $uri,
    [Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $True)]
    [SecureString]$Login,
    [Parameter(Mandatory = $true, Position = 2, ValueFromPipeline = $True)]
    $query
  )
  $l = gss($login)
  $q = ("reqxml=<request%20APIVersion=""$($uri.uri_apiver)"">$($l)$($query)</request>")
  [System.UriBuilder]$uriBuilder = New-Object -TypeName 'System.UriBuilder'
  $uriBuilder.Scheme = $uri.uri_scheme
  $uriBuilder.Host = $uri.uri_address
  $uriBuilder.Port = $uri.uri_port
  $uriBuilder.Path = "webconsole/APIController"
  $uriBuilder.Query = $q
  $uriBuilder.Fragment = ""
  return $uriBuilder
}
function Cred-XgUri
{
  param(
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [string]$Username,
    [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
    [string]$Password
  )
  #build login section of the uri
  $Uri = ("<login><username>$($username)</username><name>$($username)</name><password%20passwordform=`"encrypt`">$($password)</password></login>")

  #return login uri section
  return $Uri
}
function Get-XgUri
{
  param(
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [xgentities]$entity,
    [Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $True)]
    [switch]$filter,
    [Parameter(Mandatory = $false, Position = 2, ValueFromPipeline = $True)]
    [xgfiltercriteria]$criteria,
    [Parameter(Mandatory = $false, Position = 3, ValueFromPipeline = $True)]
    [string]$name
  )
  #build final full uri
  if ($filter)
  {
    $Uri = ("<get><Filter><key%20name=""$($entity)""%20criteria=""$($criteria)"">$($name)</key></Filter></get>")
  }
  else
  {
    $Uri = ("<get><$($entity)></$($entity)></get>")
  }

  #return final uri
  return $Uri
}

function Remove-XgUri
{
  [Alias('Rem-XgUri')]
  param(
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [xgentities]$entity,
    [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
    [string]$name
  )
  #build final full uri
  $Uri = ("<remove><$($entity)>$($name)</$($entity)></remove>")

  #return final uri
  return $Uri
}
function Set-XgUri
{
  param(
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [xgsetoperation]$operation,
    [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
    [xgentities]$entity,
    [Parameter(Mandatory = $True, Position = 2, ValueFromPipeline = $True)]
    [string]$request
  )
  #build final full uri
  $Uri = ("<set operation=""$($operation)""><$($entity)>$($request)</$($entity)></set>")

  #return final uri
  return $Uri
}