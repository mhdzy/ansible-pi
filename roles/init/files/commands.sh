shell() {
  local shellcmd=$(ps -p $$ | tail -n 1 | awk {'print $4'})
  local shellname=$(echo "$shellcmd" | sed 's/\/bin\///')
  
  # sometimes zsh will show up as '-zsh' on first login
  if [[ "$shellname" != "zsh" && "$shellname" != "bash" ]]; then
    local shellname=$(echo $shellcmd | sed 's/-//')
  fi

  echo $shellname
  return
}

Xpaste() {
  usage() { 
    printf "Usage: Xpaste [append|prepend] [ENV_VARIABLE] [STRING] [SEPARATOR]\n" 
  }

  local OPS="$1"
  local VAR="$2"
  local ARG="$3"
  [[ ! -z "$4" ]] && local SEP="$4"

  if [[ "$OPS" == "append" || "$OPS" == "app" || "$OPS" == "a" ]]; then
    local APPEND="${SEP:+$SEP}$ARG"
  elif [[ "$OPS" == "prepend" || "$OPS" == "pre" || "$OPS" == "p" ]]; then
    local PREPEND="$ARG${SEP:+$SEP}"
  else
    usage
    return
  fi

  if [[ "$(shell)" == "bash" ]] && [[ ":${!VAR}:" != *":$ARG:"* ]]; then
    local STRING="${!VAR:+"${!VAR}"}"
  elif [[ "$(shell)" == "zsh" ]] && [[ ":${(P)VAR}:" != *":$ARG:"* ]] ; then
    local STRING="${${(P)VAR}:+"${(P)VAR}"}"
  else
    printf "$ARG exists in $VAR\n"
    return
  fi

  export $VAR="${PREPEND:+$PREPEND}${STRING:+$STRING}${APPEND:+$APPEND}"
  return
}

Xappend() {
  declare VAR="$1"
  shift

  for ARG in "$@"
  do
    if [[ -d "$ARG" ]]; then
      Xpaste append "$VAR" "$ARG" ":"
    else
      printf "$ARG is not a directory\n"
    fi
  done
}

Xprepend() {
  declare VAR="$1"
  shift

  for ((i=$#; i>0; i--)); 
  do
    [[ $(shell) == "bash" ]] && local ARG="${!i}"
    [[ $(shell) == "zsh" ]]  && local ARG="$@[$i]"

    if [[ -d "$ARG" ]]; then
      Xpaste prepend "$VAR" "$ARG" ":"
    else
      printf "$ARG is not a directory\n"
    fi
  done
}

pathappend()  { 
  Xappend PATH $@
}

pathprepend() { 
  Xprepend PATH $@
}

ldpathappend() {
  Xappend LD_LIBRARY_PATH $@
}

ldpathprepend() {
  Xprepend LD_LIBRARY_PATH $@
}
