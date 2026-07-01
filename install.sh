#!/bin/bash


# Hello
echo "yep yep !! script"

sudo rm -rf /bin/burpsuitepro

# Installing Dependencies
echo "Installing Dependencies..."

sudo apt install git wget openjdk-21-jre openjdk-22-jre openjdk-23-jre -y

# Move folder
mkdir Burpsuite-Professional

cd Burpsuite-Professional

# Download Burpsuite Professional Latest.
Link="https://portswigger.net/burp/releases/startdownload?product=desktop&version=2026.4.3&type=Jar"
version=2026.4.3

echo "Downloading Burpsuite Professional v$version ..."

wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress

# Execute Key Generator.
echo "Starting Key loader.jar..."

(java -jar loader.jar) &

# Execute Burp Suite Professional
echo "Executing Burpsuite Professional..."

echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
chmod +x burpsuitepro
cp burpsuitepro /bin/burpsuitepro
(./burpsuitepro)

#goodbye

echo "cyou soon"
