Param (
    [string]$DnsServerResourceRecordCName
)

$User = "test\admin"
$PWord = ConvertTo-SecureString -String "admin" -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

$ADServer = "main.test.local"
Invoke-Command -ComputerName $ADServer -Credential $Cred -ScriptBlock {
	Add-DnsServerResourceRecordCName -Name "webpms" -HostNameAlias "$DnsServerResourceRecordCName" -ZoneName "travelline.lan"
}