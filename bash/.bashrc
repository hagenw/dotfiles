# .bashrc

PATH="${PATH}:${HOME}/.bin:${HOME}/.local/bin"
export EDITOR=vim


# ===== MINIMAL BASH SETTINGS ============================================
#
# --- Return if non-interactive shell
[[ -z "${PS1}" ]] && return
#
# --- Global definitions (no longer used on Debian systems)
[[ -f '/etc/bashrc' ]] && source '/etc/bashrc'
#
# --- Load pyenvs.sh (https://github.com/audeering/pyenvs.sh)
if [[ -f "${HOME}/git/audeering/pyenvs.sh/pyenvs.sh" ]]; then
    source "${HOME}/git/audeering/pyenvs.sh/pyenvs.sh"
    export PYENVS_PYTHON_VERSION="3.10"
fi
#
# --- Load simply-bash scripts (https://github.com/hagenw/simply-bash)
if [[ -f "${HOME}/git/simply-bash/simply-bash.sh" ]]; then
    source "${HOME}/git/simply-bash/simply-bash.sh"
fi
#
# --- Load pdftools (https://github.com/hagenw/pdf-tools)
if [[ -d "${HOME}/git/pdf-tools/bin" ]]; then
    PATH="${PATH}:${HOME}/git/pdf-tools/bin"
fi


# ===== BASH SETTINGS ====================================================
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
# --- History
# Load inputrc (for Matlab like bash history)
export INPUTRC="${HOME}/.inputrc"
# Ignore multiple history entries
export HISTCONTROL=ignoreboth
#
# --- Title
if [[ "${USER}" == "root" ]]; then
    PROMPT_COMMAND='echo -ne "\033]0;${USER}: ${PWD/$HOME/~}\007"'
else
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
fi
#
# --- Less
# Make less more friendly for non-text input files, see lesspipe(1)
[[ -x '/usr/bin/lesspipe' ]] && eval "$(lesspipe)"
#
# --- Plugins
# Bash History Suggest Box (https://github.com/dvorka/hstr)
if [[ $(which hh) ]]; then
    alias hh=hstr                    # hh to be alias for hstr
    export HSTR_CONFIG=hicolor       # get more colors
    shopt -s histappend              # append new history items to .bash_history
    export HISTCONTROL=ignorespace   # leading space hides commands from history
    export HISTFILESIZE=10000        # increase history file size (default is 500)
    export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
    # ensure synchronization between Bash memory and history file
    export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
    # if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
    if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
    # if this is interactive shell, then bind 'kill last command' to Ctrl-x k
    if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
fi


# ===== EXTERNAL PROGRAMS ================================================
# Attach or Start tmux in new terminal if not running
if [[ -z ${TMUX} ]]; then
    tmux attach || tmux
fi

# Export Gitlab API key if stored in password manager
pass gitlab >&/dev/null && export GITLAB_API_TOKEN=$(pass gitlab)

# Load Node Version Manager if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ===== ALIASES ==========================================================
# Debian comes with neomutt named as mutt, Ubuntu doesn't
if [[ $(which neomutt) ]] && [[ ! $(which mutt) ]]; then
    alias mutt='neomutt'
fi
alias mc='mc -d'  # disable mouse
alias version='lsb_release -a'  # version of linux distribution
# Showing hardware and driver infos
alias systeminfo='inxi -v5'
# Image scaling (https://github.com/jarun/imgp)
alias scale='imgp -x 1200x1200 -w'
# ls
alias ls='ls --color=auto --group-directories-first'
# Show size in human readable format
alias df='df -h'
alias du='du -h'
# Open sphinx docs in brwosers
alias docs='vivaldi build/html/index.html &>/dev/null'
