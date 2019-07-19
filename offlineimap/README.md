# OfflineIMAP

## Installation

```bash
$ stow offlineimap
```

## Usage

In order to run [OfflineIMAP] as a daemon in the background to sync multiple
user accounts do:

```bash
$ systemctl --user start offlineimap@account1.service
$ systemctl --user start offlineimap@account2.service
```

If you plan to sync only one account, you could also use:

```bash
$ systemctl --user start offlineimap.service
```


## Further reading

There is a good general introduction to [OfflineIMAP] on the [Arch wiki].

Then there is background on [why not use maxconnections].

Have also a look at how to [integrate OfflineIMAP into systemd] to run it as a
daemon and the corresponding [offlineimap@.service] file.


## Discussion

[OfflineIMAP] is no longer actively developed, but has still good maintenance
support as of mid 2019.
[Other people] use [mbsync] instead, which seems to have similar problems of
getting only a few bug fix commits and releases (in 2019 there was one in May).


[OfflineIMAP]: http://www.offlineimap.org/
[Arch wiki]: https://wiki.archlinux.org/index.php/OfflineIMAP
[why not use maxconnections]: http://www.offlineimap.org/configuration/2016/01/29/why-i-m-not-using-maxconnctions.html
[integrate OfflineIMAP into systemd]: http://www.offlineimap.org/doc/contrib/systemd.html
[offlineimap@.service]: https://github.com/OfflineIMAP/offlineimap/blob/master/contrib/systemd/offlineimap%40.service
[Other people]: https://webgefrickel.de/blog/a-modern-mutt-setup
[mbsync]: http://isync.sourceforge.net/mbsync.html
