# Path to your oh-my-zsh installation.
if [ -e "/home/roger/.oh-my-zsh" ]; then
    export ZSH=/home/roger/.oh-my-zsh
elif [ -e "/home/rcreasy/.oh-my-zsh" ]; then
    export ZSH=/home/rcreasy/.oh-my-zsh
else
    echo "oh-my! oh-my-zsh not found"
fi    

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sshds='ssh rcreasy@10.10.88.33'
alias sshbs='ssh rcreasy@10.10.88.31'
alias sshms='ssh root@10.10.88.37'
alias sshcs='ssh rcreasy@10.10.88.45'
alias sshwork='ssh rcreasy@work.containergraphics.com'
alias python=python3
alias s='git status'
alias cept='php vendor/bin/codecept'

# Get aliases specific to this box
source ~/.aliases

# Homestead
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# CODA
function coda() {
    ( cd ~/.coda && vagrant $* )
}

if [ -e "/home/roger/.oh-my-zsh" ]; then
    alias config='/usr/bin/git --git-dir=/home/roger/dotfiles/.git --work-tree=/home/roger/dotfiles'
elif [ -e "/home/rcreasy/.oh-my-zsh" ]; then
    alias config='/usr/bin/git --git-dir=/home/rcreasy/dotfiles/.git --work-tree=/home/rcreasy/dotfiles'
    
else
    echo "user not found"
fi    

# tmux-powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
PATH=$PATH:/home/rcreasy/tools/tmux-powerline:~/home/rcreasy/.local/bin

# Composer
if [ -d "/home/rcreasy/" ]; then
    PATH=$PATH:/home/rcreasy/.composer/vendor/bin/
elif [ -d "/home/roger/" ]; then
    PATH=$PATH:/home/roger/.config/composer/vendor:/home/roger/.config/composer/vendor/friendsofphp/php-cs-fixer
else
    echo "user not found"
fi    

# GOLANG
PATH=$PATH:/usr/local/go/bin
