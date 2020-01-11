function Convert-ToXgKey
{
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
		[Securestring]$key,
		[Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
		[SecureString]$Password,
		[Parameter(Mandatory = $false, Position = 2, ValueFromPipeline = $True)]
		[switch]$ValueOnly
	)

	switch ($ValueOnly)
 {
		{ $_.ispresent -match "True" } { Remove-Variable -Name ValueOnly ; [System.Boolean]$ValueOnly = $true }
		default { Remove-Variable -Name ValueOnly ; [System.Boolean]$ValueOnly = $False }
	}
	try
	{
		$v = get-vectors -password $password
		# AES Encrypt password using Salt and Vector above from original password (will need to know the password to decrypt)
		$o = ConvertTo-AesEncrypted -InputValue (cpt $key) -Vector $V.Vector -Salt $v.salt
		# Decrypt the password just encrypted to compare and confirm it worked and can be decrypted properly
		$i = ConvertFrom-AesEncrypted -InputValue $o -Vector $v.vector -Salt $v.salt
		# Compare the encrypted password and decrypted password to verify they are the same (they should be)
		$d = Compare-Object (cpt $key) $i -IncludeEqual | Measure-Object | Select-Object -expand count
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
		# fill the object the function will return
		$l = [ordered]@{
			Result = $false
			Log    = $msg
		}
		# throw the msg as the caught error
		throw $msg
	}
	if ($d -eq 1)
	{
		# clear variables from memory
		Get-Variable -name i, e, v, s, password -ea SilentlyContinue | Remove-Variable -Force -ea SilentlyContinue
		# create the message to fill the returning object
		$msg = "Credential Verified"
		# fill the object the function will return
		$l = [ordered]@{
			Result = $true
			key    = $o
			Log    = $msg
		}
	}
	else
	{
		# clear variables from memory
		Get-Variable -name i, o, e, v, s, password -ea SilentlyContinue | Remove-Variable -Force -ea SilentlyContinue
		# create the message to fill the returning object
		$msg = "Failed to verify! The module has failed to complete the function correctly, this is odd. Definitely something wrong with the password"
		# fill the object the function will return
		$l = [ordered]@{
			Result = $false
			key    = $o
			Log    = $msg
		}
	}

	# fill the result variable to return the object
	if ($ValueOnly)
 {
		$result = $o

	}
	else
 {
		$result = $l
	}
	# return the result and end the function
	return $result
}