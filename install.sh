#!/bin/bash

# Function to install JetBrains tool
install_jetbrains_tool() {
    # Install JetBrains Toolbox (Professional or Ultimate editions)
    sudo apt install jetbrains-toolbox -y
    jetbrains-toolbox &
    
    # Wait for JetBrains Toolbox to start
    sleep 10
    
    # Install JetBrains tool based on the provided tool name and edition
    jetbrains-toolbox --tool=$1:$2
}

# Function to install Spotify
install_spotify() {
    sudo apt install spotify-client -y
}

# Function to install Discord
install_discord() {
    sudo apt install discord -y
}

# Start text
echo "This script will install the following applications on Ubuntu:"
echo "1. PhpStorm (Professional/Ultimate editions)"
echo "2. IntelliJ IDEA (Professional/Ultimate editions)"
echo "3. PyCharm (Professional/Ultimate editions)"
echo "4. Spotify"
echo "5. Discord"
echo "Please make sure you have the necessary licenses or subscriptions for the JetBrains tools."

# Prompt for application choices
PS3="Enter the numbers of the applications you want to install (e.g., 1 3 5): "
select choice in PhpStorm IntelliJ_IDEA PyCharm Spotify Discord; do
    case $REPLY in
        1)
            install_jetbrains_tool phpstorm professional
            ;;
        2)
            install_jetbrains_tool idea ultimate
            ;;
        3)
            install_jetbrains_tool pycharm professional
            ;;
        4)
            install_spotify
            ;;
        5)
            install_discord
            ;;
        *)
            echo "Invalid choice: $REPLY"
            ;;
    esac
done

echo "Installation complete."
