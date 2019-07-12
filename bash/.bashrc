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
# --- Load scripts (https://github.com/hagenw/simply-bash)
if [[ -d "${HOME}/git/simply-bash" ]]; then
    source "${HOME}/git/simply-bash/simply-bash.sh"
else
    echo "Minimal .bashrc loaded, please install https://github.com/hagenw/simply-bash for full version."
    return
fi


# ===== BASH SETTINGS ====================================================
#
# --- pipenv
export WORKON_HOME=~/.envs
#
# --- Autocompletion
is file '/etc/bash_completion' && source '/etc/bash_completion'
is file '${HOME}/.bash_completion' && source '${HOME}/.bash_completion'
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
if is substring "xterm" "${TERM}"; then
    export TERM=xterm-256color
fi
if is substring "256color" "${TERM}"; then
    export HAS_256_COLORS=true
fi
if is matching "screen" "${TERM}" && is true "${HAS_256_COLORS}"; then
    export TERM=screen-256color
fi
# Mimetype colors
is file "${HOME}/.dircolors" && eval "$(dircolors -b ${HOME}/.dircolors)"
#
# --- Prompt
if is substring "256color" "${TERM}" && is file "${HOME}/.bashpromptrc"; then
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
if is equal "${USER}" "root"; then
    PROMPT_COMMAND='echo -ne "\033]0;${USER}: ${PWD/$HOME/~}\007"'
else
    PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
fi
#
# --- Less
# Make less more friendly for non-text input files, see lesspipe(1)
is executable '/usr/bin/lesspipe' && eval "$(lesspipe)"
#
# --- Plugins
# Bash History Suggest Box (https://github.com/dvorka/hstr)
export HH_CONFIG=monochromatic   # avoid color as they cannot be configured
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"  # mem/file sync
is executable 'hh' && bind '"\C-r": "\C-a hh \C-j"'    # bind to Ctrl-r
# bashmarks (https://github.com/huyng/bashmarks)
is file "${HOME}/.bin/bashmarks.sh" && source "${HOME}/.bin/bashmarks.sh"
# pdf-tools (https://github.com/hagenw/pdf-tools)
is dir "${HOME}/git/pdf-tools" && PATH="${PATH}:${HOME}/git/pdf-tools"
# basher (https://github.com/basherpm/basher)
if is dir "${HOME}/.basher"; then
    PATH="${PATH}:$HOME/.basher/bin"
    eval "$(basher init -)"
fi

# ===== ALIASES ==========================================================
# Debian comes with neomutt named as mutt, Ubuntu doesn't
if is available neomutt and is not available mutt; then
    alias mutt='neomutt'
fi
alias mc='mc -d'  # disable mouse
alias version='lsb_release -a'  # version of linux distribution
alias t='todo-txt'
# vim aliases
alias vimtex='vim *.tex'
alias vimbib='vim *.bib'
alias vimm='vim *.m'
alias vimplt='vim *.plt'
alias v='fzy-vim.sh'
# Start Matlab without GUI
alias matlab='matlab -nodesktop -nosplash'
# Start Octave without gui
alias octave='octave --no-gui'
# Showing hardware and driver infos
alias systeminfo='inxi -v5'
# Allow mistyping of git
alias gti='git'
# Image scaling (https://github.com/jarun/imgp)
alias scale='imgp -x 1200x1200 -w'
# nnn file manager (https://github.com/jarun/nnn)
alias n='nnn'
# fpp (https://github.com/facebook/PathPicker)
alias pp='fpp --no-file-checks'
# ls
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l --group-directories-first'
alias lh='ls -lh'
alias la='ls -A'
#alias l='ls -CF'  # used by bashmarks
# Show size in human readable format
alias df='df -h'
# Ignore .svn directories with grep
alias grep='grep --exclude-dir=".svn"'

# Start tmux in new terminal
if is empty "${TMUX}"; then
    tmux
fi
