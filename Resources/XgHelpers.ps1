<#
.NOTES
===========================================================================
 Created with: 	Vscode
 Created on:   	13/10/2019 7:00 PM
 Created by:   	Strooth
 Organization: 	trollnet
 Filename:     	XgHelpers.ps1
===========================================================================
.SYNOPSIS
Classes and functions for use in the Xg-Api Module
# DESCRIPTION
Long description
# Version number of this module.
ModuleVersion          = '1.0.0.0'

# Author of this module
Author                 = 'Strooth'

# Company or vendor of this module
CompanyName            = 'trollnet'

# Copyright statement for this module
Copyright              = '(c) 2019. All rights reserved.'

# Description of the functionality provided by this module
.Description            = 'XgHelpers - Xg-Api Module'
#>
function Write-Log($message, $type, $outputLogPath)
{
  if ($null -eq $type -or $type -eq "")
  {
    $type = "INFO"
  }

  try
  {
    # Log Entry Structure:  [Date] [TYPE] [MESSAGE]
    $logEntry = (Get-Date -format u) + "`t" + $type.ToUpper() + "`t" + $message
    if ($type -eq "WARNING")
    {
      Write-Host -foregroundcolor Yellow $logEntry
    }
    elseif ($type -eq "ERROR")
    {
      Write-Host -foregroundcolor Red $logEntry
    }
    else
    {
      Write-Host $logEntry
    }
    Add-Content $outputLogPath $logEntry
  }
  catch
  {
    Write-Warning "Could not write entry to output log file: $outputLogPath `nLog Entry:$message"
  }
}
function get-answer()
{
  param (
    [ValidateNotNullOrEmpty()]
    [String[]]$List
    ,
    [ValidateNotNullOrEmpty()]
    [String]$Prompt
    ,
    [ValidateNotNullOrEmpty()]
    [bool]$start_dots
  )
  function start-dots
  {
    1 .. 22 | % {
      Write-host . -NoNewline
      Start-Sleep -Milliseconds 10
    }
    write-host
  }
  $values, $number, $selection = $null
  $config = $list
  while (1 .. $config.Length -notcontains $number)
  {
    switch ($start_dots)
    {
      { $start_dots -eq $true } { start-dots }
      Default { }
    }
    Write-Host $prompt -ForegroundColor white -BackgroundColor DarkRed
    Write-host "Please choose:"

    1 .. $config.Length | foreach-object { Write-host "$($_): $($config[$_ - 1])" }

    $selection = Read-Host -Prompt "Please select from 1..$($config.Count)"
    if (1 .. $config.Length -notcontains $selection)
    {
      Write-Host "incorrect selection! Try again" -ForegroundColor white -BackgroundColor DarkRed
    }
    else
    {
      if ($?)
      {
        Write-host "You chose: $selection"
        $number = $selection
      }
    }
  }
  return $($config[$number - 1])
}
function get-response
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true)]
    [String]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true)]
    [switch]$AsSecureString

  )
  $finish, $selection = $null
  while ($finish -ne 1)
  {
    switch ($pscmdlet.ParameterSetName)
    {
      '0'
      {
        $selection = read-host -Prompt $prompt
        break
      }
      '1'
      {
        $selection = read-host -AsSecureString
        break
      }
      '2'
      {
        $selection = read-host -Prompt $prompt -AsSecureString
        break
      }
    }
    if (!($selection))
    {
      Write-Warning "Error - Try Again"
    }
    else
    {
      if ($?)
      {
        $finish = 1
      }
    }
  }
  return $selection
}
Function write-heading()
{
  [CmdletBinding()]
  Param (
    [ValidateNotNullOrEmpty()]
    [String]$value,
    [switch]$heading,
    [ValidateSet('red', 'yellow', 'blue', 'green', 'white', ignorecase = $true)]
    [String]$color
  )
  switch ($color)
  {
    "red"
    {
      $outcolor = @{ ForegroundColor = "white"; BackgroundColor = "DarkRed" }
    }
    "yellow"
    {
      $outcolor = @{ ForegroundColor = "yellow"; BackgroundColor = "black" }
    }
    "green"
    {
      $outcolor = @{ ForegroundColor = "black"; BackgroundColor = "DarkGreen" }
    }
    "blue"
    {
      $outcolor = @{ ForegroundColor = "White"; BackgroundColor = "DarkBlue" }
    }
    "white"
    {
      $outcolor = @{ ForegroundColor = "black"; BackgroundColor = "white" }
    }
    Default
    {
      $outcolor = @{ ForegroundColor = "black"; BackgroundColor = "white" }
    }
  }
  $value = (Get-Culture).textinfo.totitlecase($value.tolower())
  if ($heading)
  {
    $LLEN = '=' * $value.Length
    Write-Host "$LLEN " @outcolor
    Write-host "$value " @outcolor
    Write-Host "$LLEN " @outcolor
  }
  if (!($heading))
  {
    Write-host "$value " @outcolor
  }
}
function Convert-FromBase64ToAscii
{
  [CmdletBinding()]
  Param( [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)] $String )
  [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($String))
}
function Convert-FromAsciiToBase64
{
  [CmdletBinding()]
  Param( [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)] $String )
  [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($String))
}
function get-vectors
{
  [CmdletBinding()]
  Param([Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $True)]
    [SecureString]$Password
  )
  # Convert Password to Base64
  $e = Convert-FromAsciiToBase64 (cpt $Password)
  do
  {
    # Join together until length is greater then 16
    $e = $e + $e
  }
  until ($e.length -gt 16)
  # set error action to stop globally for try
  $ErrorActionPreference = "stop"
  # Create a vector of exactly 16 bytes
  $v = $e.substring(0, 16)
  # Create a salt of exactly 16 bytes
  $s = (Convert-FromAsciiToBase64 ($e)).substring(0, 16)
  $l = [ordered]@{
    Result = $true
    Vector = $v
    Salt   = $s
  }
  return $l
}
##{Load the database assembly
##Add-Type -LiteralPath ".\Npgsql.dll"
##Add-Type -LiteralPath ".\Mono.Security.dll"
##Add-Type -LiteralPath ".\Npgsql.dll"
##Add-Type -LiteralPath ".\Mono.Security.dll"}
function invoke-pgsqlcmd
{
  [CmdletBinding()]
  Param (
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [String]$Query,
    [Parameter(Mandatory = $false, Position = 1, ValueFromPipeline = $True)]
    [String]$Connection
  )

  $command = New-Object Npgsql.NpgsqlCommand ($Query, $Connection)
  $adapter = New-Object Npgsql.NpgsqlDataAdapter ($command)

  #Load the Dataset
  $dataset = New-Object System.Data.DataSet
  [void]$adapter.Fill($dataset)

  return $dataset
}
function Get-SecureString()
{
  param (
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [securestring]
    $credential
  )
  $s = [System.Net.NetworkCredential]::new("-", $credential).Password
  return $s
}
function set-sstring
{
  param (
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    $string
  )
  Switch ($string)
  {
    ( { $string -isnot [SecureString] })
    {
      $string | Select-Object -First 1 -OutVariable string > $null
      $string = [pscredential]::new("-", (ConvertTo-SecureString -AsPlainText -String ([string]$string) -Force))
      break
    }
    ( { $string -is [Securestring] })
    {
      $string = [pscredential]::new("-", [securestring]$string)
      break
    }
  }
  return ($string).password
}
function Get-PlainText()
{
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
    [System.Security.SecureString]$SecureString
  )
  BEGIN { }
  PROCESS
  {
    $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString);

    try
    {
      return [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr);
    }
    finally
    {
      [Runtime.InteropServices.Marshal]::FreeBSTR($bstr);
    }
  }
  END { }
}
set-alias -Name cpt -Value Get-PlainText -ErrorVariable ev -scope global -force
set-alias -Name gss -Value Get-SecureString -ErrorVariable ev -scope global -force
set-alias -Name sss -Value set-sstring -ErrorVariable ev -scope global -force