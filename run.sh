#!/bin/bash

USER=uzver
DEFAULT_PASSWORD=derparol
echo "####################"
echo Starting...
echo User name: $USER
echo Default password: $DEFAULT_PASSWORD
echo "####################"
echo "Creating user $USER.."
if ! cat /etc/passwd | grep $USER 
then
    if useradd -b /home -G sudo -s /bin/bash $USER
    then
        echo $USER created OK
    else
        echo $USER creation ERROR
        exit $?
    fi
    if [ ! -f /home/$USER ]
    then
        mkdir /home/$USER && chown -R $user:sudo /home/$USER
    fi

    if passwd $USER << EOF
        $DEFAULT_PASSWORD
        $DEFAULT_PASSWORD
EOF
    then
        echo The password are set OK
    else 
        echo Password set ERROR!
        exit $?
    fi

fi

echo Starting ssh daemon...
if [ ! -d /run/sshd ]; then mkdir /run/sshd; fi
if /usr/sbin/sshd
then 
    echo Started OK
else
    echo starting error!
    exit $?
fi

su $USER
cd $HOME

echo done OK
