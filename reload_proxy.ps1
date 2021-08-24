Param (
    [string]$User
    [string]$Server
)

ssh $User@$Server "systemctl reload nginx"