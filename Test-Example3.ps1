.\SophosXG-API ~> Show-XgApi
====
Cred
====


Cred_Guid         : c7abd168-bc97-4987-b97c-5fe439f03057
Cred_EncryptionPw : System.Security.SecureString
Cred_Name         : Test
Cred_UserName     : Test.Api
Cred_Key          : System.Security.SecureString
Request           : System.Security.SecureString



======
Filter
======
Filter          : True
Filter_Criteria : Like
Filter_Name     : Test
Filter_Entity   : iphost
Request         : <Get><Filter><Key%20Name="IPHost"%20Criteria="Like">Test</Key></Filter></Get>



===
Get
===
Get_Entity : iphost
Request    : <Get><IPHost></IPHost></Get>



========
Lasttype
========
Get


===
Rem
===
Rem_Entity : iphost
Rem_Name   : Test
Request    : <Remove><IPHost>Test</IPHost></Remove>



=======
Request
=======
System.Security.SecureString


========
Response
========
APIVersion  : 1702.1
IPS_CAT_VER : 1
login       :
IPHost      : { @{transactionid = ; Name = 192.168.90.0 / 24; IPFamily = IPv4; HostType = Network; HostGroupList = ; IPAddress = 192.168.90.0; Subnet = 255.255.255.0 }, @{transactionid = ; Name = 192.168.92.0 / 24; IPFamily = IPv4; HostType = Network; HostGroupList = ;
    IPAddress = 192.168.92.0; Subnet = 255.255.255.0
  }, @{transactionid = ; Name = 192.168.94.0 / 24; IPFamily = IPv4; HostType = Network; HostGroupList = ; IPAddress = 192.168.94.0; Subnet = 255.255.255.0 }, @{transactionid = ; Name = 192.168.91.0 / 24;
    IPFamily = IPv4; HostType = Network; HostGroupList = ; IPAddress = 192.168.91.0; Subnet = 255.255.255.0
  }... }



===
Set
===
Set_Operation : add
Set_Entity    : iphost
Request       : <Set Operation="add"><IPHost><Name>Test</Name><Address>192.168.0.10</Address></IPHost></Set>



===
Uri
===
Uri_Scheme  : https
Uri_Address : gw.company.com
Uri_Port    : 4444
Uri_ApiVer  : 1702.1
Request     : https://Test.com:4444/webconsole/APIController%3Freqxml=%3CRequest%20APIVersion=%221702.1%22%3E%3C/Request%3E

