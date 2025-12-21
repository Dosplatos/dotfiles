# Prompt Colors
BLUE='\[\e[38;5;33m\]'
MAG='\[\e[38;5;134m\]'
BOLD='\[\e[1m\]'
RESET='\[\e[0m\]'
WHITE='\[\e[37m\]'

# Raw ANSI colors (for scripts/printf/awk; NOT PS1-safe)
C_RED=$'\e[38;5;196m'
C_ORANGE=$'\e[38;5;202m'
C_YELLOW=$'\e[38;5;220m'
C_GREEN=$'\e[38;5;82m'
C_CYAN=$'\e[38;5;45m'
C_BLUE=$'\e[38;5;33m'
C_MAG=$'\e[38;5;134m'
C_PURPLE=$'\e[38;5;93m'
C_PINK=$'\e[38;5;205m'
C_GRAY=$'\e[38;5;245m'
C_RESET=$'\e[0m'

# Truecolor hostname (FFED78), with 256-color fallback if needed
if [[ "$COLORTERM" == *truecolor* || "$TERM" == *-direct ]]; then
  HOSTYEL='\[\e[38;2;255;237;120m\]'
else
  HOSTYEL='\[\e[38;5;228m\]'
fi

# Truecolor and 256-color fallbacks
if [[ "$COLORTERM" == *truecolor* || "$TERM" == *-direct ]]; then
  VI_PURPLE_PREFIX=$'\1\e[38;2;168;85;250m\2'
  VI_YELLOW_PREFIX=$'\1\e[38;2;255;237;120m\2'
else
  VI_PURPLE_PREFIX=$'\1\e[38;5;134m\2'
  VI_YELLOW_PREFIX=$'\1\e[38;5;228m\2'
fi
