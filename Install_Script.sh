apt install make net-tools plocate proxychains wafw00f socat masscan nmap python3 python3-pip python3-venv python3-impacket python3-pycryptodome python3-typer python3-tabulate python3-pandas python3-requests-toolbelt python3-requests-ntlm python3-cmd2 python3-ldap3 smbclient sqlmap ruby-full build-essential libffi-dev libssl-dev libldap2-dev libsasl2-dev libkrb5-dev libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev zlib1g zlib1g-dev libpq-dev libpcap-dev libsqlite3-dev ldap-utils libffi-dev pipx git zip unzip faketime libfdt1 libpixman-1-0 libpng16-16 liboss4-salsa-asound2 libglib2.0-0 autoconf bison libncurses5-dev libreadline-dev libyaml-dev libgdbm-dev -y

mkdir /home/ubuntu/tools
cd /home/ubuntu/tools
chown ubuntu /home/ubuntu/tools

wget https://github.com/ffuf/ffuf/releases/download/v2.1.0/ffuf_2.1.0_linux_amd64.tar.gz
tar -xvf ffuf_2.1.0_linux_amd64.tar.gz
mv ffuf /usr/local/bin/
rm ffuf_2.1.0_linux_amd64.tar.gz CHANGELOG.md LICENSE README.md

cd /home/ubuntu/tools
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz
echo "PATH=$PATH:/usr/local/go/bin" | tee -a /etc/profile.d/golang.sh
echo "GOPATH=$HOME/go" | tee -a /etc/profile.d/golang.sh
echo "GOCACHE=$HOME/.cache/go-build" | tee -a /etc/profile.d/golang.sh
echo "PATH=$PATH:$GOPATH/bin" | tee -a /etc/profile.d/golang.sh
chmod 644 /etc/profile.d/golang.sh
rm go1.24.2.linux-amd64.tar.gz
source /etc/profile
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
cp /go/bin/nuclei /usr/local/bin/

git clone https://github.com/lgandx/Responder.git
git clone https://github.com/drwetter/testssl.sh.git
git clone https://github.com/internetwache/GitTools.git
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/aboul3la/Sublist3r.git
git clone https://github.com/dirkjanm/BloodHound.py
git clone https://github.com/trufflesecurity/trufflehog.git
cd trufflehog; go install -buildvcs=false

snap install amass

cd /home/ubuntu/tools
mkdir Aquatone
cd Aquatone
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O aquatone_linux_amd64_1.7.0.zip
snap install chromium
ln -s /snap/bin/chromium /usr/bin/chromium
unzip aquatone_linux_amd64_1.7.0.zip
rm aquatone_linux_amd64_1.7.0.zip

cd /home/ubuntu/tools
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb | tee -a msfinstall
chmod +x msfinstall
./msfinstall
msfdb init

pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec --force
pipx install git+https://github.com/ly4k/Certipy.git --force
pipx install git+https://github.com/fortra/impacket.git --force
echo "PATH=$PATH:/home/ubuntu/.local/bin" | tee -a /etc/profile

sudo gem install wpscan
