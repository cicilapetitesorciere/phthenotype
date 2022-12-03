case $1 in
    load)
    rm -r $PTHENODIR/active/*
    cp -r $PTHENODIR/styles/$2/* $PTHENODIR/active
    sway reload > /dev/null
    ;;

    link)
    mkdir -p $PTHENODIR/active/${PWD##*/}
    [ -f $2 ] && mv $2 $PTHENODIR/active/${PWD##*/}/$2
    ln -s $PTHENODIR/active/${PWD##*/}/$2 $2
    ;;

    unlink)
    mv $PTHENODIR/active/${PWD##*/}/$2 $2
    ;;

    save)
    case $2 in
        "")
        name=$(cat "$PTHENODIR/active/name")
        [ -z $name ] && echo "Please provide a name" && exit
        if [ -f $PTHENODIR/styles/$name ]; then
            echo A style called $name already exists. Would you like to overwrite it? [y/n]
            read response
            [ $response != "y"] && exit
        fi
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

    home)
    echo $PTHENODIR
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
    
