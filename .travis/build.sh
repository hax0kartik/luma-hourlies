source /etc/profile.d/devkit-env.sh

# Install ctrulib
cd build_dir
git clone https://www.github.com/smealum/ctrulib.git
cd ctrulib/libctru 
make install release -j

# Install armips, firmtool and makerom
curl -LJO https://ev1l0rd.s-ul.eu/mEIk4atQ
apt-get install unzip
unzip armips-5996abc.zip -d armips
cd armips-5996abc/x86_64
chmod +x armips
cp -s armips /usr/bin/armips

apt-get install python python-pip
pip install cryptography
pip install git+https://github.com/TuxSH/firmtool.git

curl -LJO https://github.com/profi200/Project_CTR/releases/download/0.15/makerom_015_ctrtool.zip
unzip makerom_015_ctrtool -d makerom
cd makerom/Linux_x86_64
chmod +x makerom
cp -s makerom /usr/bin/makerom

# Finally clone and build luma3ds
git clone https://github.com/AuroraWright/Luma3DS.git 
cd Luma3DS
make -j

mv -v ./out/* ~/build_dir/out/*