#!/bin/bash

# Function to check if TeamViewer is installed
check_teamviewer() {
    if [ -d "/Applications/TeamViewer.app" ]; then
        return 0
    else
        return 1
    fi
}

#If Teamviewer is running, kill it first
kill_teamviewer() {
    serviceName="TeamViewer"
    if pgrep -xq -- "${serviceName}"; 
        then
          echo "TeamViewer is running. Closing it first, then removing it."
          killall $serviceName
    else
        echo "TeamViewer is not running. Attempting to remove it now"
fi
}

# Function to remove TeamViewer
remove_teamviewer() {
    echo "Removing TeamViewer..."
    
    # Remove the application
    sudo rm -rf /Applications/TeamViewer.app
    
    # Remove supporting files
    sudo rm -rf ~/Library/Preferences/com.teamviewer.TeamViewer.plist
    sudo rm -rf ~/Library/Application Support/TeamViewer
    sudo rm -rf ~/Library/Application Support/TeamViewer
    sudo rm -rf ~/Library/Logs/TeamViewer
    sudo rm -rf ~/Library/Caches/com.teamviewer.TeamViewer
    sudo rm -rf /Library/Preferences/com.teamviewer.TeamViewer.plist
    sudo rm -rf /Library/Preferences/com.teamviewer.teamviewer.preferences.plist
    sudo rm -rf /Library/LaunchDaemons/com.teamviewer.teamviewer_service.plist
    sudo rm -rf /Library/LaunchAgents/com.teamviewer.teamviewer.plist
    sudo rm -rf /Library/LaunchAgents/com.teamviewer.teamviewer_desktop.plist
    sudo rm -rf /Library/LaunchAgents/com.teamviewer.teamviewer9.plist
    
    echo "TeamViewer has been removed."
}

# Check if TeamViewer is installed and remove it
if check_teamviewer; then
    kill_teamviewer
    remove_teamviewer
    exit 0
else
    echo "TeamViewer is not installed."
    exit 1
fi