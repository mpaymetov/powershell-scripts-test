Param (
    [string]$ServiceName
    [string]$ServerToStartService
    [string]$ServerToStopService
)

Invoke-Command -ComputerName $ServerToStart -ScriptBlock {
  Get-Service $ServiceName | Set-Service -StartupType Automatic
  Get-Service $ServiceName | Start-Service  
}

Invoke-Command -ComputerName $ServerToStop -ScriptBlock {
  Get-Service $ServiceName | Stop-Service
  Get-Service $ServiceName | Set-Service -StartupType Disabled
}
