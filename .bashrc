# configuration done modularly, all sitting in $HOME/.bashrc.d
# the prepending order matters, so +NN or NNN for any _additions_

# config modules
BASHRC_D="$HOME/.bashrc.d"

if [[ -d "$BASHRC_D" ]]; then
  while IFS= read -r -d '' f; do
    [[ -r "$f" ]] && source "$f"
  done < <(
    LC_ALL=C find "$BASHRC_D" -maxdepth 1 -type f -name '*.sh' -print0 \
      | sort -z
  )
fi

unset BASHRC_D f
