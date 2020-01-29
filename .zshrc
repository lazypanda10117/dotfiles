# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/hkam/.oh-my-zsh"

ZSH_THEME="dieter"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Self Commands (Alias and such)
# Useless Commands
alias meaningoflife="echo 'No meaning'"
alias whatami="echo panda"

# Use natural scrolling for mousepad
TOUCHPAD_ID=`xinput list --id-only ELAN1200:00\ 04F3:3066\ Touchpad`
xinput set-prop ${TOUCHPAD_ID} "libinput Natural Scrolling Enabled" 1

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

# alias spd='sudo systemctl suspend'
alias wifi='cmst'
alias bt='bluetoothctl'
alias music='cmus'
alias f='ranger' # Stands for file
alias pv='htop'
alias lock='dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock' # lock screen for ubuntu
alias rofi_update='rm ~/.cache/rofi3.druncache' # Removing ROFI search cache
alias open='thunar . & disown' # Open File Manager GUI at specified directory
alias rofi_update='rm ~/.cache/rofi-3.runcache' # Removing ROFI search cache
alias update_mirror='sudo reflector --verbose --ipv6 --protocol "https" --country CA --country US --fastest 20 --save /etc/pacman.d/mirrorlist'

# Latex Stuff
alias compdf='latexmk -pdf -pvc -f'
alias cpsty='cp -r ~/.latexstyle/ .'
alias sublsty='subl -n ~/.latexstyle/lptex.sty'

# School related
alias uw='ssh hykam@linux.student.cs.uwaterloo.ca'
alias genCourseStruct='~/.utils/gen_course_struct.sh'
source ~/.course_alias

# Some VPN commands (for Proton VPN)
alias vpn='sudo protonvpn-cli'
alias vpnc='sudo protonvpn-cli --fastest-connect'
alias vpnr='sudo protonvpn-cli --reconnect'
alias vpncc='sudo protonvpn-cli --country-connect'
alias vpnca='sudo protonvpn-cli --country-connect CA'
alias vpnd='sudo protonvpn-cli --disconnect'

# Auto time setting
alias timeset='timedatectl set'

# Utils Function
alias autotimeset='python ~/utils/auto_loc.py'
alias splitpdf='~/.utils/split_pdf.sh'

### END Self Commands

# Terminal Related
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
