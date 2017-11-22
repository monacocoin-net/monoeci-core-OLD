apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y

add-apt-repository ppa:bitcoin/bitcoin
apt-get update && apt-get install libdb4.8-dev libdb4.8++-dev -y
cd ~
git clone https://github.com/monoeci-net/monoeci-Core.git && cd monoeci-Core
bash autogen.sh
./configure --disable-test
make
