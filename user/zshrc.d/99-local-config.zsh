CONF_DIR=${LOCAL_ZSH_CONFIG:-$HOME/.local-zsh-conf}/zshrc.d

if [[ -d $CONF_DIR ]]; then
    userfiles=("$CONF_DIR"/*.zsh(DN))
    for file in $userfiles; do
        source "$file";    
    done;
fi;
