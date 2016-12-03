
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

# some alias for shift
RUN alias shift='shift $(( $# > 0 ? 1 : 0 ))' 

#copy run script dest posotion
COPY run.sh /root/run.sh

# expose ssh port
EXPOSE 22:2222

VOLUME ["/opt/git"]
# enter to the user shell
ENTRYPOINT ["/bin/bash", "-c", "/root/run.sh"]
# CMD /bin/bash


