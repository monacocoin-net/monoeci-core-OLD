![GitHub Logo](/logo-Monoeci.png)

Monoeci Core V1 
===============================

https://www.monoeci.io


Easy Client update : 
----------------

#for user monoeci
su monoeci
cd
#if you user system service : service monoecid stop
./monoeci-cli stop 
tar jcvf  monoeci-save.tar.gz .monoeciCore/
cp .monoeciCore/monoeci.conf .
rm -fr .monoeciCore
mkdir .monoeciCore
cp monoeci.conf .monoeciCore/
#if you user system service : service monoecid start
./monoecid (or start service)


Use for new server , include service and security options : 
----------------

sudo apt-get update && sudo apt-get upgrade -y

#Create swap 4G
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo su -
cat <<EOF >> /etc/fstab
/swapfile none swap sw 0 0
EOF
exit

sudo su -
cat <<EOF >> /etc/sysctl.conf
vm.swappiness=10
EOF
exit

#Install fail2ban et anti-root kit
sudo apt -y install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

sudo apt -y install rkhunter

# Scan your server every day 
crontab -e 

and add Create service step by step 

sudo apt-get update && sudo apt-get upgrade -y

sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo su -
cat <<EOF >> /etc/fstab
/swapfile none swap sw 0 0
EOF
exit

sudo su -
cat <<EOF >> /etc/sysctl.conf
vm.swappiness=10
EOF
exit

sudo apt -y install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

sudo apt -y install rkhunter

crontab -e 

#and add to last line : 
15 04 * * * /usr/bin/rkhunter --cronjob --update --quiet

# monoeci Dependances 

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
sudo apt-get install libboost-all-dev

sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install libdb4.8-dev libdb4.8++-dev

sudo apt-get install libminiupnpc-dev 
sudo apt-get install libzmq3-dev 


# install server monoeci
adduser monoeci 
#(Follow step by step and write password)

wget https://github.com/monacocoin-net/monoeci-core-OLD/releases/download/0.12.2/monoeciCore-0.12.2-linux64-cli.Ubuntu16.04.tar.gz
tar xvf monoeciCore-0.12.2-linux64-cli.Ubuntu16.04.tar.gz
mv monoecid monoeci-cli monoeci-tx /usr/bin/

# now you can use monoeci-cli everywhere with all user , not use ./monoeci-cli write directly monoeci-cli

sudo apt-get install pwgen
su monoeci
cd
mkdir .monoeciCore

# Before Copy / Paste replace sentences
cat <<EOF > ~/.monoeciCore/monoeci.conf
rpcuser=$(pwgen -s 32 1)
rpcpassword=$(pwgen -s 64 1)
rpcallowip=127.0.0.1
externalip=WRITE YOUR IP SERVER HERE
server=1
daemon=1
listen=1
maxconnections=20
masternode=1
masternodeprivkey=WRITE HERE YOUR MASTERNODE KEY
EOF

nano ~/.monoeciCore/monoeci.conf

# Create service now

exit

echo \
"[Unit]
Description=Monoeci daemon
 
[Service]
User=monoeci
Type=forking
ExecStart=/usr/bin/monoecid -daemon -pid=/home/monoeci/.monoeciCore/monoecid.pid
PIDFile=/home/monoeci/.monoeciCore/monoecid.pid
Restart=always
RestartSec=10
 
[Install]
WantedBy=multi-user.target" | sudo tee /lib/systemd/system/monoecid.

service monoecid start
service monoecid enable

#Check server config

su monoeci
monoeci-cli getinfo

