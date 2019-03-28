# openssl
# LDFLAGS:  -L/usr/local/opt/openssl/lib
# CPPFLAGS: -I/usr/local/opt/openssl/include

echo "Dependencies"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

brew cask install iterm2
brew install tmux
brew install tmate
brew install wget
brew install ack
brew install leiningen
brew install gpg
brew install reattach-to-user-namespace
brew install cloc
brew install terminal-notifier
brew install forego
brew install git
brew install git-extras
brew install git-secret
brew install tree

# docker
brew install docker
brew install docker-machine
brew install docker-swarm
brew install docker-compose

brew tap homebrew/dupes
brew install apple-gcc42

brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install slack
brew cask install java

brew cask install spotify
brew cask install telegram
brew cask install 1password
brew cask install whatsapp
brew cask install stremio
brew cask install alfred
brew cask install rescuetime
brew cask install postman
brew cask install nordvpn

brew cask install atom
apm install vim-mode

brew tap d12frosted/emacs-plus
brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
brew linkapps

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

brew install coreutils
