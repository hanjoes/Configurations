#!/bin/bash

PACKAGE_MANAGER=''
CONFIG_HOME="${HOME}/Configurations"
VIM_HOME="${HOME}/.vim"
SECRET_HOME="${HOME}/.secret"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Function definitions
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function print_status() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo $1
}

function abort_if_fail() {
	if [ $? -ne 0 ]
	then
		print_status "Aborting..."
		exit -1
	fi
}

function check_and_install_git() {
	git --version > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		print_status "Installing Git"
		$PACKAGE_MANAGER install git
		git --version > /dev/null 2>&1
		abort_if_fail
	fi
}

function check_and_install_config() {
	print_status "Checking ${CONFIG_HOME} exists."
	if [ ! -d $CONFIG_HOME ]
	then
		git clone 'https://github.com/hanjoes/Configurations.git' $CONFIG_HOME
	else
		print_status "${CONFIG_HOME} exists, updating."
		cd $CONFIG_HOME
		git pull
	fi
	check_links
}

function check_links() {
	print_status "Checking links."
	if [ ! -d $HOME/.config ]
	then
		mkdir $HOME/.config
	fi

	check_link $CONFIG_HOME/dotfile/bashrc $HOME/.bashrc
}

function check_link() {
	if [ \( -d $2 \) -o \( -f $2 \) ]
	then
		rm -rf $2
	fi
	print_status "Setup linking from $2 to $1."
	ln -s $1 $2
}

# function check_and_install_neat_prompt() {
    # should use the installation mechanism in neat_prompt.
# }

function setup_git() {
	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci commit
	git config --global alias.st status
}

function setup_secret() {
	cd $HOME
	if [ -d $SECRET_HOME ]
	then
		rm -rf $SECRET_HOME
	fi
	git clone https://github.com/hanjoes/secret-stuff.git $SECRET_HOME
}

function identify_package_manager() {
	OS=`uname`
	echo "Operating system: ${OS}"
	case $OS in
		"Linux")
			DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2`
			if [ -n $DISTRO ]
			then
				print_status "Detected Linux distro: ${DISTRO}"
				case $DISTRO in
					"debian"|"ubuntu")
						PACKAGE_MANAGER='apt-get'
						;;
					"fedora")
						PACKAGE_MANAGER='yum'
						;;
					*)
						print_status "Unrecognized Linux distro: ${DISTRO}"
						exit -1
						;;
				esac
			else
				read -e -d  PACKAGE_MANAGER <<- EOF
				"Cannot detect system type, please specify package manager (yum/brew/apt-get): "
				EOF
			fi
			;;
		"Darwin")
			PACKAGE_MANAGER='brew'
			;;
		*)
			print_status "Unsupported OS type: ${OS}"
			exit -1
			;;
	esac
	echo "Assuming package manager: ${PACKAGE_MANAGER}"

	# Assuming "sudo" is installed on the machine.
	# This assumption should be safe as if you are root, you won't need it anyways
	# otherwise if you are not root, you should get sudoer's permission from the
	# system administrator instead of installing sudo yourself.
	if [ ! `id -u` = 0 ] && [ $PACKAGE_MANAGER != 'brew' ]
	then
		PACKAGE_MANAGER="sudo ${PACKAGE_MANAGER}"
	fi
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Main
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

identify_package_manager
$PACKAGE_MANAGER update


check_and_install_git
check_and_install_config

setup_git
setup_secret
