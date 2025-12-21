# Supporting shell functions

pretty_aliases() {
  # one_line: 0 = multiline default, 1 = oneline
  local one_line="${1:-0}"

  # Palette (edit here; the palette length is handled dynamically)
  local -a PALETTE=(
    "$C_RED" "$C_ORANGE" "$C_YELLOW" "$C_GREEN" "$C_CYAN"
    "$C_BLUE" "$C_MAG" "$C_PURPLE" "$C_PINK"
  )

  # Join palette into a single string for awk (Unit Separator delimiter)
  local delim=$'\x1f'
  local palette_joined=""
  local i

  for i in "${!PALETTE[@]}"; do
    if (( i == 0 )); then
      palette_joined="${PALETTE[i]}"
    else
      palette_joined+="${delim}${PALETTE[i]}"
    fi
  done
  unset i

  alias | awk \
    -v one_line="$one_line" \
    -v palette="$palette_joined" \
    -v delim="$delim" \
    -v gray="$C_GRAY" \
    -v reset="$C_RESET" \
    '
    BEGIN {
      n = split(palette, c, delim);  # c[1..n]
      count = 0;
    }

    /^alias[ \t]+/ {
      sub(/^alias[ \t]+/, "", $0);

      split($0, parts, "=");
      name  = parts[1];
      value = substr($0, length(name) + 2);

      color = c[((NR - 1) % n) + 1];

      if (one_line == 1) {
        if (count > 0) printf " ";
        printf "%s%s%s%s:%s%s", color, name, reset, gray, value, reset;
        count++;
      } else {
        printf "%s%s%s%s:%s%s\n", color, name, reset, gray, value, reset;
      }
    }

    END {
      if (one_line == 1) printf "\n";
    }
    '
}

pa() {
  case "${1:-}" in
    "" )
      pretty_aliases 0
      ;;
    -o|--oneline )
      pretty_aliases 1
      ;;
    --help|-h )
      cat <<'EOF'
pa - Pretty-print for shell aliases with colorized alias names.

Usage:
  pa              Show aliases, one per line (default)
  pa -o           Show aliases on one line, space-delimited
  pa --help       Show this help text

Notes:
  - Any other argument is treated as unknown and will not run.
EOF
      ;;
    * )
      printf "%s\n" "Unknown argument: '$1' (run: pa --help)"
      return 2
      ;;
  esac
}
