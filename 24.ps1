
$url = "https://cs-share.qulix.com/share/30d6755abe8dcd861cfd0347125017645c0f23adfffd67a8aaed1/logs.zip"
$output = "C:\logs\download.zip"
$unzip =  "C:\logs\unzip"
$logfile = "C:\logs\unzip\*.log"

if (!(Test-Path $unzip -PathType Container)) {New-Item -ItemType Directory -Force -Path $unzip}

Invoke-WebRequest -Uri $url -OutFile $output 

Expand-Archive -LiteralPath $output -DestinationPath $unzip -Force

$content=get-content $logfile -raw


$ibVer = Select-String '/ibank/version.txt' -InputObject $content -AllMatches | foreach {$_.matches}

$ibCount= $ibVer | Group-Object Value

$ibSort = $ibCount | Format-Table -Property name, count
$ibSort


