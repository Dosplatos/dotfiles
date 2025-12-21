# Vi mode indicator before PS1
set -o vi
bind 'set show-mode-in-prompt on'

# Apply colors + reset properly
bind "set vi-ins-mode-string \"${VI_PURPLE_PREFIX}[I]\1\e[0m\2\""
bind "set vi-cmd-mode-string \"${VI_YELLOW_PREFIX}[N]\1\e[0m\2\""
