using Namespace System.ManagemEnt.Automation
<#
.NOTES
===========================================================================
 Created with: 	Vscode
 Created on:   	13/10/2019 7:00 PM
 Created by:   	Strooth
 Organization: 	trollnet
 FilEName:     	XgClasses.ps1
===========================================================================
.SYNOPSIS
Classes and functions for use in the Xg-Api Module
.DESCRIPTION
Long description
#>
Enum Build
{
	null
	empty
	Uri
	Cred
	Filter
	Get
	Set
	Rem
}
Enum XgEntities
{
	null
	empty
	authEnticationserver
	adminauthEntication
	captivePortal
	cliEntlessuseraddrange
	cliEntlessuser
	defaultcaptivePortal
	firewallauthEntication
	usergroup
	guestuser
	guestuserSettings
	smsgateway
	otpSettings
	otptokEns
	user
	sslvpnauthEntication
	vpnauthEntication
	alias
	arpconfiguration
	bridgepair
	dhcpserveripv6
	dhcprelay
	dhcpserver
	dhcpserverstatus
	dns
	dnshostEntry
	dnsRequestroute
	dynamicdns
	gatewayconfiguration
	greroute
	gretunnel
	Interface
	iptunnel
	lag
	reddevice
	routeradvertisemEnt
	vlan
	zone
	gatewayhost
	multicastroute
	parEntproxy
	pimdynamicrouting
	policyroute
	unicastroute
	red
	ha
	qospolicy
	systemservices
	syslogservers
	ciscovpncliEnt
	vpnfailovergroup
	vpnipSecconnection
	l2tpconfiguration
	l2tpconnection
	pptpconfiguration
	sitetositecliEnt
	sitetositeserver
	sslbookmark
	sslbookmarkgroup
	sslvpnpolicy
	ssltunnelaccessSettings
	vpnpolicy
	supPortaccess
	Clearhbcloudregistration
	hbcloudregistration
	applicationClassificationbatchassignmEnt
	applicationClassificationassignmEnt
	applicationFiltercategory
	applicationFilterpolicy
	disablecloudcEntralmanagemEnt
	EnablecloudcEntralmanagemEnt
	avasAddressgroup
	antispamrules
	emailconfiguration
	datacontrollist
	antispamquarantinedigestSettings
	antispamemailarchiver
	malwareprotection
	pOpimapscanningpolicy
	antivirusmailsmtpscanningrules
	spxconfiguration
	spxtemplates
	antispamtrusteddomain
	advancedsmtpSetting
	exceptionpolicy
	mtaAddressgroup
	mtadatacontrollist
	mtaspxconfiguration
	mtaspxtemplates
	relaySettings
	smarthostSettings
	mtablockedsEnders
	smtppolicy
	SecUritypolicygroup
	sandboxSettings
	SecUritypolicy
	dosbyPassrules
	dosSettings
	ipscustomsignature
	ipspolicy
	spoofprevEntion
	trustedmac
	upload_trustedmac
	antivirusftp
	contEntconditionlist
	defaultwebFilternotificationSettings
	filetype
	antivirushttpsconfiguration
	surfingquotapolicy
	useractivity
	webFilterurlgroup
	webFilteradvancedSettings
	webFiltercategory
	webFilterexception
	webFilterpolicy
	webFilterprotectionSettings
	webFilterSettings
	webFilternotificationSettings
	webproxy
	reverseauthEntication
	realservers
	formtemplate
	protocolSecUrity
	wafslowhttp
	hotspot
	voucherdefinition
	advancedconfiguration
	wirelessnetworkstatus
	wirelessaccesspoInt
	wirelessprotectionglobalSettings
	wirelessgrouping
	wirelesslocalap
	wirelessmeshnetworks
	wirelessnetworks
	adminPassword
	localserviceacl
	adminSettings
	cEntralmanagemEnt
	messages
	netflowconfiguration
	notification
	snmpagEntconfiguration
	snmpcommunity
	time
	backuprestore
	backuprestore_now
	certificate
	certificateauthority
	selfsignedcertificateauthority
	crl
	fqdnhost
	fqdnhostgroup
	iphost
	iphostgroup
	machost
	servicegroup
	services
	accesstimepolicy
	datatransferpolicy
	natpolicy
	administrationprofile
	schedule
}
Enum XgFilterCriteria
{
	null
	empty
	equal
	notequal
	Like
}
Enum XgApiCall
{
	null
	empty
	Get
	Set
	Rem
	Remove
	Filter
}
Enum XgSetOperation
{
	null
	empty
	add
	update
}
Enum Scheme
{
	null
	empty
	http
	https
}
Class Uri_Build
{
	[Scheme]$Uri_Scheme
	[String]$Uri_Address
	[Int]$Uri_Port
	[String]$Uri_ApiVer
	[String]$Request
	[XgUri]Test()
 {
		$Build = ([Xg]::New().Api.Uri)
		$Build.Uri_Scheme = [Scheme]'https'
		$Build.Uri_Address = [String]"gw.company.com"
		$Build.Uri_Port = [Int]4444
		$Build.Uri_ApiVer = [String]"1702.1"
		$Build.Request = [String]"https://Test.com:4444/webconsole/APIController%3Freqxml=%3CRequest%20APIVersion=%221702.1%22%3E%3C/Request%3E"
		Return $Build
	}
}
Class Cred_Build
{
	[Guid]$Cred_Guid
	[SecureString]$Cred_EncryptionPw
	[String]$Cred_Name
	[String]$Cred_UserName
	[SecureString]$Cred_Key
	[SecureString]$Request
	[XgCred]Test()
 {
		$Build = ([Xg]::New().Api.Cred)
		$Build.Cred_Guid =	[Guid]("c7abd168-bc97-4987-b97c-5fe439f03057")
		$Build.Cred_EncryptionPw =	[SecureString](ConvertTo-SecureString -String "Passw0rd" -AsPlainText -Force )
		$Build.Cred_Name = [String]"Test"
		$Build.Cred_UserName =	[String]"Test.Api"
		$Build.Cred_Key =	[SecureString](ConvertTo-SecureString -String 'QJEgLDrC+xjeoPJzgfbOCg==' -AsPlainText -Force)
		$Build.Request = [SecureString](ConvertTo-SecureString -String '<login><userName>Test.Api</userName><Name>Test.Api</Name><Password%20Passwordform="Encrypt">Passw0rd</Password></login>' -AsPlainText -Force)
		Return $Build
	}
}
Class Filter_Build
{
	[Switch]$Filter
	[XgFilterCriteria]$Filter_Criteria
	[String]$Filter_Name
	[XgEntities]$Filter_Entity
	[String]$Request
	[XgFilter]Test()
 {
		$Build = ([Xg]::New().Api.Filter)
		$Build.Filter = [Switch]$true
		$Build.Filter_Criteria = [XgFilterCriteria]"Like"
		$Build.Filter_Name = [String]"Test"
		$Build.Filter_Entity = [XgEntities]"IPHost"
		$Build.Request = [String]'<Get><Filter><Key%20Name="IPHost"%20Criteria="Like">Test</Key></Filter></Get>'
		Return $Build
	}
}
Class Get_Build
{
	[XgEntities]$Get_Entity
	[String]$Request
	[XgGet]Test()
 {
		$Build = ([Xg]::New().Api.Get)
		$Build.Get_Entity = [XgEntities]"IPHost"
		$Build.Request = [String]'<Get><IPHost></IPHost></Get>'
		Return $Build
	}
}
Class Set_Build
{
	[XgSetOperation]$Set_Operation
	[XgEntities]$Set_Entity
	[String]$Set_Request
	[String]$Request
	[XgSet]Test()
 {
		$Build = ([Xg]::New().Api.Set)
		$Build.Set_Operation = [XgSetOperation]'Add'
		$Build.Set_Entity = [XgEntities]"IPHost"
		$Build.Set_Request = [String]'<Name>Test</Name><Address>192.168.0.10</Address>'
		$Build.Request = [String]'<Set Operation="add"><IPHost><Name>Test</Name><Address>192.168.0.10</Address></IPHost></Set>'
		Return $Build
	}
}
Class Rem_Build
{
	[XgEntities]$Rem_Entity
	[String]$Rem_Name
	[String]$Request
	[XgRem]Test()
 {
		$Build = ([Xg]::New().Api.Rem)
		$Build.Rem_Entity = [XgEntities]"IPHost"
		$Build.Rem_Name = [String]"Test"
		$Build.Request = [String]'<Remove><IPHost>Test</IPHost></Remove>'
		Return $Build
	}
}
Class Api_Build
{
	[XgApicall]$LastType
	[Uri_Build]$Uri_Build
	[Cred_Build]$Cred_Build
	[Filter_Build]$Filter_Build
	[Get_Build]$Get_Build
	[Set_Build]$Set_Build
	[Rem_Build]$Rem_Build
	[SecureString]$Request
}
Class Cred_Get
{
	[String]$Name
	[Guid]$Guid
	[String]$Filter
}
Class XgUri
{
	[Scheme]$Uri_Scheme = "https"
	[String]$Uri_Address
	[Int]$Uri_Port = 4444
	[String]$Uri_ApiVer = "1702.1"
	[String]$Request
	XgUri()
 {
	}
	XgUri([Scheme]$Uri_Scheme, [String]$Uri_Address, [Int]$Uri_Port, [String]$Uri_ApiVer, [String]$Request)
 {
		$This.Uri_Scheme = $Uri_Scheme
		$This.Uri_Address = $Uri_Address
		$This.Uri_Port = $Uri_Port
		$This.Uri_ApiVer = $Uri_ApiVer
		$This.Request = $Request
	}
	XgUri([Uri_Build]$Build) { $This = $Build }
	XgUri([XgUri]$var) { $This = $var }
	Build()
	{
		$s = Get-Response -Prompt "Set the protocol Scheme for this connection e.g. http or https"
		$This.Uri_Scheme = [Scheme]::$($s.tolower())
		$This.Uri_Address = Get-Response -Prompt "Set the Address or ip e.g. fw.customer.com or 69.69.54.23"
		$This.Uri_Port = [Int](Get-Response -Prompt "Set the Port for this connection")
		$This.Uri_ApiVer = Get-Response -Prompt "Set the Api version for this connection e.g. 1702.1"
		$This.Request = $This.Uri()

	}
	Build([Uri_Build]$Build)
 {
		$This.Uri_Scheme = [Scheme]::$($Build.Uri_Scheme)
		$This.Uri_Address = [String]::$($Build.Uri_Address)
		$This.Uri_Port = [Int]::$($Build.Uri_Port)
		$This.Uri_ApiVer = [String]::$($Build.Uri_ApiVer)
		$This.Request = $This.Uri()
	}
	Build([XgUri]$Build)
 {
		$This.Uri_Scheme = [Scheme]::$($Build.Uri_Scheme)
		$This.Uri_Address = [String]::$($Build.Uri_Address)
		$This.Uri_Port = [Int]::$($Build.Uri_Port)
		$This.Uri_ApiVer = [String]::$($Build.Uri_ApiVer)
		$This.Request = $This.Uri()
	}
	Build([Scheme]$Uri_Scheme, [String]$Uri_Address, [Int]$Uri_Port, [String]$Uri_ApiVer)
 {
		$This.Uri_Scheme = [Scheme]::$($Uri_Scheme)
		$This.Uri_Address = [String]::$($Uri_Address)
		$This.Uri_Port = [Int]::$($Uri_Port)
		$This.Uri_ApiVer = [String]::$($Uri_ApiVer)
		$This.Request = $This.Uri()
	}
	[String]Uri()
	{
  [System.UriBuilder]$UriBuilder = New-Object -TypeName 'System.UriBuilder'
  $UriBuilder.Scheme = $This.Uri_Scheme
  $UriBuilder.Host = $This.Uri_Address
  $UriBuilder.Port = $This.Uri_Port
		$UriBuilder.Path = "webconsole/APIController?reqxml=<Request%20APIVersion=""$($This.Uri_ApiVer)""></Request>"
		Return $UriBuilder.Uri.AbsoluteUri.ToString()
	}
}
Class XgCred
{
	[Guid]$Cred_Guid
	[SecureString]$Cred_EncryptionPw
	[String]$Cred_Name
	[String]$Cred_UserName
	[SecureString]$Cred_Key
	[SecureString]$Request
	XgCred() { }
	XgCred([XgCred]$var) { $This = $var }
	XgCred([Guid]$Cred_Guid, [SecureString]$Cred_EncryptionPw, [String]$Cred_Name, [String]$Cred_UserName, [SecureString]$Cred_Key, [SecureString]$Request)
 {
		$This.Cred_Guid = $Cred_Guid
		$This.Cred_EncryptionPw = $Cred_EncryptionPw
		$This.Cred_Name = $Cred_Name
		$This.Cred_UserName = $Cred_UserName
		$This.Cred_Key = $Cred_Key
		$This.Request = $Request
	}
	XgCred([Cred_Build]$Build) { $This = $Build }
	Clear() {	$This = [XgCred]::New() }
	Build()
 {
		(
			$This | get-member -MemberType Property | Select-Object -ExpandPrOperty Name).foreach(
			{
				$Switch = ($_).ToString()
				Switch ($Switch)
				{
					Cred_Guid
					{
						if (($Build.Cred_Guid -Like "00000000-0000-0000-0000-000000000000") -or ($null -match $Build.Cred_Guid) -or ($null -Like $Build.Cred_Guid) -or ($null -eq $Build.Cred_Guid) -or ($Build.Cred_Guid -match "00000000-0000-0000-0000-000000000000") -or ($Build.Cred_Guid -eq "00000000-0000-0000-0000-000000000000"))
						{ $This.Cred_Guid = New-Guid }
						else { $This.Cred_Guid = [Guid]::$($Build.Cred_Guid) }
						continue
					}
					Cred_Name
					{
						if ($null -ne $Build.Cred_Name)
						{ $This.Cred_Name = $Build.Cred_Name }
						else { $This.Cred_Name = (Get-Response -Prompt "Set a description for this CredEntial") }
						continue
					}
					Cred_EncryptionPw
					{
						if ($null -ne $Build.Cred_EncryptionPw)
						{ $This.Cred_EncryptionPw = $Build.Cred_EncryptionPw }
						else
						{
							$This.Cred_EncryptionPw = (Get-Response -Prompt "Set an Encryption Password" -AsSecureString)
						}
						continue
					}
					Cred_UserName
					{
						if ($null -ne $Build.Cred_UserName)
						{ $This.Cred_UserName = $Build.Cred_UserName }
						else { $This.Cred_UserName = (Get-Response -Prompt "Set the Api UserName") }
						continue
					}
					Cred_Key
					{
						if ($null -ne $Build.Cred_Key)
						{ $This.Cred_Key = $Build.Cred_Key }
						elseif ($null -eq $params.Cred_Key)
						{
							$tk = (Get-Response -Prompt "Set the Api Password" -AsSecureString)
							$This.Cred_Key = (sss (Convert-XgCredEntial -Mode Encrypt -Key ($tk) -Password ($This.Cred_EncryptionPw) -valueonly))
						}
						continue
					}
					Request
					{
						if ($null -ne $Build.Request)
						{ $This.Request = $Build.Request }
						else { $This.Request = $This.Uri($This) }
						continue
					}
				}
			}
		)
	}
	Build([XgCred]$Build)
 {
		$This.Cred_Guid = [Guid]::$($Build.Cred_Guid)
		$This.Cred_EncryptionPw = $Build.Cred_EncryptionPw
		$This.Cred_Name = $Build.Cred_Name
		$This.Cred_UserName = $Build.Cred_UserName
		$This.Cred_Key = $Build.Cred_Key
		$This.Request = $This.Uri($This)
		$This.Save($This)
	}
	Build([Cred_Build]$Build)
	{
		$This.Cred_Guid = [Guid]::$($Build.Cred_Guid)
		$This.Cred_EncryptionPw = $Build.Cred_EncryptionPw
		$This.Cred_Name = $Build.Cred_Name
		$This.Cred_UserName = $Build.Cred_UserName
		$This.Cred_Key = $Build.Cred_Key
		$This.Request = $This.Uri($This)
		$This.Save($This)
	}
	Build([Guid]$Cred_Guid, [SecureString]$Cred_EncryptionPw, [String]$Cred_Name, [String]$Cred_UserName, [SecureString]$Cred_Key, [SecureString]$Request)
	{
		$This.Cred_Guid = [Guid]::$($Cred_Guid)
		$This.Cred_EncryptionPw = $Cred_EncryptionPw
		$This.Cred_Name = $Cred_Name
		$This.Cred_UserName = $Cred_UserName
		$This.Cred_Key = $Cred_Key
		$This.Request = $This.Uri($This)
		$This.Save($This)
	}
	[SecureString] Uri ()
	{
		$This.Request = $This.Uri($This)
		Return $This.Request
	}
	[SecureString] Uri ([SecureString]$Cred_EncryptionPw, [String]$Cred_Name, [String]$Cred_UserName, [SecureString]$Cred_Key)
	{
		$tp = (Convert-XgCredEntial -Mode Decrypt -Key ($Cred_Key) -Password ($Cred_EncryptionPw) -valueonly)
		$This.Request = (sss (Cred-XgUri -UserName $Cred_UserName -Password $tp))
		Return $This.Request
	}
	[SecureString] Uri ([Cred_Build]$Build)
	{
		$tp = (Convert-XgCredEntial -Mode Decrypt -Key ($Build.Cred_Key) -Password ($Build.Cred_EncryptionPw) -valueonly)
		$This.Request = (sss (Cred-XgUri -UserName $Build.Cred_UserName -Password $tp))
		Return $This.Request
	}
	[SecureString] Uri ([XgCred]$Build)
	{
		$tp = (Convert-XgCredEntial -Mode Decrypt -Key ($Build.Cred_Key) -Password ($Build.Cred_EncryptionPw) -valueonly)
		$This.Request = (sss (Cred-XgUri -UserName $Build.Cred_UserName -Password $tp))
		Return $This.Request
	}
	[SecureString] Uri ([SecureString]$Cred_EncryptionPw, [String]$Cred_UserName, [SecureString]$Cred_Key)
 {
		$tp = (Convert-XgCredEntial -Mode Decrypt -Key ($Cred_Key) -Password ($Cred_EncryptionPw) -valueonly)
		$This.Request = (sss (Cred-XgUri -UserName $Cred_UserName -Password $tp))
		Return $This.Request
	}
	[psCredEntial]Save ()
	{
		Return $This.Save($This)
	}
	[psCredEntial]Save ([psCredEntial]$Cred)
	{
		Return (Set-CredEntial -TarGet $Cred.tarGet -CredEntial ([psCredEntial]::New($Cred.UserName, $Cred.Password)) -Description $Cred.description -PersistEnce LocalComputer)
	}
	[psCredEntial]Save ([XgCred]$Cred)
	{
		Return (Set-CredEntial -TarGet $Cred.Cred_Name -CredEntial ([psCredEntial]::New($Cred.Cred_UserName, $Cred.Cred_Key)) -Description $Cred.Cred_Guid -PersistEnce LocalComputer)
	}
	[psCredEntial]Save ([Object]$Obj)
 {
		Return (Set-CredEntial -TarGet $Obj.Cred_Name -CredEntial ([psCredEntial]::New($Obj.Cred_UserName, $Obj.Cred_Key)) -Description $Obj.Cred_Guid -PersistEnce LocalComputer)
	}
	Remove ()
	{
		Get-CredEntial -UserName $This.Cred_UserName -Delete -Force -ErrorAction SilEntlyContinue
		Remove-CredEntial -TarGet $This.Cred_Name -ErrorAction SilEntlyContinue
		$This.Clear()
	}
	Remove ([XgCred]$Cred_Get)
	{
		Get-CredEntial -UserName $Cred_Get.Cred_UserName -Delete -Force -ErrorAction SilEntlyContinue
		Remove-CredEntial -TarGet $Cred_Get.Cred_Name -ErrorAction SilEntlyContinue
		$This.Clear()
	}
	Remove ([psCredEntial]$Cred_Get)
	{
		Get-CredEntial -UserName $Cred_Get.Cred_UserName -Delete -Force -ErrorAction SilEntlyContinue
		Remove-CredEntial -TarGet $Cred_Get.Cred_Name -ErrorAction SilEntlyContinue
		$This.Clear()
	}
	Remove ([Object]$Obj)
 {
		Get-CredEntial -UserName $Obj.Cred_UserName -Delete -Force -ErrorAction SilEntlyContinue
		Remove-CredEntial -TarGet $Obj.Cred_Name -ErrorAction SilEntlyContinue
		$This.Clear()
	}
	[XgCred]Get ()
 {
		Set-Variable -Name v
		$Cred = fdCred -Filter (Get-Response -Prompt "Enter the tarGet to search for")
		if (!($Cred))
		{
			$Cred = Get-CredEntial -UserName (Get-Response -Prompt "Enter the UserName to search for") -Password (Get-Response -Prompt "Enter the Password to search for")
		}
		Return $This.Get([psCredEntial]$Cred)
	}
	[XgCred]Get ([Cred_Get]$Cred_Get)
 {
		Return $This.Get($Cred_Get.Filter, $Cred_Get.Guid, $Cred_Get.Name)
	}
	[XgCred]Get ([psCredEntial]$Cred_Get)
	{
		Return $This.Get($Cred_Get.tarGet, $Cred_Get.description, $Cred_Get.userName)
	}
	[XgCred]Get ($tarGet, $description, $userName)
 {
		Set-Variable -Name $Cred
		Switch ($tarGet)
		{
			($tarGet) { $Cred = fdCred -Filter $tarGet ; break }
			Default { $Cred = fdCred | Where-Object { ($_.description -match $description) -or ($_.userName -match $userName) } ; break }
		}
		if ($Cred)
		{
			$This.Cred_Guid = ([Guid]::New($Cred.description))
			$This.Cred_EncryptionPw = $This.Cred_EncryptionPw
			$This.Cred_Name = $Cred.tarGet
			$This.Cred_UserName = $Cred.UserName
			$This.Cred_Key = $Cred.Password
			$This.Request = $This.Uri($This)
		}
		Return $This
	}
}
Class XgFilter
{
	[bool]$Filter
	[XgFilterCriteria]$Filter_Criteria
	[String]$Filter_Name
	[XgEntities]$Filter_Entity
	[String]$Request
	XgFilter() { }
	XgFilter([XgFilter]$var) { $This = $var }
	XgFilter([bool]$Filter, [XgFilterCriteria]$Filter_Criteria, [String]$Filter_Name, [XgEntities]$Filter_Entity)
 {
		$This.Filter = $Filter
		$This.Filter_Entity = $Filter_Entity
		$This.Filter_Criteria = $Filter_Criteria
		$This.Filter_Name = $Filter_Name
	}
	XgFilter([Filter_Build]$Build) { $This = $Build }
	Build()
	{
		if (!($This.Filter))
		{
			$This.Filter = [bool](Get-Response -Prompt "Enable Filtering? `$true or `$false")
		}
		$This.Filter = $This.Filter
		$This.Filter_Entity = [XgEntities](Get-Response -Prompt "Enter the Entity to type to Get")
		$This.Filter_Criteria = [XgFilterCriteria](Get-Response -Prompt "Enter the Criteria e.g. eguals, Like, notequal")
		$This.Filter_Name = (Get-Response -Prompt "Enter the Name to Filter by")
		$This.Request = $This.Uri($This)

	}
	BuildfromParEntYes()
	{
		$This.Filter = ($true)
		$This.Build($This)
	}
	Build([Filter_Build]$Build)
	{
		$This.Filter = $Build.Filter
		$This.Filter_Entity = $Build.Filter_Entity
		$This.Filter_Criteria = $Build.Filter_Criteria
		$This.Filter_Name = $Build.Filter_Name
		$This.Request = $This.Uri($This)
	}
	Build([XgFilter]$Build)
	{
		$This.Filter = $Build.Filter
		$This.Filter_Entity = $Build.Filter_Entity
		$This.Filter_Criteria = $Build.Filter_Criteria
		$This.Filter_Name = $Build.Filter_Name
		$This.Request = $This.Uri($This)
	}
	Build([bool]$Filter, [XgFilterCriteria]$Filter_Criteria, [String]$Filter_Name, [XgEntities]$Filter_Entity)
	{
		$This.Filter = $Filter
		$This.Filter_Entity = $Filter_Entity
		$This.Filter_Criteria = $Filter_Criteria
		$This.Filter_Name = $Filter_Name
		$This.Request = $This.Uri($This)
	}
	UriBuild($Build)
	{
		$This.Filter = $Build.Filter
		$This.Filter_Entity = [XgEntities]::$($Build.Entity)
		$This.Filter_Criteria = [XgFilterCriteria]::$($Build.Criteria)
		$This.Filter_Name = [String]::$($Build.Name)
	}
	[String] Uri ()
	{
		$This.Request = $This.Uri($This)
		Return $This.Request
	}
	[String] Uri ([XgFilter]$Build)
	{
		$param = @{
			Filter   = $Build.Filter
			Entity   = $Build.Filter_Entity
			Criteria = $Build.Filter_Criteria
			Name     = $Build.Filter_Name
		}
		$This.UriBuild($param)
		$This.Request = (Get-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([Filter_Build]$Build)
	{
		$param = @{
			Filter   = $Build.Filter
			Entity   = $Build.Filter_Entity
			Criteria = $Build.Filter_Criteria
			Name     = $Build.Filter_Name
		}
		$This.UriBuild($param)
		$This.Request = (Get-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([bool]$Filter, [XgFilterCriteria]$Filter_Criteria, [String]$Filter_Name, [XgEntities]$Filter_Entity)
	{
		$param = @{
			Filter   = $Filter
			Entity   = $Filter_Entity
			Criteria = $Filter_Criteria
			Name     = $Filter_Name
		}
		$This.UriBuild($param)
		$This.Request = (Get-XgUri @param)
		Return $This.Request
	}
}
Class XgSet
{
	[XgSetOperation]$Set_Operation
	[XgEntities]$Set_Entity
	[String]$Set_Request
	[String]$Request
	XgSet() { }
	XgSet([XgSet]$var) { $This = $var }
	XgSet([XgSetOperation]$Set_Operation, [XgEntities]$Set_Entity, [String]$Set_Request)
 {
		$This.Set_Operation = $Set_Operation
		$This.Set_Entity = $Set_Entity
		$This.Set_Request = $Set_Request
	}
	XgSet([Set_Build]$Build) { $This = $Build }
	Build ()
	{
		$This.Set_Operation = [XgSetOperation]::$((Get-Response -Prompt "Enter the Set Operation - Add or Update").tolower())
		$This.Set_Entity = [XgEntities]::$((Get-Response -Prompt "Enter the Entity type to Set").tolower())
		$This.Set_Request = (Get-Response -Prompt "Enter the data to Set in xml Entity format")
		$This.Request = $This.Uri($This)
	}
	Build ([Set_Build]$Build)
	{
		$This.Set_Operation	= $Build.Set_Operation
		$This.Set_Entity = $Build.Set_Entity
		$This.Set_Request = $Build.Set_Request
		$This.Request = $This.Uri($This)
	}
	Build ([XgSet]$Build)
	{
		$This.Set_Operation	= $Build.Set_Operation
		$This.Set_Entity = $Build.Set_Entity
		$This.Set_Request = $Build.Set_Request
		$This.Request = $This.Uri($This)
	}
	Build ([XgSetOperation]$Set_Operation, [XgEntities]$Set_Entity, [String]$Set_Request)
	{
		$This.Set_Operation	= $Set_Operation
		$This.Set_Entity = $Set_Entity
		$This.Set_Request = $Set_Request
		$This.Request = $This.Uri($This)
	}
	UriBuild ($Build)
	{
		$This.Set_Operation	= [XgSetOperation]::$($Build.Operation)
		$This.Set_Entity = [XgEntities]::$($Build.Entity)
		$This.Set_Request = [String]($Build.Request)
	}
	[String] Uri ()
	{
		$param = @{
			Operation = $This.Set_Operation
			Entity    = $This.Set_Entity
			Request   = $This.Set_Request
		}
		$This.Request = (Set-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([XgSet]$Build)
	{
		$param = @{
			Operation = $Build.Set_Operation
			Entity    = $Build.Set_Entity
			Request   = $Build.Set_Request
		}
		$This.UriBuild($param)
		$This.Request = (Set-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([Set_Build]$Build)
	{
		$param = @{
			Operation = $Build.Set_Operation
			Entity    = $Build.Set_Entity
			Request   = $Build.Set_Request
		}
		$This.UriBuild($param)
		$This.Request = (Set-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([XgSetOperation]$Set_Operation, [XgEntities]$Set_Entity, [String]$Set_Request)
	{
		$param = @{
			Operation = $Set_Operation
			Entity    = $Set_Entity
			Request   = $Set_Request
		}
		$This.UriBuild($param)
		$This.Request = (Set-XgUri @param)
		Return $This.Request
	}
}
Class XgGet
{
	[XgEntities]$Get_Entity
	[String]$Request
	XgGet() { }
	XgGet([XgGet]$var) { $This = $var }
	XgGet([XgEntities]$Get_Entity) { $This.Get_Entity = $Get_Entity }
	XgGet([Get_Build]$Build) { $This = $Build }
	Build()
	{
		$This.Get_Entity = [XgEntities]::$((Get-Response -Prompt "Enter the Entity to type to Get").tolower())
		$This.Request = $This.Uri($This)
	}
	Build([XgEntities]$Get_Entity)
	{
		$This.Get_Entity = [XgEntities]::$($Get_Entity)
		$This.Request = $This.Uri($This)
	}
	Build([Get_Build]$Build)
	{
		$This.Get_Entity = [XgEntities]::$($Build.Get_Entity)
		$This.Request = $This.Uri($This)
	}
	Build([XgGet]$Build)
 {
		$This.Get_Entity = [XgEntities]::$($Build.Get_Entity)
		$This.Request = $This.Uri($This)
	}
	[String]Uri()
	{
		$param = @{
			Entity = $This.Get_Entity
		}
		$This.Request = (Get-XgUri @param)
		Return $This.Request
	}
	[String]Uri($Build)
	{
		Set-Variable -Name e
		Switch ($Build.Get_Entity)
		{
			{ $null -eq $Build.Get_Entity }
			{
				$e = [XgEntities]::$((Get-Response -Prompt "Entity  is null - Please Enter the Entity to type to Get").tolower()
					break
				)
   }
			{ $null -ne $Build.Get_Entity }
			{
				$e = $Build.Get_Entity
				break
			}
			Default { $e = [XgEntities]::$((Get-Response -Prompt "Enter the Entity to type to Get").tolower()) ; break }
		}
		$param = @{
			Entity = $e
		}
		$This.Get_Entity = [XgEntities]::$($e)
		$This.Request = (Get-XgUri @param)
		Return $This.Request
	}
}
Class XgRem
{
	[XgEntities]$Rem_Entity
	[String]$Rem_Name
	[String]$Request
	XgRem() { }
	XgRem([XgRem]$var) { $This = $var }
	XgRem(	[XgEntities]$Rem_Entity, [String]$Rem_Name)
 {
		$This.Rem_Entity = $Rem_Entity
		$This.Rem_Name = $Rem_Name
	}
	XgRem([Rem_Build]$Build) { $This = $Build }
	Build()
	{
		$This.Rem_Entity = [XgEntities]::$((Get-Response -Prompt "Enter the Entity type to Remove").tolower())
		$This.Rem_Name = (Get-Response -Prompt "Enter the Name of the Entity to type to Remove")
		$This.Request = $This.Uri($This)
	}
	Build([Rem_Build]$Build)
	{
		$This.Rem_Entity = $Build.Rem_Entity
		$This.Rem_Name = $Build.Rem_Name
		$This.Request = $This.Uri($This)
	}
	Build([XgRem]$Build)
	{
		$This.Rem_Entity = $Build.Rem_Entity
		$This.Rem_Name = $Build.Rem_Name
		$This.Request = $This.Uri($This)
	}
	Build(	[XgEntities]$Rem_Entity, [String]$Rem_Name)
	{
		$This.Rem_Entity = $Rem_Entity
		$This.Rem_Name = $Rem_Name
		$This.Request = $This.Uri($This)
	}
	UriBuild($Build)
	{
		$This.Rem_Entity = [XgEntities]::$($Build.Entity)
		$This.Rem_Name = $Build.Name
	}
	[String] Uri ()
	{
		$param = @{
			Entity = $This.Rem_Entity
			Name   = $This.Rem_Name
		}
		$This.Request = (Rem-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([XgRem]$Build)
	{
		$param = @{
			Entity = $Build.Rem_Entity
			Name   = $Build.Rem_Name
		}
		$This.UriBuild($param)
		$This.Request = (Rem-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([Rem_Build]$Build)
	{
		$param = @{
			Entity = $Build.Rem_Entity
			Name   = $Build.Rem_Name
		}
		$This.UriBuild($param)
		$This.Request = (Rem-XgUri @param)
		Return $This.Request
	}
	[String] Uri ([XgEntities]$Rem_Entity, [String]$Rem_Name)
	{
		$param = @{
			Entity = $Rem_Entity
			Name   = $Rem_Name
		}
		$This.UriBuild($param)
		$This.Request = (Rem-XgUri @param)
		Return $This.Request
	}
}
Class Api
{
	[XgUri]$Uri
	[XgCred]$Cred
	[XgFilter]$Filter
	[XgGet]$Get
	[XgSet]$Set
	[XgRem]$Rem
	[XgApicall]$Lasttype
	[SecureString]$Request
	$Response
	Api ()
 {
		$This.Uri = [XgUri]::New()
		$This.Cred = [XgCred]::New()
		$This.Filter = [XgFilter]::New()
		$This.Get = [XgGet]::New()
		$This.Set = [XgSet]::New()
		$This.Rem = [XgRem]::New()
	}
	Api ([Api]$Api)
 {
		$This = $Api
	}
	Api ([XgUri]$Uri, [XgCred]$Cred, [XgFilter]$Filter, [XgGet]$Get, [XgSet]$Set, [XgRem]$Rem, [XgApicall]$Lasttype, [String]$Request, $Response)
 {
		$This.LastType = $LastType
		$This.Uri = $Uri
		$This.Cred = $Cred
		$This.Filter = $Filter
		$This.Get = $Get
		$This.Set = $Set
		$This.Rem = $Rem
		$This.Request = $Request
		$This.Response = (sss $Response)
	}
	Api ([Api_Build]$Build)
 {
		$This.LastType = ([XgApicall]$Build.LastType)
		$This.Uri = ([Uri_Build]$Build.Uri_Build)
		$This.Cred = ([Cred_Build]$Build.Cred_Build)
		$This.Filter = ([Filter_Build]$Build.Filter_Build)
		$This.Get = ([Get_Build]$Build.Get_Build)
		$This.Set = ([Set_Build]$Build.Set_Build)
		$This.Rem = ([Rem_Build]$Build.Rem_Build)
		$This.Request = (sss [String]$Build.Request)
	}
	Clear ()
 {
		$This.Uri = [XgUri]::New()
		$This.Cred = [XgCred]::New()
		$This.Filter = [XgFilter]::New()
		$This.Get = [XgGet]::New()
		$This.Set = [XgSet]::New()
		$This.Rem = [XgRem]::New()
		$This.Request = $null
		$This.LastType = 'null'
		$This.Response = $null
	}
	Test()
 {
		$This.LastType = 'Get'
		$This.Uri = [Uri_Build]::New().Test()
		$This.Cred = [Cred_Build]::New().Test()
		$This.Filter = [Filter_Build]::New().Test()
		$This.Get = [Get_Build]::New().Test()
		$This.Set = [Set_Build]::New().Test()
		$This.Rem = [Rem_Build]::New().Test()
		$query = ($This | Select-Object -ExpandPrOperty $This.Lasttype | Select-Object -ExpandPrOperty Request)
		$This.Request = sss (New-XgUri -Uri $This.Uri -Login $This.Cred.Request -query $query)
	}
	Build()
 {
		$prmt = "Which Request do you want to Build? Get, Set, Rem?"
		$answer = Get-answer -List Get, Set, Rem -Prompt $prmt
		$This.Lasttype = ($answer).tolower()
		$This.Uri.Build()
		$This.Cred.Build()
		Switch ($answer)
		{
			{ $answer -match "Get" }
			{
				$prmt = "Do you want to Filter? Yes, No?"
				$aFilter = Get-answer -List Yes, No -Prompt $prmt
				if ($aFilter -match "Yes")
				{
					$This.Filter.BuildfromParEntYes()
					$This.Get.Build($This.Filter.Filter_Entity)
					$This.Filter.Uri()
					$This.Get.Uri($This.Get.Get_Entity)
				}
				else
				{
					$This.Get.Build()
					$This.Get.Uri($This.Get.Get_Entity)
				}
				break
			}
			{ $answer -match "Set" }
			{
				$This.Set.Build()
				$This.Set.Uri($This.Set.Set_Operation, $This.Set.Set_Entity, $This.Set.Set_Request)
				break
			}
			{ $answer -match "Rem" }
			{
				$This.Rem.Build()
				$This.Rem.Uri($This.Rem.Rem_Entity, $This.Rem.Rem_Name)
				break
			}
			Default
			{
				$This.Get.Build()
				$This.Get.Uri($This.Get.Get_Entity)
				break
			}
		}
		$This.Cred.Uri($This.Cred.Cred_EncryptionPw , $This.Cred.Cred_UserName, $This.Cred.Cred_Key )
		$query = ($This | Select-Object -ExpandPrOperty $This.Lasttype | Select-Object -ExpandPrOperty Request)
		$This.Request = sss (New-XgUri -Uri ( $This.Uri ) -Login ($This.Cred.Request) -query ($query))
	}
	Build([Api_Build]$Build)
	{
		$This.Lasttype = [XgApicall]::$($Build.Lasttype)
		$This.Uri.Build([Uri_Build]::$($Build.Uri_Build))
		$This.Cred.Build([Cred_Build]::$($Build.Cred_Build))
		Switch ($Build.Lasttype)
		{
			{ $Build.Lasttype -match "Get" }
			{
				$aFilter = $Build.Filter_Build.Filter.ispresEnt
				if ($aFilter -match "True")
				{
					$This.Filter.Build([Filter_Build]::$($Build.Filter_Build))
					$This.Get.Build($This.Filter.Filter_Entity)
					$This.Filter.Uri()
					$This.Get.Uri($This.Get.Get_Entity)
				}
				else
				{
					$This.Get.Build([Get_Build]::$($Build.Build_Entity))
					$This.Get.Uri($This.Get.Get_Entity)
				}
				break
			}
			{ $Build.Lasttype -match "Set" }
			{
				$This.Set.Build([Set_Build]::$($Build.Set_Build))
				$This.Set.Uri($This.Set.Set_Operation, $This.Set.Set_Entity, $This.Set.Set_Request)
				break
			}
			{ $Build.Lasttype -match "Rem" }
			{
				$This.Rem.Build([Rem_Build]::$($Build.Rem_Build))
				$This.Rem.Uri($This.Rem.Rem_Entity, $This.Rem.Rem_Name)
				break
			}
			Default
			{
				$This.Get.Build([Get_Build]::$($Build.Build_Entity))
				$This.Get.Uri($This.Get.Get_Entity)
				break
			}
		}
		$This.Cred.Uri($Build.Cred_Build.Cred_EncryptionPw , $Build.Cred_Build.Cred_UserName, $Build.Cred_Build.Cred_Key )
		$This.Request = sss $This.url($This.Uri, $This.Cred.Request, $This.$($Build.Lasttype).Request)
	}
	Build([Build]$b)
	{
		$This.Lasttype = $b
		$This.$($b).Build()
		$This.$($b).Uri()
	}
	Build([Api]$Api)
	{
		$This.Lasttype = ($Api.Lasttype)
		$This.Uri.Build($Api.Uri)
		$This.Cred.Build($Api.Cred)
		Switch ($Api.Lasttype)
		{
			{ $Api.Lasttype -match "Get" }
			{
				$aFilter = $Api.Filter.Filter.ispresEnt
				if ($aFilter -match "True")
				{
					$This.Filter.Build($Api.Filter)
					$This.Get.Build($This.Filter.Filter_Entity)
					$This.Filter.Uri()
					$This.Get.Uri($This.Get.Get_Entity)
				}
				else
				{
					$This.Get.Build($Api.Build_Entity)
					$This.Get.Uri($This.Get.Get_Entity)
				}
				break
			}
			{ $Api.Lasttype -match "Set" }
			{
				$This.Set.Build($Api.Set)
				$This.Set.Uri($This.Set.Set_Operation, $This.Set.Set_Entity, $This.Set.Set_Request)
				break
			}
			{ $Api.Lasttype -match "Rem" }
			{
				$This.Rem.Build($Api.Rem)
				$This.Rem.Uri($This.Rem.Rem_Entity, $This.Rem.Rem_Name)
				break
			}
			Default
			{
				$This.Get.Build($Api.Build_Entity)
				$This.Get.Uri($This.Get.Get_Entity)
				break
			}
		}
		$This.Cred.Uri($Api.Cred.Cred_EncryptionPw , $Api.Cred.Cred_UserName, $Api.Cred.Cred_Key )
		$This.Request = sss $This.url($This.Uri, $This.Cred.Request, $This.$($Api.Lasttype).Request)
	}
	url ()
	{
		$This.Build()
		$query = $This | Select-Object -exp $This.Lasttype | Select-Object -exp Request
		$This.Request = sss (New-XgUri -Uri ($This.Uri) -Login ($This.Cred.Request) -query ($query))
	}
	url ([Api]$Api)
	{
		$This.Build($Api)
		$query = $Api | Select-Object -ExpandPrOperty $This.Lasttype | Select-Object -ExpandPrOperty Request
		$This.Request = sss (New-XgUri -Uri ($Api.Uri) -Login ($Api.Cred.Request) -query ($query))
	}
	url ([Api_Build]$Api)
	{
		$This.Build($Api)
		$query = $Api | Select-Object -ExpandPrOperty $This.Lasttype | Select-Object -ExpandPrOperty Request
		$This.Request = sss (New-XgUri -Uri ($Api.Uri) -Login ($Api.Cred.Request) -query ($query))
	}
	url ([XgApicall]$type)
 {
		$prmt = "Which Uri do you want to Build? Get, Set, Rem?"
		Switch ($type = (Get-type -List Get, Set, Rem -Prompt $prmt))
		{
			{ $type -match "Get" } { $This.Get.Request = $This.Get.Uri() ; break }
			{ $type -match "Set" } { $This.Set.Request = $This.Set.Uri() ; break }
			{ $type -match "Rem" } { $This.Rem.Request = $This.Rem.Uri() ; break }
		}
		$This.Lasttype = [XgApicall]::$($type)
		$query = $This | Select-Object -ExpandPrOperty $This.Lasttype | Select-Object -ExpandPrOperty Request
		$This.Request = sss (New-XgUri -Uri ($This.Uri) -Login ($This.Cred.Request) -query ($query))
		#	Return $This.Request
	}
	url ([XgUri]$Uri, [SecureString]$login, $query)
	{
		$This.Request = sss (New-XgUri -Uri $Uri -Login $login -query $query)
		#	Return $This.Request
	}
	[String] Invoke ()
	{
		$This.url($This)
		$This.Response = (Invoke-RestMethod -Uri ($This.Request.Uri.originalString)).Response
		Return $This.Response
	}
	[String] Invoke ([Api]$Api)
	{
		$This.url($Api.Uri, $Api.Cred.Request, $This.$($This.Lasttype).Request)
		$This.Response = (Invoke-RestMethod -Uri ($Api.Request.Uri.originalString)).Response
		Return $This.Response
	}
}
Class Xg
{
	[Api]$Api
	$sql
	Xg()
 {
		$This.Api = [Api]::New()
		$This.Api.Cred = [XgCred]::New()
		$This.Api.Filter = [XgFilter]::New()
		$This.Api.Get = [XgGet]::New()
		$This.Api.Rem = [XgRem]::New()
		$This.Api.Set = [XgSet]::New()
		$This.Api.Uri = [XgUri]::New()
	}
	Xg([Api]$Api)
 {
		$This.Api = [Api]$Api
	}
	Xg([Xg]$Xg)
 {
		$This = [Xg]$Xg
	}
	Xg([pscustomObject]$Xg)
 {
		$This.Api = [Api]::New()
		$This.Api.Lasttype = $Xg.LastType
		$This.Api.Cred = $Xg.Cred
		$This.Api.Filter = $Xg.Filter
		$This.Api.Get = $Xg.Get
		$This.Api.Rem = $Xg.Rem
		$This.Api.Set = $Xg.Set
		$This.Api.Uri = $Xg.Uri
	}
	Clear() {	$This.Api.Clear() }
	invoke()
	{
		$This.Api.Response = (Invoke-RestMethod -Uri (gss $This.Api.Request)).Response
		$This.Api.Response
	}
	invoke($x)
	{
		Switch ($x)
		{
			Filter
			{
				$This.Api.LastType = [XgApicall]::$($x)
				$This.Api.Filter.Build($This.Api.Filter)
				$This.Api.Filter.Uri($This.Api.Filter)
				break
			}
			Get
			{
				$This.Api.LastType = "Get"
				$This.Api.Get.Build($This.Api.Get)
				$This.Api.Get.Uri($This.Api.Get)
				break
			}
			Set
			{
				$This.Api.LastType = "Set"
				$This.Api.Set.Build($This.Api.Set)
				$This.Api.Set.Uri($This.Api.Set)
				break
			}
			Rem
			{
				$This.Api.LastType = "Rem"
				$This.Api.Rem.Build($This.Api.Rem)
				$This.Api.Rem.Uri($This.Api.Rem)
				break
			}
		}
		$This.Api.Response = (Invoke-RestMethod -Uri (gss $This.Api.Request)).Response
		$This.Api.Response
	}
	fill()
	{
		$This.fill("all")
	}
	fill($x)
	{
		Set-Variable -Name answer
		Switch ($x)
		{
			Uri
			{
				$This.Api.Uri.Build()
				break
			}
			Cred
			{
				$This.Api.Cred.Build()
				break
			}
			Filter
			{
				$This.Api.Filter.Build()
				$This.Api.Filter.Uri($This.Api.Filter)
				$This.Api.LastType = "Get"
				break
			}
			Get
			{
				$This.Api.Get.Build()
				$This.Api.Get.Uri($This.Api.Get)
				$This.Api.LastType = "Get"
				break
			}
			Set
			{
				$This.Api.Set.Build()
				$This.Api.Set.Uri($This.Api.Set)
				$This.Api.LastType = "Set"
				break
			}
			Rem
			{
				$This.Api.Rem.Build()
				$This.Api.Rem.Uri($This.Api.Rem)
				$This.Api.LastType = "Rem"
				break
			}
			req
			{
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty $This.Api.Lasttype | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
				break
			}
			all
			{
				$This.Api.Uri.Build()
				$This.Api.Cred.Build()
				$prmt = "Which Request do you want to Build? Get, Set, Rem?"
				$This.Api.LastType = Get-answer -List Get, Set, Rem -Prompt $prmt
				Switch ($This.Api.LastType)
				{
					Get
					{
						$prmt = "Do you want to Enable Filtering?"
						Switch (Get-answer -List Yes, No -Prompt $prmt)
						{
							Yes
							{
								$This.Api.Filter.Build()
								$This.Api.Filter.Uri($This.Api.Filter)
								break
							}
							No
							{
								$This.Api.Get.Build()
								$This.Api.Get.Uri($This.Api.Get)
								break
							}
							Default
							{
								$This.Api.Get.Build()
								$This.Api.Get.Uri($This.Api.Get)
								break
							}
						}
						break
					}
					Set
					{
						$This.Api.Set.Build()
						$This.Api.Set.Uri($This.Api.Set)
						break
					}
					Rem
					{
						$This.Api.Rem.Build()
						$This.Api.Rem.Uri($This.Api.Rem)
						break
					}
					Default
					{
						$This.Api.Get.Build()
						$This.Api.Get.Uri($This.Api.Get)
						break
					}
				}
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty $This.Api.Lasttype | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
			}
		}
	}
	[String] Request ()
	{
		$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
		$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty $This.Api.Lasttype | Select-Object -ExpandPrOperty Request
		$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
		Return $This.Api.Request
	}
	[String] Request ($x)
	{
		Set-Variable -Name query
		Switch ($x)
		{
			Get
			{
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty Get | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
				break
			}
			Set
			{
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty Set | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
				break
			}
			Rem
			{
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty Rem | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
				break
			}
			Filter
			{
				$This.Api.Cred.Uri($This.Api.Cred.Cred_EncryptionPw , $This.Api.Cred.Cred_UserName, $This.Api.Cred.Cred_Key )
				$query = $This | Select-Object -ExpandPrOperty Api | Select-Object -ExpandPrOperty Filter | Select-Object -ExpandPrOperty Request
				$This.Api.Request = sss (New-XgUri -Uri ( $This.Api.Uri ) -Login ($This.Api.Cred.Request) -query ($query))
				break
			}
		}
		Return $This.Api.Request
	}
	[String] GetFilter ()
	{
		$This.Api.LastType = "Get"
		Return $This.GetFilter("Default")
	}
	[String] GetFilter ($x)
	{
		Switch ($x)
		{
			{ $x -is [Filter_Build] } { $This.Api.Get.Build($x) ; break }
			{ $x -is [XgFilter] } { $This.Api.Get.Build($x) ; break }
			Default { $This.Api.Filter.BuildfromParEntYes() ; break }
		}
		$This.Api.Get.Build($This.Api.Filter.Filter_Entity)
		$This.Api.LastType = "Get"
		Return $This.Api.Filter.Request
	}
	[String] Get ()
	{
		$This.Api.LastType = "Get"
		Return $This.Get("Default")
	}
	[String]Get ($x)
	{
		Switch ($x)
		{
			{ $x -is [XgEntities] } { $This.Api.Get.Build($x) ; break }
			{ $x -is [Get_Build] } { $This.Api.Get.Build($x) ; break }
			{ $x -is [XgGet] } { $This.Api.Get.Build($x) ; break }
			Default { $This.Api.Get.Build() ; break }
		}
		$This.Api.LastType = "Get"
		Return $This.Api.Get.Request
	}
	[String] Set ()
	{
		$This.Api.LastType = "Set"
		Return $This.Set("Default")
	}
	[String] Set ($x)
	{
		Switch ($x)
		{
			{ $x -is [XgEntities] } { $This.Api.Set.Build($x) ; break }
			{ $x -is [Set_Build] } { $This.Api.Set.Build($x) ; break }
			{ $x -is [XgSet] } { $This.Api.Set.Build($x) ; break }
			Default { $This.Api.Set.Build() ; break }
		}
		$This.Api.LastType = "Set"
		Return $This.Api.Set.Request
	}
	[String] Rem ()
	{
		$This.Api.LastType = "Rem"
		Return $This.Rem("Default")
	}
	[String] Rem ($x)
	{
		Switch ($x)
		{
			{ $x -is [XgEntities] } { $This.Api.Rem.Build($x) ; break }
			{ $x -is [Rem_Build] } { $This.Api.Rem.Build($x) ; break }
			{ $x -is [XgRem] } { $This.Api.Rem.Build($x) ; break }
			Default { $This.Api.Rem.Build() }
		}
		$This.Api.LastType = "Rem"
		Return $This.Api.Rem.Request
	}
	[String] Cred ()
	{
		Return $This.Cred("Default")
	}
	[String] Cred ($x)
	{
		Switch ($x)
		{
			{ $x -is [Cred_Build] } { $This.Api.Cred.Build($x) ; break }
			{ $x -is [XgCred] } { $This.Api.Cred.Build($x) ; break }
			Default { $This.Api.Cred.Build() ; break }
		}
		Return $This.Api.Cred.Request
	}
	[String] Uri ()
	{
		$This.Api.Uri.Build()
		Return $This.Api.Uri.Request.Uri
	}
	[String] Uri ([XgApicall]$Apicall)
	{
		$This.Api.Uri.Build($This.Api.Uri, $This.Api.Cred.Request, $This.Api.$($Apicall).Request)
		Return $This.Api.Uri.Request
	}
}
