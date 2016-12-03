
FROM ubuntu:12.04

#FROM scratch
#ADD ubuntu.root.tar.bz2

MAINTAINER Vitali Adamenka <zdradnik@gmail.com>

# install additional packages
RUN apt-get update
RUN apt-cache search vim
RUN apt-get install -y vim
RUN apt-get install -y openssh-client
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo

# add user
RUN mkdir /home/user
RUN if [ ! -d /run/sshd ]; then mkdir /run/sshd; fi
RUN useradd -b /home -G sudo -p 'derparol' -s /bin/bash user
RUN chown -R user:sudo /home/user
RUN sync
#RUN service ssh restart

# expose ssh port
 EXPOSE 22:2222

# enter to the user shell
# CMD /bin/bash


