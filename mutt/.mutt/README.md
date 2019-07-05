# Mutt configuration

## Requirements

The following programs need to be installed:

```
sudo apt install lynx notmuch-mutt khard vdirsyncer
pip3 install --user urlscan

```

## Fetching mails

To automatically run [offlineimap] in the background you can create a cron job
to do so. Just run

```bash
$ crontab -e
```

And add to the following lines to the document popping up:

```
# sync IMAP store every 5 min for offline use, see
# http://bit.ly/2JzSdFM
*/5 * * * * /usr/bin/offlineimap -q -u quiet
```
