_spoon() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(spoon commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(spoon completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _spoon spoon
