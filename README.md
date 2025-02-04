# enable_git
public repo for installing the raw version of git installation and ssh setup

> Follow the steps below to complete your installation process

### Pre Requisite
* Email akshat at akshat.kalra@ucsf.edu and ask him to send you the personalized access token for enabling your access to kleen lab's github files in a secured way, once you have that token, you may move forward with the next steps.
* Also ask him to make your seahorse username if you don't already have that 
* Make sure you have Matlab 2024a or above installed in your system to run this environment 

### Step 1
Open up your terminal window

### Step 2
Copy this command below, paste it in the window and press Enter to run it 

`curl -L -o ~/Documents/check_git.sh https://raw.githubusercontent.com/Kleen-Lab/enable_git/refs/heads/main/check_git.sh`

### Step 3
Run the following command 

`curl -L -o ~/Documents/ssh_key_gen.sh https://raw.githubusercontent.com/Kleen-Lab/enable_git/refs/heads/main/ssh_key_gen.sh`

### Step 4
Run the following commands one after the other

`chmod +x ~/Documents/*.sh`

`~/Documents/ssh_key_gen.sh`

`~/Documents/check_git.sh`

### Final Step
You may or may not need this depending upon whether you have the sshfs installed in your system, if you don't please follow this guideline to install this once all the previous steps have been completed and the terminal prompts you to do so. 

It might be a good idea to have this document open in another PC or your phone since this process would require you to restart your machine.  

[SSHFS installation process](https://eengstrom.github.io/musings/install-macfuse-and-sshfs-on-macos-monterey)