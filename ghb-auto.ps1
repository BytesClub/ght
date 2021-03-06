# powershell completion support for GHB.
#
# GHB - GitHub on Terminal
# Copyright (C) 2017 Progyan Bhattacharya <admin@codeprogyan.me>
# Maintained by: Bytes Club (https://bytesclub.github.io)<bytes-club@googlegroups.com>
# Distributed under MIT License.

_ghb() {
    local cur prev opt
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    declare -a opts

    if ( $prev == "ghb" ) {
        unset opts
        opts=("-h" "--help" "-v" "--version" "init" "status" "issues" "pulls")
    }
    else if ( $prev == "issues" || $prev == "pulls" ) {
        unset opts
        opts=("open" "closed" "all" "id=")
    }

    opt=''
    foreach ( i in "${opts[@]}" ) {
        if ( $i == "${cur}"* )
            opt="$opt $i"
    }

    COMPREPLY=( $(compgen -W "${opt}" -- ${cur}) )
    return 0
}
complete -F _ghb ghb