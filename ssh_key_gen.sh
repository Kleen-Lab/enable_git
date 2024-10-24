#!/bin/zsh

# Temporarily disable history for security reasons
#set +o history

echo 'Enter the token provided to you by akshat :'
read github_token

# Step 1: Define variables in lowercase
github_username="kleenlab-fellow"
#github_token="no_secrets"
user=$(whoami)
host=$(hostname)
key_comment="${user}@${host}"
echo 'key_comment:' $key_comment

key_file="$HOME/.ssh/id_ed25519_snoopy"
github_api_url="https://api.github.com/user/keys"

# Step 2: Check if SSH key already exists
if [ -f "$key_file" ]; then
    echo "SSH key already exists at $key_file"
else
    # Step 3: Create an SSH key
    echo "Creating SSH key..."
    ssh-keygen -t ed25519 -C "$key_comment" -f "$key_file" -N ""
fi

# Step 3 : SSH Agent stuff
eval "$(ssh-agent -s)"

# Ensure the .ssh directory and config file exist
mkdir -p ~/.ssh
touch ~/.ssh/config

# Append the new configuration to the config file
echo -e "\nHost github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519_snoopy" >> ~/.ssh/config

ssh-add --apple-use-keychain ~/.ssh/id_ed25519_snoopy
ssh-add ~/.ssh/id_ed25519_snoopy

# Step 4: Read the public key
pub_key=$(cat "${key_file}.pub")

# Step 5: Upload the SSH key to GitHub
echo "Uploading SSH key to GitHub..."
echo $pub_key

# Step: Check if the GitHub token is valid
auth_check=$(curl -s -H "Authorization: token $github_token" https://api.github.com/user)

if echo "$auth_check" | grep -q '"login"'; then
    echo "GitHub authentication successful!"
else
    echo "GitHub authentication failed. Please check your token."
    echo "Response: $auth_check"
    exit 1
fi

# GitHub API request to add a new SSH key
response=$(curl -s -X POST -H "Authorization: token $github_token" -d "{\"title\":\"$key_comment\", \"key\":\"$pub_key\"}" $github_api_url)


# Step 6: Check for errors in the API response
if echo "$response" | grep -q '"id"'; then
    echo "SSH key successfully added to GitHub!"
else
    echo "Failed to add SSH key to GitHub. Response: $response"
    exit 1
fi


unset github_token

# re-enable history
#set -o history

# Step 7: Print success message and SSH key path
echo "SSH key created at $key_file and added to your GitHub account."


