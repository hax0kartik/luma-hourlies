source /etc/profile.d/devkit-env.sh

# Install ctrulib
apt-get update && apt-get install unzip
cd build_dir
git clone https://github.com/smealum/ctrulib.git
cd ctrulib/libctru 
make install release -j

# Install firmtool and makerom

apt-get install python3 python3-pip -y
pip3 install cryptography
pip3 install git+https://github.com/TuxSH/firmtool.git

cd /build_dir
curl -LJO https://cdn.discordapp.com/attachments/356378491375190016/554910371052519464/makerom
chmod +x makerom
cp -s $PWD/makerom /usr/bin/makerom

# Finally clone and build luma3ds
git clone https://github.com/AuroraWright/Luma3DS.git 
cd Luma3DS
make -j2
