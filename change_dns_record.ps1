Param (
    [string]$CName
    [string]$Resource
    [string]$Zone
    [string]$ADServer
)

Invoke-Command -ComputerName $ADServer -ScriptBlock {
	Add-DnsServerResourceRecordCName -Name "$CName" -HostNameAlias "$Resource" -ZoneName "$Zone"
}