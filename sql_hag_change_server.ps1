# use: sql_hag_change_server.ps1 <HighAvailabilityGroupName> <PrimaryServerName> <SecondaryServerName>

Param (
    [string]$HighAvailabilityGroupName,
    [string]$PrimaryServerName
    [string]$SecondaryServerName
)

Invoke-Command -ComputerName $PrimaryServerName -ScriptBlock {
    $Path = "SQLSERVER:\Sql\$SecondaryServerName\InstanceName\AvailabilityGroups\$HighAvailabilityGroupName"
    Set-SqlAvailabilityGroup -Path $Path
}
