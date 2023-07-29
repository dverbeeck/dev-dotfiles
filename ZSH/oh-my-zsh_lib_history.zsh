## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    fc -p "$HISTFILE"
    echo >&2 History file deleted.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly 
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
SAVEHIST=1000000000
export HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=1000000000 
export HISTFILESIZE=1000000000 
export HISTTIMEFORMAT="[%F %T]"

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
unsetopt hist_ignore_dups       # ignore duplicated commands history list
unsetopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
unsetopt share_history          # share command history data
setopt inc_append_history
setopt hist_find_no_dups

