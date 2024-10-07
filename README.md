# enable_git
public repo for installing the raw version of git installation and ssh setup

> Follow the steps below to complete your installation process

### Step 1
Open up your terminal window

### Step 2
Copy this command below, paste it in the window and press Enter to run it 

`curl -L -o ~/Documents/check_git.sh https://raw.githubusercontent.com/Kleen-Lab/fetch_clip_setup/refs/heads/main/check_git.sh`

### Step 3
Run the following command 

`curl -L -o ~/Documents/ssh_key_gen.sh https://raw.githubusercontent.com/Kleen-Lab/enable_git/refs/heads/main/ssh_key_gen.sh`

### Step 4
Run the following commands one after the other

`~/Documents/ssh_key_gen.sh`

`~/Documents/check_git.sh`