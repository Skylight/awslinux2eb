#!/bin/bash

set -e

if ! type -p git >/dev/null; then
	sudo yum install -y git
fi

if [ ! -d "$HOME/awslinux2eb" ]; then
	echo "Setting up repository"
	cd $HOME
	git clone https://stijnster@bitbucket.org/stijnster/awslinux2eb.git
fi

grep -qxF '. awslinux2eb/bin/awsl2eb-boot' $HOME/.bash_profile || printf "\n\n# AWS Linux 2 Elastic Beanstalk (https://bitbucket.org/stijnster/awslinux2eb/src/master/)\n. awslinux2eb/bin/awsl2eb-boot\n" >> $HOME/.bash_profile

. awslinux2eb/bin/awsl2eb-boot