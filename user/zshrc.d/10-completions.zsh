USER_COMPLETION_DIR="${ZDOTDIR:-$HOME}"/.zprezto/user/completions
LOCAL_COMPLETION_DIR=${LOCAL_ZSH_CONFIG:-$HOME/.local-zsh-conf}/completions

if [[ -d $USER_COMPLETION_DIR ]]; then
    fpath=($USER_COMPLETION_DIR $fpath)
fi;

if [[ -d $LOCAL_COMPLETION_DIR ]]; then
    fpath=($LOCAL_COMPLETION_DIR $fpath)
fi;

export fpath
