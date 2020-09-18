$config = Get-Content 'config.ini' | ConvertFrom-StringData

$uuid = [Guid]::NewGuid().Guid
$rawDataFilename = $uuid + ".json"
$calculatedFilename = $uuid + ".calc.json"

$URL = $Args[0]

Write-Output ("UUID: " + $uuid)

python (Join-Path $PSScriptRoot "chat-replay-downloader/chat_replay_downloader.py") $URL -message_type superchat -output (Join-Path $PSScriptRoot $rawDataFilename) | Out-Null

python (Join-Path $PSScriptRoot "process.py") $config.CURRENCYLAYER_API_KEY (Join-Path $PSScriptRoot $rawDataFilename) (Join-Path $PSScriptRoot $calculatedFilename) -c (Join-Path $PSScriptRoot $config.CURRENCY_FILE_NAME)