# Build evironment based on ubuntu 12.04

The 2222 port is used as a bind for ssh(22).
The defult user name: user
The default user password: derparol

Prepare:
  install docker(docker-io for ubuntu)

Use:
  docker build ubuntu1204buildenvironment/ - should return a DOCKER_IMAGE_ID if build OK
  docker run DOCKER_IMAGE_ID 
  ssh -p 2222 user@127.0.0.1
  or use docker run -i -t DOCKER_IMAGE_ID 
  
 
