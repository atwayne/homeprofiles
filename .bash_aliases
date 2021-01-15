alias gd="git diff --ignore-all-space --ignore-space-at-eol --ignore-space-change --ignore-blank-lines -- ."
alias s="git status"

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias azure='cd ~/repos/azure/'
alias github='cd ~/repos/github/'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias ports='netstat -tulanp'

alias cls='clear'

alias dcup='docker-compose up'
alias dcpull='docker-compose pull'
alias dcbuild='docker-compose build'
alias dtail='docker logs -tf --tail="50" "$@"'
