#
# Copy env files
#

sh vim/configure.sh

cp .gitconfig ~
cp gitutils/git-completion.bash ~/.git-completion.bash
cp .profile ~
source ~/.profile
cp .tmux.conf ~

#
# Prepare bin
#
cp -R bin ~
chmod +x ~/bin/spark

ln -s ~/.profile ~/.bash_profile
ln -s ~/.vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim


mkdir -p ~/.lein
cp lein/profiles.clj ~/.lein/
