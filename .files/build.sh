source /etc/profile.d/devkit-env.sh

apt-get update && apt-get install p7zip-full python3 python3-pip -y

# Run check.py
pip3 install requests
python3 /build_dir/.files/check.py
# Install ctrulib
cd build_dir
git clone https://github.com/smealum/ctrulib.git
cd ctrulib/libctru
make install release -j

# Install firmtool and makerom
pip3 install git+https://github.com/TuxSH/firmtool.git
cd /build_dir
export ctr_ver=16
curl -LJO https://github.com/jakcron/Project_CTR/releases/download/v0."$ctr_ver"/makerom_0"$ctr_ver"_ctrtool.zip
7z e makerom_0"$ctr_ver"_ctrtool.zip -o/usr/bin Ubuntu/makerom
chmod +x /usr/bin/makerom

# Finally clone and build Luma3DS
git clone https://github.com/AuroraWright/Luma3DS.git 
cd Luma3DS
make -j2
