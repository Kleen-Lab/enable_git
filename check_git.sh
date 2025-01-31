#!/bin/zsh

#User steps required 
#-) curl command to download this script from a public repo (raw access) in a PARTICULAR folder
########     curl -L -o ~/Documents/check_git.sh https://raw.githubusercontent.com/Kleen-Lab/fetch_clip_setup/refs/heads/main/check_git.sh
#-) execute command to run this script via command line
########     ~/Documents/check_git.sh
#-) curl -L -o ~/Documents/ssh_key_gen.sh https://raw.githubusercontent.com/Kleen-Lab/enable_git/refs/heads/main/ssh_key_gen.sh
########     ~/Documents/ssh_key_gen.sh




# Function to check if Git is installed
check_git_installed() {
    if command -v git &>/dev/null; then
        echo "Git is already installed."
        return 0
    else
        echo "Git is not installed. Installing Git..."
        return 1
    fi
}

# Function to install Git using Xcode Command Line Tools
install_git() {
    # This command installs the Xcode Command Line Tools, which includes Git
    xcode-select --install

    # Check if the installation was successful
    if [ $? -eq 0 ]; then
        echo "Xcode Command Line Tools installation initiated."
        echo "Please follow any on-screen prompts to complete the installation."
    else
        echo "Failed to initiate Xcode Command Line Tools installation."
        exit 1
    fi
}

# Main script execution
check_git_installed || install_git

mkdir -p ~/Desktop/kleen_lab_github/

cd ~/Desktop/kleen_lab_github/

git clone git@github.com:Kleen-Lab/fetch_clip_setup.git
cd fetch_clip_setup
git pull
#making all files executable in the current directory 
chmod +x *
cd ..

./fetch_clip_setup/install_anaconda.sh
source ~/.zshrc

echo "_______________________________________________________________________________________________________________"
echo "###############################################################################################################"
echo "completed the installation of anaconda, taking care of finding the right python version now"

./fetch_clip_setup/python3.11_check.sh

echo "_______________________________________________________________________________________________________________"
echo "###############################################################################################################"
#echo "completed the installation of python3.10 version, generating ssh key for interaction w other private git repos"

#./fetch_clip_setup/ssh_key_gen.sh
#
#echo "_______________________________________________________________________________________________________________"
#echo "###############################################################################################################"
#echo "completed ssh key setup for github, moving on to running make_fetch_clip_env for virtual environment setup..."

echo "completed the installation of python3.10 version, moving on to running make_fetch_clip_env for virtual environment setup..."
./fetch_clip_setup/make_fetch_clip_env.sh


echo "_______________________________________________________________________________________________________________"
echo "###############################################################################################################"
echo "completed the creation of the virtual environment, moving on to for_launch operations"

./fetch_clip_setup/for_launch_ops.sh













