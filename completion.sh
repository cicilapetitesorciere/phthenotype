function _ptheno_completion {

    if [ "${#COMP_WORDS[@]}" == "2" ]; then
        COMPREPLY=($(compgen -W "link unlink load save status ls rm install help home" "${COMP_WORDS[1]}"))
    elif [ "link" == "${COMP_WORDS[1]}" ]; then
        COMPREPLY=($(compgen -W "$(\ls)" "${COMP_WORDS[2]}"))
    elif [ "unlink" == "${COMP_WORDS[1]}" ]; then
        COMPREPLY=($(compgen -W "$(\ls)" "${COMP_WORDS[2]}"))
    elif [ "load" == "${COMP_WORDS[1]}" ]; then
        COMPREPLY=($(compgen -W "$(\ls $(ptheno home)/styles)" "${COMP_WORDS[2]}"))
    elif [ "rm" == "${COMP_WORDS[1]}" ]; then
        COMPREPLY=($(compgen -W "$(\ls $(ptheno home)/styles)" "${COMP_WORDS[2]}"))
    elif [ "install" == "${COMP_WORDS[1]}" ]; then
        COMPREPLY=($(compgen -W "$(\ls -d */)" "${COMP_WORDS[2]}"))
    fi
    
}

complete -F _ptheno_completion ptheno