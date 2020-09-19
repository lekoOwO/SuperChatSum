#!/bin/bash

PYTHONIOENCODING=utf-8

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "$DIR/config.ini"

output_dir="$DIR/output"
mkdir -p $output_dir

uuid=$(cat /proc/sys/kernel/random/uuid)

rawDataFilepath="$output_dir/$uuid.json"
calculatedFilepath="$output_dir/$uuid.calc.json"

URL=$1

echo -e "UUID:$uuid\n"

python "$DIR/chat-replay-downloader/chat_replay_downloader.py" "$URL" -message_type superchat -output "$rawDataFilepath" > /dev/null

python "$DIR/process.py" "$CURRENCYLAYER_API_KEY" "$rawDataFilepath" "$calculatedFilepath" -c "$DIR/$CURRENCY_FILE_NAME" -t "$TARGET_CURRENCY"
