# use: sql_hag_change_server.ps1 <HighAvailabilityGroupName> <MasterServerName>

Param (
    [string]$HighAvailabilityGroupName,
    [string]$MasterServerName
)

$SlaveServer = "SlaveServer"

$Path = "SQLSERVER:\Sql\$SlaveServer\InstanceName\AvailabilityGroups\$HighAvailabilityGroupName"

Switch-SqlAvailabilityGroup -Path $Path