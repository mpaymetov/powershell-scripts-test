Param (
    [string]$DnsServerResourceRecordCName
    [string]$ADServer
)

Invoke-Command -ComputerName $ADServer -ScriptBlock {
	Add-DnsServerResourceRecordCName -Name "webpms" -HostNameAlias "$DnsServerResourceRecordCName" -ZoneName "test.local"
}