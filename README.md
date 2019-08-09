<h1 align="center">
  <br>
  shell-notifier
  <br>
</h1>

<h4 align="center">Send a notification via Discord on every new SSH login</h4>

## Proposal
I wanted a notification for every time a new SSH session has begun.

## Requirements
* [cURL](https://curl.haxx.se/)
* [jq](https://stedolan.github.io/jq/)
* [discord.sh](https://github.com/ChaoticWeg/discord.sh) (assumes you have it installed in your `$PATH`)

## Install
Simply add the following lines to your `~/.bashrc`, `~/.zshrc` or other sourced file.
```sh
# Discord webhook (put the webhook URL inside the quotes)
export WEBHOOK_URL=""
# Execute webhook
(curl -sL https://raw.githubusercontent.com/NurdTurd/shell-notifier/master/notify.sh | bash -s "$WEBHOOK_URL" &)
```

## Usage
Simply open a shell!

### Example
Discord webhook example:

![Screenshot](https://i.imgur.com/Dpp3qNW.png)
