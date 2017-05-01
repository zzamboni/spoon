if [[ ! -o interactive ]]; then
    return
fi

compctl -K _spoon spoon

_spoon() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(spoon commands)"
  else
    completions="$(spoon completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
