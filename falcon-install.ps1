$TOKEN = curl  -URI "https://api.crowdstrike.com/oauth2/token" -Method POST -ContentType application/x-www-form-urlencoded -UseBasicParsing -Body "client_id=$"{{ secrets.FALCON_CLIENT_ID }}&client_secret=$"{{ secrets.FALCON_CLIENT_SECRET }}" | ConvertFrom-Json | select-object -expandproperty access_token | format-table | out-string
invoke-webrequest -URI "https://api.crowdstrike.com/sensors/entities/download-installer/v1?id=802670e3dcf2d011b132ced6e4faacb2693fc69a8fb75ef2e15ec10e103e45fa" -Method GET -headers @{'Content-type' = 'application/json'; 'authorization'= "bearer $Token"} -outfile C://WindowsSensor.exe
C:\WindowsSensor.exe /install /quiet /norestart ProvWaitTime=1800000 NO_START=1 CID=F1F65D84CAE5476193D2BB6CB48A77F6-AA





