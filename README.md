# dotfiles

Configuration files

## Usage

To create symlinks to the config files in this repository run

```bash
$ stow vim
```

This assumes that you placed this repo somewhere in your home folder, e.g.
`~/.dotfiles` as `stow` will create the symlinks one dir above. If you have the
repo at some place you can `stow` tell where to create the symlink with

```bash
$ stow -t ~ vim
```
