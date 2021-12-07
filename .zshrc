# Path to your oh-my-zsh installation.
  export ZSH=/home/markel/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=powerlevel10k/powerlevel10k
source ~/.purepower
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-remotebranch git-tagname)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git git-flow-completion vi-mode zsh-autosuggestions zsh-syntax-highlighting)

# User configuration

export PATH="/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/markel/.gem/ruby/2.1.0/bin:/home/markel/.gem/ruby/2.2.0/bin"
export ANDROID_HOME=/opt/android-sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=~/npm/bin:$PATH

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

autoload -U zmv

alias c="clear"
alias gc="git commit -m "
alias ga="git add -u"
alias gs="git status"
alias gps="git push"
alias gpl="git pull"
alias gcm="git checkout master"
alias gc-="git checkout -- "
alias g-="git checkout -"
alias vf="vifm ."
alias vifm="vifm ."
alias cp="rsync -avz --progress -h"
alias chromium="chromium --single-process"
alias k="sudo killall chrome"
alias zcp='zmv -C'
alias zln='zmv -L'
alias ur='for file in *.rar; do unrar x "${file}"; done;'
alias blueoff='pacmd set-card-profile alsa_card.pci-0000_00_1b.0 output:analog-stereo+input:analog-stereo'
alias blueon='pacmd set-card-profile alsa_card.pci-0000_00_1b.0 off'
alias vim="nvim"

bindkey -M viins 'fd' vi-cmd-mode
bindkey '^l' autosuggest-accept
bindkey -M menuselect '^[[Z' reverse-menu-complete

export KEYTIMEOUT=10

zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        # the command mode for vi
        echo -ne "\e[2 q"
    else
        # the insert mode for vi
        echo -ne "\e[4 q"
    fi
}

prompt_context () { }

unset zle_bracketed_paste
eval "$(dircolors -b)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/bin/core_perl:$HOME/.emacs.d/bin:$HOME/.local/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/default"
export DOCKER_HOST="tcp://0.0.0.0:2375"
export XDG_CURRENT_DESKTOP=gnome

###-tns-completion-start-###
if [ -f /home/markel/.tnsrc ]; then 
    source /home/markel/.tnsrc 
fi
###-tns-completion-end-###
###
source /usr/share/nvm/init-nvm.sh
