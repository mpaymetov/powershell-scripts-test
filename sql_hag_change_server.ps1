# use: sql_hag_change_server.ps1 <HighAvailabilityGroupName> <MasterServerName>

Param (
    [string]$HighAvailabilityGroupName,
    [string]$MasterServer
)

$User = "test\admin"
$PWord = ConvertTo-SecureString -String "admin" -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

$SecondaryServer = ""

if ($MasterServer -eq "SQL01") {
    $SecondaryServer = "SQL02"
}

if ($MasterServer -eq "SQL02") {
    $SecondaryServer = "SQL01"
}

if ($SecondaryServer -ne "") {
    Invoke-Command -ComputerName $MasterServer -Credential $Cred -ScriptBlock {
        $Path = "SQLSERVER:\Sql\$SecondaryServer\InstanceName\AvailabilityGroups\$HighAvailabilityGroupName"
        Switch-SqlAvailabilityGroup -Path $Path
    }
}
