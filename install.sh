#!/bin/bash

# Add JetBrains Toolbox repository
wget -qO - https://jetbrains.com/toolbox/jetbrains-toolbox.asc | sudo gpg --dearmor -o /usr/share/keyrings/jetbrains-toolbox.gpg
echo "deb [signed-by=/usr/share/keyrings/jetbrains-toolbox.gpg] https://jetbrains.com/toolbox/ download/" | sudo tee /etc/apt/sources.list.d/jetbrains-toolbox.list > /dev/null

# Add Spotify repository
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo gpg --dearmor -o /usr/share/keyrings/spotify-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/spotify-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null

# Add Discord repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 363CBA53
echo "deb http://ppa.launchpad.net/discordapp/discord/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/discord.list > /dev/null

# Update repositories
sudo apt update

# Install JetBrains tools (Professional or Ultimate editions)
sudo apt install jetbrains-toolbox -y
jetbrains-toolbox &

# Wait for JetBrains Toolbox to start
sleep 10

# Install PhpStorm Professional Edition
jetbrains-toolbox --tool=phpstorm:professional

# Install IntelliJ IDEA Ultimate Edition
jetbrains-toolbox --tool=idea:ultimate

# Install PyCharm Professional Edition
jetbrains-toolbox --tool=pycharm:professional

# Install Spotify
sudo apt install spotify-client -y

# Install Discord
sudo apt install discord -y

echo "Installation complete."
