# Jenkins Pipeline: GitHub + Telegram

## What It Does

* Gets the latest commit SHA from the `main` branch of a GitHub repo.
* Sends the SHA to Telegram via bot.
* Lists all branches in the repo.

## Requirements

* Jenkins with shell access (`curl`, `jq` installed).
* Telegram bot token + chat ID.
* GitHub repo (public or with access).

## Config

Edit these in the pipeline:

```groovy
TELEGRAM_BOT_TOKEN = 'your_bot_token'
TELEGRAM_CHAT_ID = 'your_chat_id'
REPO_OWNER = 'github_username'
REPO_NAME = 'repo_name'
```

## Pipeline Stages

* **Check Commit**: Gets latest commit SHA, sends to Telegram.
* **List Branches**: Prints all GitHub branches.

## Example Telegram Message

```
New commit on main branch: <commit_sha>
```
