# Offlineimap

## Installation

```bash
$ stow offlineimap
```

## Usage

In order to run offlineimap as a daemon in the background do the following
steps:

```bash
$ sudo cp /usr/share/doc/offlineimap/examples/systemd/offlineimap.service /etc/systemd/user/
$ systemctl --user start offlineimap.service
```

To sync more than one account run:

```bash
$ systemctl --user start offlineimap@account-name.service
```
