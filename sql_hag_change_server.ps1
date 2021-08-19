# use: sql_hag_change_server.ps1 <HighAvailabilityGroupName> <SecondaryServerName>

Param (
    [string]$HighAvailabilityGroupName,
    [string]$SecondaryServerName
)

Invoke-Command -ComputerName $SecondaryServerName -ScriptBlock {
    $Path = "SQLSERVER:\Sql\$SecondaryServerName\DEFAULT\AvailabilityGroups\$HighAvailabilityGroupName"
    Switch-SqlAvailabilityGroup -Path $Path
}
