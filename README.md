# dotfiles

Configuration files for
[bash](./bash),
[git](./git),
[mc](./mc),
[tmux](./tmux),
[vim](./vim).  
Click on the links
for further info
on the configurations.


## Installation

Clone the repository to `~/.dotfiles`

```bash
$ git clone git@github.com:hagenw/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

If you store the repository at a place outside of your home directory
you will have to use the `-t ~` option with [stow].

[stow]: https://www.gnu.org/software/stow/


## Usage

To create symlinks to the configuration files in this repository run

```bash
$ stow vim
```

This assumes that you placed this repo somewhere in your home folder,
e.g. `~/.dotfiles`
as [stow] will create the symlinks one dir above.
If you have the repo at some place,
you can [stow] tell where to create the symlink with

```bash
$ stow -t ~ vim
```
