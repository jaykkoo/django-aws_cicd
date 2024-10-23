#!/usr/bin/env bash

# # clean codedeploy-agent files for a fresh install
# sudo rm -rf /home/ubuntu/install

# # install CodeDeploy agent
# sudo apt update
# sudo apt install ruby
# sudo apt install wget

# cd /home/ubuntu
# wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
# sudo chmod +x ./install 
# sudo ./install auto

# # update os & install python3
# sudo apt install -y python3 python3-dev python3-pip python3-venv

# # delete app
# sudo rm -rf /home/ubuntu/django-aws_cicd


#!/usr/bin/env bash

# Define the log file
LOG_FILE="/home/ubuntu/script.log"

# Function to log messages with timestamps
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Start logging
log_message "Starting the script..."

# Step 1: Clean CodeDeploy agent files
log_message "Cleaning CodeDeploy agent files..."
sudo rm -rf /home/ubuntu/install >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Successfully cleaned CodeDeploy agent files."
else
    log_message "Failed to clean CodeDeploy agent files."
fi

# Step 2: Update system package list
log_message "Updating system package list..."
sudo apt update >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "System package list updated."
else
    log_message "Failed to update system package list."
fi

# Step 3: Install Ruby
log_message "Installing Ruby..."
sudo apt install -y ruby >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Ruby installed successfully."
else
    log_message "Failed to install Ruby."
fi

# Step 4: Install wget
log_message "Installing wget..."
sudo apt install -y wget >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "wget installed successfully."
else
    log_message "Failed to install wget."
fi

# Step 5: Install CodeDeploy agent
log_message "Installing CodeDeploy agent..."
cd /home/ubuntu
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install >> "$LOG_FILE" 2>&1
sudo chmod +x ./install >> "$LOG_FILE" 2>&1
sudo ./install auto >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "CodeDeploy agent installed successfully."
else
    log_message "Failed to install CodeDeploy agent."
fi

# Step 6: Install Python3 and development tools
log_message "Installing Python3 and development tools..."
sudo apt install -y python3 python3-dev python3-pip python3-venv >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Python3 and development tools installed successfully."
else
    log_message "Failed to install Python3 and development tools."
fi

# Step 7: Delete old app directory
log_message "Deleting old app directory..."
sudo rm -rf /home/ubuntu/django-aws_cicd >> "$LOG_FILE" 2>&1
if [ $? -eq 0 ]; then
    log_message "Old app directory deleted successfully."
else
    log_message "Failed to delete old app directory."
fi

# Script completed
log_message "Script completed."
