# process to list all possible completions
export SSH_FIND_TARGET="~/newjunk/ssh/ssh-find-targets.py"

# process to generate the ssh command
__bla(){echo "ssh ${1}@${2}";}
SSH_COMMAND_GENERATOR="__bla"

# ssh command spawner
__spawn(){
     PROFILE="$1"; shift;
     TITLE="$1"; shift;

     setsid gnome-terminal --profile="$PROFILE" --title="$TITLE" -x $* >/dev/null 2>&1 </dev/null;
}
SSH_SPAWNER="__spawn"

s() {
    res=("${(s/=/)1}");
    userhost=("${(s/@/)res[1]}");

    profile=$res[2];
    user=$userhost[1];
    host=$userhost[2];

    sshcmd=`$SSH_COMMAND_GENERATOR "$user" "$host"`;
    eval $SSH_SPAWNER $profile $user@$host $sshcmd;
    #echo $sshcmd;    
}
