curl -I http://web2.test.local/index.php

powershell ./sql_hag_change_server.ps1 <SQLHighAvailabilityGroupName> <SQLMasterServerName>

powershell ./change_service.ps1

powershell ./change_dns_record.ps1 web2.test.local

ssh root@frontend-proxy.test.local "systemctl reload nginx"