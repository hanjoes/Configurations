#!/bin/bash

PACKAGE_MANAGER=''
CONFIG_HOME="${HOME}/Configurations"
VIM_HOME="${HOME}/.vim"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Function definitions 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function print_status() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo $1 
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

function abort_if_fail() {
	if [ $? -ne 0 ]
	then
		print_status "Aborting..."
		exit -1
	fi
}

function check_and_install_python() {
	python -V > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		print_status "Installing Python"
		$PACKAGE_MANAGER install python
		python -V > /dev/null 2>&1
		abort_if_fail
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

function check_and_install_vim() {
	vim --version > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		print_status "Installing VIM"
		$PACKAGE_MANAGER install vim
		vim --version > /dev/null 2>&1
		abort_if_fail
	fi
}

function check_and_install_emacs() {
	emacs --version > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		print_status "Installing Emacs"
		$PACKAGE_MANAGER install emacs
		emacs --version > /dev/null 2>&1
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
	check_link $CONFIG_HOME/dotfile/bashrc $HOME/.bashrc
	check_link $CONFIG_HOME/dotfile/vimrc $HOME/.vimrc
	check_link $CONFIG_HOME/dotfile/emacs.el $HOME/.emacs
	check_link $CONFIG_HOME/vim $HOME/.vim
}

function check_link() {
	if [ \( -d $2 \) -o \( -f $2 \) ] 
	then
		rm -rf $2
	fi
	print_status "Setup linking from $2 to $1."
	ln -s $1 $2
}

function check_and_install_neat_prompt() {
	if [ ! -d $CONFIG_HOME/neat-prompt ]
	then
		git clone https://github.com/hanjoes/neat-prompt.git $CONFIG_HOME/neat-prompt
	fi
	source $HOME/.bashrc
}

function setup_git() {
	git config --global alias.co checkout
	git config --global alias.br branch
	git config --global alias.ci commit
	git config --global alias.st status
}

function setup_vim() {
	# i added pathegen.vim to version control, so there is no need for
	# the line below
	#
	# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	PATHEGEN_BUNDLE=$VIM_HOME/bundle
	cd $PATHEGEN_BUNDLE

	# install color theme solarized
	if [ -d $PATHEGEN_BUNDLE/vim-colors-solarized ]
	then
		git clone git://github.com/altercation/vim-colors-solarized.git
	fi

	# install nerdtree
	if [ -d $PATHEGEN_BUNDLE/nerdtree ]
	then
		git clone https://github.com/scrooloose/nerdtree.git
	fi

	# install vim-airline
	if [ -d $PATHEGEN_BUNDLE/vim-airline ]
	then
		git clone https://github.com/vim-airline/vim-airline
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

	# Assuming "sudo" is installed on the machine.
	# This assumption should be safe as if you are root, you won't need it anyways
	# otherwise if you are not root, you should get sudoer's permission from the
	# system administrator instead of installing sudo yourself.
	if [ ! `id -u` = 0 ]
	then
		PACKAGE_MANAGER="sudo ${PACKAGE_MANAGER}"
	fi
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Main
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

identify_package_manager
$PACKAGE_MANAGER update

check_and_install_python
check_and_install_git
check_and_install_config
check_and_install_neat_prompt
check_and_install_vim
check_and_install_emacs

setup_git
setup_vim

