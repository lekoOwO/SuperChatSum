$env:PYTHONIOENCODING = "utf-8"

$config = Get-Content (Join-Path $PSScriptRoot 'config.ini')  | ConvertFrom-StringData

$output_dir = Join-Path $PSScriptRoot "output"
If(!(Test-Path $output_dir))
{
    New-Item -ItemType Directory -Force -Path $output_dir | Out-Null
}

$uuid = [Guid]::NewGuid().Guid

$rawDataFilepath = Join-Path $output_dir ($uuid + ".json")
$calculatedFilepath = Join-Path $output_dir ($uuid + ".calc.json")

$URL = $Args[0]

Write-Output ("UUID: " + $uuid)

python (Join-Path $PSScriptRoot "chat-replay-downloader/chat_replay_downloader.py") $URL -message_type superchat -output $rawDataFilepath | Out-Null

python (Join-Path $PSScriptRoot "process.py") $config.CURRENCYLAYER_API_KEY $rawDataFilepath $calculatedFilepath -c (Join-Path $PSScriptRoot $config.CURRENCY_FILE_NAME)