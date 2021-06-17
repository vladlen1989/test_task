
$url = "https://cs-share.qulix.com/share/30d6755abe8dcd861cfd0347125017645c0f23adfffd67a8aaed1/logs.zip"
$output = "C:\logs\log.zip"
$unzip =  "C:\logs\unzip"
$logfile = "C:\logs\unzip\*.log"

if (!(Test-Path $unzip -PathType Container)) {New-Item -ItemType Directory -Force -Path $unzip}

Invoke-WebRequest -Uri $url -OutFile $output 

Expand-Archive -LiteralPath $output -DestinationPath $unzip -Force

$content=get-content $logfile -raw

$ip = Select-String "\d{2,3}\.\d{2,3}\.\d{1,3}\.\d{1,3}\s" -InputObject $content -AllMatches | foreach {$_.matches}

$ipcount=$ip | Group-Object Value

$ipsort = $ipcount | Sort-Object -Property @{ Expression = 'count'; Descending = $true } | Format-Table -Property name, count|Select -First 12

$ipsort
