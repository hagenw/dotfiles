# Offlineimap

## Installation

```bash
$ stow offlineimap
```

## Usage

In order to run offlineimap as a daemon in the background to sync multiple user
accounts do:

```bash
$ sudo cp /usr/share/doc/offlineimap/examples/systemd/offlineimap@.service /etc/systemd/user/
$ systemctl –user start offlineimap@account1.service
$ systemctl –user start offlineimap@account2.service
```

If you plan to sync only one account, you could also use:

```bash
$ sudo cp /usr/share/doc/offlineimap/examples/systemd/offlineimap.service /etc/systemd/user/
$ systemctl --user start offlineimap.service
```
