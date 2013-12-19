typeset -gA STATIC_DIR_EXPANSIONS

function handle_static_dir_alias_mapping () {
  case $1 in
    n)
      for key in ${(k)STATIC_DIR_EXPANSIONS}; do
        if [[ "$2" =~ "${key}.*" ]]; then
          typeset -ga reply
          reply=( "${STATIC_DIR_EXPANSIONS[$key]}/${2[((${#key}+1)),-1]}" )
          return 0;
        fi;
      done;
    ;;
  esac
  return 1;
}

zsh_directory_name_functions=(${zsh_directory_name_functions[@]} handle_static_dir_alias_mapping)

export STATIC_DIR_EXPANSIONS
export zsh_directory_name_functions
