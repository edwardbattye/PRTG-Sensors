#Poll a log which is date based on the filename
$date = Get-Date -Format "yyyyMMdd"
#Check for Warning: Invalid parameter and count number of occurances, this can then be used for a PRTG sesnor
$result = @( Get-Content "\\log_file_path_here_$date.txt" | Where-Object { $_.Contains("Warning: Invalid parameter") } ).Count
$result2= $result|Out-String
$ok = 'ok'
$error1 = 'Error'
If ($result -eq "0") {write-host $result":"$ok}
Elseif ($result -gt "0"){write-host $result":"$error1}
