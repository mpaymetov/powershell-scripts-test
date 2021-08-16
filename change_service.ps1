$User = "test\admin"
$PWord = ConvertTo-SecureString -String "admin" -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

$ServiceName = "w3svc"

$ServerToStart = "web2.test.local"
Invoke-Command -ComputerName $ServerToStart -Credential $Cred -ScriptBlock {
  Get-Service $ServiceName | Set-Service -StartupType Automatic
  Get-Service $ServiceName | Start-Service  
}

$ServerToStop = "web1.test.local"
Invoke-Command -ComputerName $ServerToStop -Credential $Cred -ScriptBlock {
  Get-Service $ServiceName | Stop-Service
  Get-Service $ServiceName | Set-Service -StartupType Disabled
}
