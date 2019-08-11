DL_NAME=go1.12.7.linux-armv6l.tar.gz
DL=https://dl.google.com/go/$DL_NAME
PREFIX=/usr/local/go
curl -L $DL -o $DL_NAME
if [ -d $PREFIX ]
then
	sudo rm $PREFIX -rf
fi
sudo tar -C /usr/local -xvf $DL_NAME
#cat >> ~/.profile << 'EOF'
#	export GOPATH=$HOME/.go_path
#	export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin
#EOF
#source ~/.profile
