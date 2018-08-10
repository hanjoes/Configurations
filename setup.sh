#!/bin/bash

PACKAGE_MANAGER=''

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Function definitions 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function print_status() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo $1 
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

function abort_if_fail() {
	if [ $? -ne 0 ]
	then
		print_status "Aborting..."
		exit -1
	fi
}

function check_and_install_python() {
	python -V
	if [ $? -ne 0 ]
	then
		print_status "Installing Python"
		$PACKAGE_MANAGER install python
	fi
	python -V
	abort_if_fail
}

function check_and_install_git() {
	git --version
	if [ $? -ne 0 ]
	then
		print_status "Installing Git"
		$PACKAGE_MANAGER install python
	fi
}

function identify_package_manager() {
	DISTRO=`cat /etc/os-release | grep '^ID=' | cut -d= -f2` 
	if [ -n $DISTRO ]
	then
		print_status "Detected Linux distro: ${DISTRO}"
		case $DISTRO in
			"debian")
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
	echo "Assuming package manager: ${PACKAGE_MANAGER}"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Main
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

identify_package_manager
$PACKAGE_MANAGER update

check_and_install_python
check_and_install_git

# ln -s ~/Configurations/dotfile/bashrc ~/.bashrc 
# ln -s ~/Configurations/dotfile/vimrc ~/.vimrc
# ln -s ~/Configurations/dotfile/emacs.el ~/.emacs
# ln -s ~/Configurations/vim ~/.vim

# # Setting up git aliases
# git config --global alias.co checkout
# git config --global alias.br branch
# git config --global alias.ci commit
# git config --global alias.st status

