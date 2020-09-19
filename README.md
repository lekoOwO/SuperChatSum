# SuperChatSum

A tool which calculates the amount of super chats of a previous Youtube live stream.

## Setup

`git clone --recursive https://github.com/lekoOwO/SuperChatSum`

Fill your CurrencyLayer API Key in `config.ini`

`pip install -r chat-replay-downloader/requirements.txt`

### Linux

`chmod +x run.bash`

## Usage

### Windows

`run.ps1 https://www.youtube.com/watch?v=97w16cYskVI`

### Linux

`run.bash https://www.youtube.com/watch?v=97w16cYskVI`

Output:

```
UUID: b80f4c8d-0859-45c4-96a6-cc70bf901e13

Total: 946131.1919 TWD
2857 super chats received.
0 super stickers received.


Max: 10687.9046 TWD (500 SGD)
Min: 5.4002 TWD (0.99 BRL)
```
