# Install Command

```bash
#!/bin/bash

# Install Docker
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

# Install Docker Compose
sudo apt install docker-compose -y

# Install JetBrains Toolbox
wget -O jetbrains-toolbox.tar.gz "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA"
tar -xzf jetbrains-toolbox.tar.gz
rm jetbrains-toolbox.tar.gz
cd jetbrains-toolbox*/

# Run JetBrains Toolbox installer
./jetbrains-toolbox

# Install PhpStorm
./jetbrains-toolbox --install=phpstorm

# Clean up
cd ..
rm -rf jetbrains-toolbox*/

echo "Installation complete!"
```
