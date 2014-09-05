#Dockerfile
FROM ubuntu

MAINTAINER docker

RUN apt-get update

# install package
RUN apt-get -y install git vim
RUN apt-get -y install passwd openssh-server sudo

# create user
RUN useradd -m -s /bin/bash docker
RUN echo docker:docker |chpasswd

# setup sudoers
RUN echo "docker ALL=(ALL)NOPASSWD:ALL" >> /etc/sudoers

# setup sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri '/#UsePAM yes/a UsePAM no' /etc/ssh/sshd_config

# setup ssh
RUN mkdir -m 700 -p /home/docker/.ssh;chown docker:docker /home/docker/.ssh
ADD authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker:docker /home/docker/.ssh/authorized_keys; chmod 600 /home/docker/.ssh/authorized_keys

# init
RUN /etc/init.d/ssh start
RUN /etc/init.d/ssh stop

# expose
EXPOSE 22

# start SSH
# CMD /etc/init.d/ssh start
CMD ["/usr/sbin/sshd","-D"]

