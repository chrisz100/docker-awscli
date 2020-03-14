FROM debian:buster
RUN apt update && apt install -y curl python3 python3-pip bash-completion vim ipcalc groff unzip watch && \
	rm -Rf /var/cache/apt/*
RUN pip3 install awscli --upgrade && \ 
	echo "if [ -f /etc/bash_completion ]; then\n   . /etc/bash_completion\nfi\ncomplete -C '/usr/local/bin/aws_completer' aws" >> ~/.bashrc
RUN curl 'https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip' -o 'awscli-exe.zip' && unzip awscli-exe.zip && ./aws/install && rm awscli-exe.zip && rm -Rf aws && \
	echo "if [ -f /etc/bash_completion ]; then\n   . /etc/bash_completion\nfi\ncomplete -C '/usr/local/bin/aws2_completer' aws2" >> ~/.bashrc
RUN pip3 install ansible --upgrade
RUN pip3 install aws-sam-cli 
RUN curl -o packer.zip https://releases.hashicorp.com/packer/1.5.4/packer_1.5.4_linux_amd64.zip && unzip packer.zip && rm packer.zip && mv packer /usr/local/bin/packer
WORKDIR /project
CMD /bin/bash
