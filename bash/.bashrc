# .bashrc

PATH="${PATH}:${HOME}/.bin:${HOME}/.local/bin"
export EDITOR=vim


# ===== BASH SETTINGS ====================================================
#
# --- Return if non-interactive shell
[[ -z "${PS1}" ]] && return
#
# --- Global definitions (no longer used on Debian systems)
[[ -f '/etc/bashrc' ]] && source '/etc/bashrc'
#
# --- Autocompletion
[[ -f "/etc/bash_completion" ]] && source "/etc/bash_completion"
[[ -f "${HOME}/.bash_completion" ]] && source "${HOME}/.bash_completion"
# No tab-complementation on the begining of a line
shopt -s no_empty_cmd_completion
# Show no hidden files (.) by tab complementation
bind 'set match-hidden-files off'
# Correct minor typos in directories
shopt -s cdspell
# Correct minor typos in directories by tab complementation
shopt -s dirspell
#
# --- Colors
# Allow vim to recognize 256 colors over any combination of ssh and tmux
# (https://github.com/jalvesaq/southernlights#bash-configuration)
[[ "${TERM}" == *"xterm"* ]] && export TERM=xterm-256color
[[ "${TERM}" == *"256color"* ]] && export HAS_256_COLORS=true
if [[ "${TERM}" == "screen" ]] && [[ "${HAS_256_COLORS}" ]]; then
    export TERM=screen-256color
fi
# Mimetype colors
[[ -f "${HOME}/.dircolors" ]] && eval "$(dircolors -b ${HOME}/.dircolors)"
#
# --- Prompt
if [[ ${TERM} == *"256color"* ]] && [[ -f "${HOME}/.bashpromptrc" ]]; then
    source "${HOME}/.bashpromptrc"
fi
#
# --- Title
if [[ "${USER}" == "root" ]]; then
    PROMPT_COMMAND='echo -ne "\033]0;${USER}: ${PWD/$HOME/~}\007"'
else
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
fi
#
# --- History
# Load inputrc (for Matlab like bash history)
export INPUTRC="${HOME}/.inputrc"
# Ignore multiple history entries
export HISTCONTROL=ignoreboth
# Append new history items to .bash_history
shopt -s histappend
# Leading space hides commands from history (for sensitive commands)
export HISTCONTROL=ignorespace
# Increase history file size (default is 500)
export HISTFILESIZE=10000
# Increase history size (default is 500)
export HISTSIZE=${HISTFILESIZE}
# Ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
#
# --- Less
# Make less more friendly for non-text input files, see lesspipe(1)
[[ -x '/usr/bin/lesspipe' ]] && eval "$(lesspipe)"


# ===== EXTERNAL PROGRAMS ================================================
#
# --- tmux
# Attach or Start tmux in new terminal if not running
if [[ -z ${TMUX} ]]; then
    tmux attach || tmux
fi
#
# --- Gitlab
# Export Gitlab API key if stored in password manager
pass gitlab >&/dev/null && export GITLAB_API_TOKEN=$(pass gitlab)
#
# --- nvm
# Load Node Version Manager if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#
# --- pyenvs.sh
# https://github.com/audeering/pyenvs.sh
# Load pyenvs and set Python 3.10 as default
if [[ -f "${HOME}/git/audeering/pyenvs.sh/pyenvs.sh" ]]; then
    source "${HOME}/git/audeering/pyenvs.sh/pyenvs.sh"
    export PYENVS_PYTHON_VERSION="3.10"
fi
#
# --- simply-bash
# https://github.com/hagenw/simply-bash
# Load simply-bash
if [[ -f "${HOME}/git/simply-bash/simply-bash.sh" ]]; then
    source "${HOME}/git/simply-bash/simply-bash.sh"
fi
#
# --- pdftools
# https://github.com/hagenw/pdf-tools
# Load pdf-tools, requires simply-bash
if [[ -d "${HOME}/git/pdf-tools/bin" ]]; then
    PATH="${PATH}:${HOME}/git/pdf-tools/bin"
fi
#
# --- mpv
# Reuse Blu-Ray decrytion keys from MakeMKV
export LIBAACS_PATH=libmmbd
export LIBBDPLUS_PATH=libmmbd


# ===== ALIASES ==========================================================
# Debian comes with neomutt named as mutt, Ubuntu doesn't
if [[ $(which neomutt) ]] && [[ ! $(which mutt) ]]; then
    alias mutt='neomutt'
fi
alias mc='mc -d'  # disable mouse
alias version='lsb_release -a'  # version of linux distribution
# Showing hardware and driver infos
alias systeminfo='inxi -v5'
# ls
alias ls='ls --color=auto --group-directories-first'
# Show size in human readable format
alias df='df -h'
alias du='du -h'
# Open sphinx docs in default browser
alias docs='xdg-open build/html/index.html &>/dev/null || xdg-open build/sphinx/html/index.html &>/dev/null'
