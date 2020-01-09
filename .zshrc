# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lazypanda/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="blinks"

# ZSH Theme Configurations
# ZSH_THEME="bullet-train"

# BULLETTRAIN_PROMPT_ORDER=(
# 	git
# 	context
# 	dir
# )

# BULLETTRAIN_PROMPT_ADD_NEWLINE=true
# BULLETTRAIN_PROMPT_SEPARATE_LINE=false

# BULLETTRAIN_CONTEXT_BG=red
# BULLETTRAIN_CONTEXT_FG=default

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Use natural scrolling for mousepad
TOUCHPAD_ID=`xinput list --id-only ELAN1200:00\ 04F3:3066\ Touchpad`
xinput set-prop ${TOUCHPAD_ID} "libinput Natural Scrolling Enabled" 1

# Self Commands (Alias and such)
# Useless Commands
alias meaningoflife="echo 'No meaning'"
alias whatami="echo panda"

# Changing Monitors
_lMon='eDP-1'
_hdmi='HDMI-1'
alias laptop='xrandr --output $_lMon --auto --output $_hdmi --off'
alias monitor='xrandr --output $_lMon --off --output $_hdmi --auto'
alias dual='xrandr --output $_lMon --auto --left-of $_hdmi --output $_hdmi --auto'

# Simple Alias
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias i3conf='subl ~/.config/i3/config'

alias spd='sudo systemctl suspend'
alias wifi='cmst'
alias bt='bluetoothctl'
alias music='cmus'
alias f='ranger' # Stands for file
alias pv='htop'
alias open='thunar . & disown' # Open File Manager GUI at specified directory
alias rofi_update='rm ~/.cache/rofi-3.runcache' # Removing ROFI search cache
alias update_mirror='sudo reflector --verbose --ipv6 --protocol "https" --country CA --country US --fastest 20 --save /etc/pacman.d/mirrorlist'

# Latex Stuff
alias compdf='latexmk -pdf -pvc -f'
alias cpsty='cp -r ~/.latexstyle/ .'
alias sublsty='subl -n ~/.latexstyle/lptex.sty'

# Auto time setting
alias timeset='timedatectl set'

# Utils Function
alias autotimeset='python ~/utils/auto_loc.py'
alias scratch='~/.utils/scratch.sh'
alias splitpdf='~/.utils/split_pdf.sh'

# Some VPN commands (for Proton VPN)
alias vpn='sudo protonvpn-cli'
alias vpnc='sudo protonvpn-cli --fastest-connect'
alias vpnr='sudo protonvpn-cli --reconnect'
alias vpncc='sudo protonvpn-cli --country-connect'
alias vpnca='sudo protonvpn-cli --country-connect CA'
alias vpnd='sudo protonvpn-cli --disconnect'
### END Self Commands

# School related
alias uw='ssh hykam@linux.student.cs.uwaterloo.ca'
alias genCourseStruct='~/.utils/gen_course_struct.sh'
source ~/.course_alias

# Terminal Related
source ~/.bash_profile
source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
