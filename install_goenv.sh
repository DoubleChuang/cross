#!/bin/bash
if [ -d ~/.goenv ] ; then
	echo "already download"
else
	git clone https://github.com/syndbg/goenv.git ~/.goenv
fi

if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
	echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bash_profile
	echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(goenv init -)"' >> ~/.bash_profile
	echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.bash_profile
	echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bash_profile
f
elif [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
	echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshrc
	echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshrc
	echo 'eval "$(goenv init -)"' >> ~/.zshrc
	echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.zshrc
	echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshrc
fi
exec $SHELL
$SHELL goenv install 1.12.0
