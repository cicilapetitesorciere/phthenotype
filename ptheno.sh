#!/bin/bash

if [ -z $XDG_STATE_HOME ]; then
    PTHENODIR=~/.local/share/phthenotype
else
    PTHENODIR=$XDG_STATE_HOME/phthenotype
fi

function help {
    echo "usage: $0 <command>"
    echo
    echo "Commands:"
    echo "   link <files>       Move <files> to a directory in phthenotype/active and replaces the original file with a symbolic link to the file's new location."
    echo "   unlink <files>     Undo $0 link"
    echo "   load <name>        Replace the contents of phthenotype/active with those of phthenotype/styles/<name> and reloads Sway."
    echo "   save [name]        Copy the contents of phthenotype/active into a directory in phthenotype/styles so that they can be loaded later."
    echo "   status             Print the name of the current style (i.e. the content of phthenotype/active/name)"
    echo "   ls                 List availible styles (i.e. the directories in phthenotype/styles)"
    echo "   rm <styles>        Removes one or more styles"
    echo "   install [path]     Installs $0 to [path]. If no path is given then ~/.local/bin is used as a default"
    echo "   help               Print this message"
}

case $1 in

    link) #####################################################

    if [ -z "$2" ]; then
        echo "usage: $0 link <files>"
        exit 1
    fi

    for file in ${@:2}
    do
        mkdir -p $PTHENODIR/active/${PWD##*/}
        [ -f $file ] && mv $file $PTHENODIR/active/${PWD##*/}/$file
        ln -s $PTHENODIR/active/${PWD##*/}/$file $file
        # echo $(pwd)/$file > $PTHENODIR/linked.txt
    done

    exit 0
    ;; #####################################################

    unlink) #####################################################
    if [ -z "$2" ]; then
        echo "usage: $0 unlink <file>"
        exit 1
    fi

    for file in ${@:2}
    do
        [ ! -f $file ] && echo "Error: no file $file" && exit 1
    done

    for file in ${@:2}
    do
        mv $PTHENODIR/active/${PWD##*/}/$file $file
        # sed -i "/^$(echo "${$(pwd)//\//\\/}")/$file\$/d" $PTHENODIR/linked.txt
    done

    exit 0
    ;; #####################################################

    load) #####################################################
    if [ ! -z "${@:3}" ] || [ -z "$2" ]; then
        echo "usage: $0 load <file>"
        exit 1
    fi
    rm -r $PTHENODIR/active/*
    cp -r $PTHENODIR/styles/$2/* $PTHENODIR/active
    echo $2 > $PTHENODIR/active/name
    sway reload > /dev/null
    exit 0
    ;; #####################################################

    save) #####################################################
    if [ -z "$2" ]; then
        name=$(cat "$PTHENODIR/active/name")
        [ -z $name ] && echo "Error: The curren't style's name cannot be found. Please provide a name using $0 save <name>" && exit 1
        if [ -f $PTHENODIR/styles/$name ]; then
            echo A style called $name already exists. Would you like to overwrite it? [y/n]
            read response
            [ $response != "y" ] && exit 0
        fi
    else
        name=$2
        echo $name > $PTHENODIR/active/name
    fi
    rm -rf $PTHENODIR/styles/$name
    cp -r $PTHENODIR/active $PTHENODIR/styles/$name
    rm $PTHENODIR/styles/$name/name
    exit 0
    ;; #####################################################

    rm) #####################################################
    if [ -z "$2" ]; then
        echo "usage: $0 rm <styles>"
        exit 1
    fi

    for style in ${@:2}
    do
        [ ! -d $PTHENODIR/styles/$style ] && echo "Error: style $style does not exist" && exit 1
    done

    for style in ${@:2}
    do
        echo Are you sure you would like to delete $style? [y/n]
        read response
        if [ $response == "y" ]; then
            rm -r $PTHENODIR/styles/$style
        fi
    done
    exit 0
    ;; #####################################################

    ls) #####################################################
    ls $PTHENODIR/styles
    exit 0
    ;;

    home) #####################################################
    echo $PTHENODIR
    exit 0
    ;; #####################################################

    status) #####################################################
    echo Current style: $(cat "$PTHENODIR/active/name")
    exit 0
    ;;

    install) #####################################################
    if [ -z $2 ]; then
        INSTALL_PATH=~/.local/bin
    else
        INSTALL_PATH=$2
    fi

    while $(command -v ptheno > /dev/null) && [ "$(which ptheno)" != "$INSTALL_PATH/ptheno" ]
    do
        echo Warning: the ptheno executable is already installed at $(which ptheno). This instance will be removed
        rm $(which ptheno)
    done

    cp $(pwd)/$0 $INSTALL_PATH/ptheno
    chmod +x $INSTALL_PATH/ptheno
    if $(! command -v ptheno > /dev/null); then
        echo Cannot run ptheno. Please make sure $INSTALL_PATH is in your path
        rm $INSTALL_PATH/ptheno
        exit 1
    fi
    

    mkdir -p $PTHENODIR
    mkdir -p $PTHENODIR/active
    cp -r styles $PTHENODIR/styles
    cp completion.sh $PTHENODIR
    # touch $PTHENODIR/linked.txt

    exit 0

    ;; #####################################################
    
    help) #####################################################
    help
    exit 0
    ;; #####################################################

    *) #####################################################
    help
    exit 1
    ;; #####################################################

esac