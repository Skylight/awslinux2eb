#!/bin/bash

set -e

if ! type -p git >/dev/null; then
	sudo yum install -y git
fi

if ! type -p gpg-agent >/dev/null; then
	sudo yum install gnupg2 -y --allowerasing
fi


if [ ! -d "$HOME/awslinux2eb" ]; then
	echo "Setting up repository"
	cd $HOME
	git clone https://github.com/Skylight/awslinux2eb.git
fi

grep -qxF '. awslinux2eb/bin/awsl2eb-boot' $HOME/.bash_profile || printf "\n\n# AWS Linux 2 Elastic Beanstalk (https://github.com/Skylight/awslinux2eb)\n. awslinux2eb/bin/awsl2eb-boot\n" >> $HOME/.bash_profile

echo ""
echo "AWS Linux 2 Elastic Beanstalk installed"
echo "======================================="
echo ""
echo "The next time you connect the boot script will be loaded. To run the boot script now, type:"
echo ""
echo ". awslinux2eb/bin/awsl2eb-boot"
echo ""