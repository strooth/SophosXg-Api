function Convert-FromXgKey
{
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $True)]
		[SecureString]$key,
		[Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $True)]
		[SecureString]$Password,
		[Parameter(Mandatory = $false, Position = 2, ValueFromPipeline = $True)]
		[switch]$ValueOnly
	)

	switch ($ValueOnly)
 {
		{ $_.ispresent -match "True" } { Remove-Variable -Name ValueOnly ; [System.Boolean]$ValueOnly = $true }
		default { Remove-Variable -Name ValueOnly ; [System.Boolean]$ValueOnly = $False }
	}
	do
	{
		try
		{
			$v = get-vectors -password $password
			# Decrypt the password just encrypted to compare and confirm it worked and can be decrypted properly
			$i = ConvertFrom-AesEncrypted -InputValue (Get-PlainText($key)) -Vector $v.vector -Salt $v.salt
			# Decrypt the password just encrypted to compare and confirm it worked and can be decrypted properly
			$o = Convertto-AesEncrypted -InputValue $i -Vector $v.vector -Salt $v.salt
			# Compare the encrypted password and decrypted password to verify they are the same (they should be)
			$d = Compare-Object $o (cpt $key) -IncludeEqual | Measure-Object | Select-Object -expand count
			# set error action back to continue if we made it this far
			$ErrorActionPreference = "continue"
		}
		catch
		{
			# store last error in variable
			$er = $error
			# Clear any variables used so no passwords are in memory
			Get-Variable -name i, o, e, v, s, password -Scope 1 -ea SilentlyContinue | Remove-Variable -Force -ea SilentlyContinue
			# set error action back to continue because we never made it to the end of the try statement
			$ErrorActionPreference = "continue"
			# create the message to fill the returning object
			$msg = "Failed to convert the password! The error was: $er"
			# write the msg to console
			write-heading -value $msg
			# fill the object the function will return
			$l = [ordered]@{
				Result = $false
				Error  = $er
				Log    = $msg
			}
			# throw the msg as the caught error
			write-headingh $msg -color red
		}
		if ($d -eq 1)
		{
			# clear variables from memory
			Get-Variable -name e, v, s, password -ea SilentlyContinue | Remove-Variable -Force -ea SilentlyContinue
			# create the message to fill the returning object
			$msg = "Credential Converted"
			# write msg to console
			write-heading -value $msg
			# fill the object the function will return
			$l = [ordered]@{
				Result     = $true
				Credential = $i
				Log        = $msg
			}
			$finish = $true
			continue
		}
		if (($d -gt 1) -and !($finish))
		{
			# clear variables from memory
			Get-Variable -name o, e, v, s, password -ea SilentlyContinue | Remove-Variable -Force -ea SilentlyContinue
			# create the message to fill the returning object
			$msg = "Failed to convert! The module has failed to complete the function correctly, this is odd. Definitely something wrong with the key or password"
			# write the msg to console
			write-heading -value $msg
			# fill the object the function will return
			$l = [ordered]@{
				Result     = $false
				key        = $key
				Credential = $i
				Log        = $msg
			}
			$finish = $true
			continue
		}

		$finish = $true
		continue
	}
	until ($finish)
	# fill the result variable to return the object
	if ($ValueOnly)
 {
		$result = $i
	}
	else
 {
		$result = $l
	}
	# return the result and end the function
	return $result
}