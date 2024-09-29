#!/bin/bash
# Update and install required packages
sudo apt update -y
sudo apt install -y python3 python3-pip python3-venv

# Navigate to the home directory
cd /home/ubuntu

# Clone the repository
git clone https://github.com/rahulwagh/python-mysql-db-proj-1.git

# Wait for the clone to complete
sleep 10

# Navigate to the project directory
cd python-mysql-db-proj-1

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install the required packages from requirements.txt
pip install -r requirements.txt

# Start the Python application in the background
nohup python3 app.py &

# Ensure the app runs after reboot (optional)
# echo '@reboot cd /home/ubuntu/python-mysql-db-proj-1 && source venv/bin/activate && nohup python3 app.py &' | crontab -
