<#
	.NOTES
	===========================================================================
	 Created with: 	Vscode
	 Created on:   	13/10/2019 7:00 PM
	 Created by:   	Strooth
	 Organization: 	trollnet
	 Filename:     	Xg-Api.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>
function New-XgApi()
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [pscustomobject]$object,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$test,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$out_object
  )
  switch ($PsCmdlet.ParameterSetName)
  {
    0
    {
      $x = [xg]::new(); $x.fill() ; Set-Variable -name xg -Scope global -value $x -Force
      break
    }
    1
    {
      $x = [xg]::new([xg]$xgapi) ; Set-Variable -name xg -Scope global -value $x -Force
      break
    }
    2
    {
      $x = [xg]::new([api]$api) ; Set-Variable -name xg -Scope global -value $x -Force
      break
    }
    3
    {
      $x = [xg]::new([pscustomobject]$object) ; Set-Variable -name xg -Scope global -value $x -Force
      break
    }
    4
    {
      $x = [xg]::new(); $x.api.test() ; $x.api.response = import-csv -path $PSScriptRoot\Response.csv;
      $x.api.response.iphost = import-csv -path $PSScriptRoot\Response.iphost.csv; Set-Variable -name xg -Scope global -value $x -Force
      break
    }
    5
    {
      $x = [xg]::new(); $x.api.test() ; $x.api.response = import-csv -path $PSScriptRoot\Response.csv;
      $x.api.response.iphost = import-csv -path $PSScriptRoot\Response.iphost.csv; return $x
      break
    }
  }
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      $xg.request()
      $msg = "XgApi configured successfully!"
      write-heading -value $msg -color green
      break
    }
    True
    {
      $msg = "XgApi not configured! Something went wrong please run - New-XgApi again or reinstall module"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }
}
function Get-XgApi()
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgentities]$entity,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgget]$build,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$test,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$out_object,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Show
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          $xg.fill("get")
          break
        }
        1
        {
          $xg.api.get.build([xgentities]$entity)
          break
        }
        2
        {
          $xg.api.get.build([xgget]$build)
          break
        }
        3
        {
          $xg.api.get.build([xg]$xgapi.api.get)
          break
        }
        4
        {
          $xg.api.get.build([api]$api.get)
          break
        }
        5
        {
          $xg.api.get = [get_build]::new().test()
          break
        }
        6
        {
          return [xgget]::new()
          break
        }
      }
      if ($Show -and ($PsCmdlet.ParameterSetName -notlike "6"))
      {
        write-heading -value Get -color yellow ;
        return $xg.api.get
      }
    }
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }
  $xg.api.lasttype = [lasttype]"get"
  $xg.request()
}
function Get-XgApiFilter()
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgentities]$entity,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgfilter]$build,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$test,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$out_object,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Show
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          $xg.fill("filter")
          break
        }
        1
        {
          $xg.api.filter.build([xgentities]$entity)
          break
        }
        2
        {
          $xg.api.filter.build([xgfilter]$build)
          break
        }
        3
        {
          $xg.api.filter.build([xg]$xgapi.api.filter)
          break
        }
        4
        {
          $xg.api.filter.build([api]$api.filter)
          break
        }
        5
        {
          $xg.api.filter = [get_build]::new().test()
          break
        }
        6
        {
          return [xgfilter]::new()
          break
        }
      }
      if ($Show -and ($PsCmdlet.ParameterSetName -notlike "6"))
      {
        write-heading -value Filter -color yellow ;
        return $xg.api.filter
      }
    }
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }
  $xg.api.lasttype = [lasttype]"filter"
  $xg.request()
}
function Set-XgApi()
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgentities]$entity,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgset]$build,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$test,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$out_object,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Show
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          $xg.fill("set")
          break
        }
        1
        {
          $xg.api.set.build([xgentities]$entity)
          break
        }
        2
        {
          $xg.api.set.build([xgset]$build)
          break
        }
        3
        {
          $xg.api.set.build([xg]$xgapi.api.set)
          break
        }
        4
        {
          $xg.api.set.build([api]$api.set)
          break
        }
        5
        {
          $xg.api.set = [set_build]::new().test()
          break
        }
        6
        {
          return [xgset]::new()
          break
        }
      }
      if ($Show -and ($PsCmdlet.ParameterSetName -notlike "6"))
      {
        write-heading -value Set -color yellow ;
        return $xg.api.set
      }
    }
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }
  $xg.api.lasttype = [lasttype]"set"
  $xg.request()
}
function Remove-XgApi()
{
  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgentities]$entity,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xgget]$build,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$test,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$out_object,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Show
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          $xg.fill("rem")
          break
        }
        1
        {
          $xg.api.rem.build([xgentities]$entity)
          break
        }
        2
        {
          $xg.api.rem.build([xgrem]$build)
          break
        }
        3
        {
          $xg.api.rem.build([xg]$xgapi.api.rem)
          break
        }
        4
        {
          $xg.api.rem.build([api]$api.rem)
          break
        }
        5
        {
          $xg.api.rem = [rem_build]::new().test()
          break
        }
        6
        {
          return [xgrem]::new()
          break
        }
      }
      if ($Show -and ($PsCmdlet.ParameterSetName -notlike "6"))
      {
        write-heading -value Rem -color yellow ;
        return $xg.api.rem
      }
    }
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }
  $xg.api.lasttype = [lasttype]"rem"
  $xg.request()
}
Set-Alias -Name Rem-XgApi -Value Remove-XgApi -ErrorVariable ev -scope global -force
function Invoke-XgApi()
{
  [CmdletBinding(DefaultParameterSetName = "3")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Prompt,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [xg]$xgapi,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [api]$api,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$default,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$get,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$set,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$rem,
    [Parameter(ParameterSetName = '7', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$filter,
    [Parameter(ParameterSetName = '8', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$show,
    [Parameter(Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Expand
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          $xg.fill(); $xg.request(); $xg.invoke()
          break
        }
        1
        {
          $xg = [xg]$xgapi; $xg.request(); $xg.invoke()
          break
        }
        2
        {
          $xg.api = [api]$api; $xg.request(); $xg.invoke()
          break
        }
        3
        {
          $xg.request(); $xg.invoke()
          break
        }
        4
        {
          $xg.request("get"); $xg.invoke("get")
          break
        }
        5
        {
          $xg.request("set"); $xg.invoke("set")
          break
        }
        6
        {
          $xg.request("rem"); $xg.invoke("rem")
          break
        }
        7
        {
          $xg.request("filter"); $xg.invoke("filter")
          break
        }
        8
        {
          break
        }
      }
    }
  }
  If ($xg.api.response)
  {
    write-heading -value Reponse -color yellow ;
    if ($Expand)
    {
      $re = $xg.api.response | gm -MemberType property | where definition -match object | select -ExpandProperty name
      $xg.api.response.$re | more
    }
    if (!($Expand))
    {
      $re = $xg.api.response | gm -MemberType property | where definition -match object | select -ExpandProperty name
      $xg.api.response.$re | ft | more
    }
  }
  If (!($xg.api.response))
  {
    write-heading -value Response -color red ;
    Write-Warning "No response!"
    $xg.api.response | select * | more
  }
}
function Clear-XgApi()
{
  remove-variable -Name xg -Force -Scope global
}
function Show-XgApi
{

  [CmdletBinding(DefaultParameterSetName = "0")]
  Param (
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$All,
    [Parameter(ParameterSetName = '1', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Uri,
    [Parameter(ParameterSetName = '2', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Cred,
    [Parameter(ParameterSetName = '3', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Get,
    [Parameter(ParameterSetName = '4', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Set,
    [Parameter(ParameterSetName = '5', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Rem,
    [Parameter(ParameterSetName = '6', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Filter,
    [Parameter(ParameterSetName = '7', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Request,
    [Parameter(ParameterSetName = '0', Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [Parameter(ParameterSetName = '7', Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$AsPlainText,
    [Parameter(ParameterSetName = '8', Mandatory = $false, ValueFromPipeline = $true, Position = 0)]
    [switch]$Response,
    [Parameter(ParameterSetName = '8', Mandatory = $false, ValueFromPipeline = $true, Position = 1)]
    [switch]$Expand
  )
  switch (!(Get-Variable -Name xg -scope global -ErrorAction SilentlyContinue))
  {
    False
    {
      switch ($PsCmdlet.ParameterSetName)
      {
        0
        {
          ($xg.api).foreach( { $_ | gm -MemberType property | select -ExpandProperty name }) | % {
            write-heading -value $_ -heading -color yellow
            if ($_ -match "request") { if ($AsPlainText) { gss $xg.api.request }elseif (!($asplaintext)) { $xg.api.request } }
            elseif ($_ -notmatch "request") { $xg.api.$_ }
            write-host "`n" }
        }
        1
        {
          write-heading -value Uri -heading -color yellow ; $xg.api.uri
          break
        }
        2
        {
          write-heading -value Cred -heading -color yellow ; $xg.api.cred
          break
        }
        3
        {
          write-heading -value Get -heading -color yellow ; $xg.api.get
          break
        }
        4
        {
          write-heading -value Set -heading -color yellow ; $xg.api.set
          break
        }
        5
        {
          write-heading -value Rem -heading -color yellow ; $xg.api.rem
          break
        }
        6
        {
          write-heading -value Filter -heading -color yellow ; $xg.api.filter
          break
        }
        7
        {
          write-heading -value Request -heading -color yellow ; if ($AsPlainText) { gss $xg.api.request }elseif (!($asplaintext)) { $xg.api.request }
          break
        }
        8
        {
          If ($xg.api.response)
          {
            write-heading -value Reponse -color yellow ;
            $re = $xg.api.response | gm -MemberType property | where definition -match object | select -ExpandProperty name
            if ($Expand)
            {
              $xg.api.response.$re | ft | more
              break
            }
            if (!($Expand))
            {
              $xg.api.response
              break
            }
          }
          If (!($xg.api.response))
          {
            write-heading -value Response -color red ;
            Write-Warning "No response!"
            $xg.api.response | select * | more
            break
          }
        }
      }
    }
    True
    {
      $msg = "XgApi not configured! Please run - New-XgApi"
      write-heading -value $msg -color red
      throw $msg
      break
    }
  }

}

