# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# On Ubuntu changing default shell to zsh is problematic. Therefore zsh is
# started in ~/.bashrc and $PATH has also to be set there.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
##ZSH_THEME="mortalscumbag"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
funciton precmd () {
echo -ne "\033]0;$(pwd | sed -e "s;^$HOME;~;")\a"
}

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# Wakatime:
#   cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/sobolevn/wakatime-zsh-plugin.git wakatime
#   python3 -c "$(wget -q -O - https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py)"
plugins=(
    git
    zsh-navigation-tools
    zsh-autosuggestions
)
    # zsh-history-enquirer
    # wakatime

source $ZSH/oh-my-zsh.sh
#
# Enable fuzzy completion with fzf
# Requirements:
#   sudo apt install fd-find

# Options to fzf command
export FZF_COMPLETION_OPTS='--multi --border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fdfind --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --follow --exclude ".git" . "$1"
}

# source /usr/share/doc/fzf/examples/completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# quickly reload zsh-config
alias zrl="source ~/.zshrc"

# Below aliases replace many standard-tools by more fancy versions. To get them
# installed run:
#
#   > echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
#   > sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
#   > sudo apt update
#
#   > sudo apt install broot bashtop gping

# add a shell function for broot (https://dystroy.org/broot/)
# source $HOME/.config/broot/launcher/bash/br

# aliases to start nvim
alias vi="nvim"
alias vim="nvim"

# use bat to show colored and formatted output
# Requirements:
#   sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
# this avoids formatting problems in manpages with batcat
export MANROFFOPT="-c"

# replase ls with exa (https://github.com/ogham/exa)
# requirements:
#   Ubuntu >= 20.10: sudo apt install exa
#   Other: Download from releasses and copy the binary to ~/.local/bin
#          and completion-file to ~/.oh-my-zsh/completions
alias ls="exa --icons --group-directories-first"
alias ll="ls -lh"
alias la="ls -lah"
alias lt="ls -lahT"

# use bashtop instead of top
alias top="bashtop"

# use gping instead of ping
alias ping="gping"

# use the zellij terminal-multiplexer (https://zellij.dev)
# download and copy to ~/.local/bin/
alias zl="zellij"


# LS_COLORS is used by GNU ls and Zsh completions. LSCOLORS is used by BSD ls.
export LS_COLORS='fi=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'
LS_COLORS+='pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32'
export LSCOLORS='ExGxDxDxCxDxDxFxFxexEx'

if (( terminfo[colors] >= 256 )); then
  LS_COLORS+=':no=38;5;248'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'        # the default is hard to see
else
  LS_COLORS+=':no=1;30'
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black,bold' # the default is outside of 8-color range
fi

# TREE_COLORS is used by GNU tree. It looks awful with underlined text, so we turn it off.
export TREE_COLORS=${LS_COLORS//04;}
