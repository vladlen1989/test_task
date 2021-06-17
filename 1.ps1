param ($param1)
$name1 = $MyInvocation.MyCommand
$count =1
$date =get-date -Format "yyyy-mm-dd hh:mm:ss K"
if ($param1 -ge 1)
{while ($param1 -ge $count) {
Write-Host "[имя скрипта:$name1]    [$date]    [попытка номер:$count]"
$count++
start-sleep 1
 }}
else
{while ($count -ge 1) {
Write-Host "[имя скрипта:$name1]    [$date]    [попытка номер:$count]"
$count++
start-sleep 1
 }}