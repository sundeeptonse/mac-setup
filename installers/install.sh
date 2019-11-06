#!/usr/bin/env bash
#Pre-Steps
echo '#stonse-setup-start' >>~/.bash_profile

LOC_EXECUTABLES='~/'
echo 'Executables Location is at : ' + $LOC_EXECUTABLES

function main(){
    install_brew_taps
    install_java
    install_softwares
    setup_shortcuts
    setup_system_settings
}

echo '#stonse-setup-end' >>~/.bash_profile

#install taps
function install_brew_taps() {
    echo "Configuring home-brew taps..."
    brew tap homebrew/services
    brew tap homebrew/bundle
    brew tap homebrew/versions
    brew tap homebrew/core
    brew tap homebrew/cask
    brew tap homebrew/cask-versions

    #brew tap pandora/homebrew https://bitbucket.savagebeast.com/scm/devtools/homebrew-pandora.git
    brew update
}

function install_java{

	  #install OpenJDK - Java
		brew tap AdoptOpenJDK/openjdk

		#all Versions
		startVersion=8
		endVersion=9

    brew cask install adoptopenjdk8
    brew cask install adoptopenjdk9
    brew cask install adoptopenjdk10
    brew cask install adoptopenjdk11
    brew cask install adoptopenjdk12
    brew cask install adoptopenjdk13

	#Install Jenv
		brew install jenv
		echo 'export JENV_ROOT=/usr/local/opt/jenv' >> ~/.bash_profile
		echo 'if which jenv > /dev/null; then eval "$(jenv init -)"; fi' >> ~/.bash_profile

		#Enabled for Setting Java_Home
		jenv enable-plugin export
		exec $SHELL -l

		JAVA_INSTALL_PATH=/Library/Java/JavaVirtualMachines

		#jenv add $JAVA_INSTALL_PATH/jdk1.8.0_202.jdk/Contents/Home/
    jenv add $JAVA_INSTALL_PATH/adoptopenjdk-8.jdk/Contents/Home/
		jenv add $JAVA_INSTALL_PATH/adoptopenjdk-9.jdk/Contents/Home/
		jenv add $JAVA_INSTALL_PATH/adoptopenjdk-10.jdk/Contents/Home/
		jenv add $JAVA_INSTALL_PATH/adoptopenjdk-11.jdk/Contents/Home/
		jenv add $JAVA_INSTALL_PATH/adoptopenjdk-12.jdk/Contents/Home/
		jenv add $JAVA_INSTALL_PATH/adoptopenjdk-13.jdk/Contents/Home/

		jenv global 1.8.0.202

		#Rest of stuff
		brew install gradle

		brew install node
}


function install_softwares{

    #install softwares
	#non-tech
	brew cask install evernote
	brew cask install whatsapp
	brew cask install copyclip
	brew cask install google-backup-and-sync
	#no installer for memory clean
	#no installer for textwrangler
	#brew cask install browsers
	brew cask install firefox

	#tech
	brew cask install iterm2
	brew install charles
	brew cask install jd-gui
	brew install pgcli
	brew cask install postman
	brew cask install android-studio
	brew cask install genymotion
	#no installer for X-Code/Intellij

	brew cask install docker
	brew install git

	#no installer for git-autocomplete

	#no installer for presto-cli

}

function setup_shortcuts{
	echo "alias jd='open /Applications/JD-GUI.app'" >> ~/.bash_profile
	echo "alias refresh='source ~/.bash_profile'" >> ~/.bash_profile
	echo ""
}

function setup_system_settings{
	#Cursor Speed
	defaults write NSGlobalDomain KeyRepeat -int 1

}

