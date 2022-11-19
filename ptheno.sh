#!/bin/sh

PTHENODIR=~/.config/phthenotype

case $1 in
    load)
    cp $PTHENODIR/styles/$2/* $PTHENODIR/active
    ;;

    link)
    ln -s $PTHENODIR/active/${PWD##*/}/$2 $2
    ;;

    save)
    case $2 in
        "")
        name=$(cat "$PTHENODIR/active/name")
        [ -z $name ] && echo please provide a name && exit
        ;;

        *)
        name=$2
        echo $name > $PTHENODIR/active/name
        ;;
    esac
    rm -rf $PTHENODIR/styles/$name
    cp -r $PTHENODIR/active $PTHENODIR/styles/$name
    ;;

    rm)
    [ -z $2 ] && echo $1 requires an additional argument && exit
    echo Are you sure you would like to delete $2? [y/n]
    read response
    [ $response != "y" ] && exit
    rm -r $PTHENODIR/styles/$2
    ;;

    ls)
    ls $PTHENODIR/styles
    ;;

    status)
    echo Current style: $(cat "$PTHENODIR/active/name")
    #echo Supports: $(cd $PTHENODIR/active; ls -d */)
    ;;

    install)
    $PTHENODIR/install.sh
    ;;
    
    "")
    echo ptheno needs an argument
    
    ;;
    *)
    echo ptheno: no command $1
    ;;
esac
    