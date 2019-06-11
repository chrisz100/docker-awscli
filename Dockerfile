FROM debian:buster
RUN apt update && apt install -y curl python3 python3-pip bash-completion vim ipcalc groff unzip && \
	rm -Rf /var/cache/apt/*
RUN pip3 install awscli --upgrade && \ 
	echo "if [ -f /etc/bash_completion ]; then\n   . /etc/bash_completion\nfi\ncomplete -C '/usr/local/bin/aws_completer' aws" >> ~/.bashrc
RUN pip3 install ansible --upgrade
RUN pip3 install aws-sam-cli 
RUN curl -o packer.zip https://releases.hashicorp.com/packer/1.4.1/packer_1.4.1_linux_amd64.zip && unzip packer.zip && rm packer.zip && mv packer /usr/local/bin/packer
WORKDIR /project
CMD /bin/bash
