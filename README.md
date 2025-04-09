# TAPIR - forked from UWSysLab/tapir

## Experiments
Test on Ubuntu 22.04

### Config the environment
```bash
sudo apt -y install openssh-server
sudo apt -y install gcc g++
sudo apt -y install make

sudo apt -y install libprotobuf-dev
sudo apt -y install libevent-dev
sudo apt -y install libssl-dev
sudo apt -y install -y libevent-pthreads-2.1-6
sudo apt -y install libssl-dev
sudo apt -y install protobuf-compiler
sudo apt -y install maven
sudo apt -y install -y pkg-config
sudo apt -y install python3.8
sudo apt -y install python
sudo apt -y install git

# install JDK
sudo apt -y install openjdk-11-jdk
ls -ls /usr/lib/jvm/java-11-openjdk-amd64/ | wc -l
ls -ls /usr/lib/jvm/java-11-openjdk-amd64/include | wc -l
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
export JAVA_INCLUDE_DIR=/usr/lib/jvm/java-11-openjdk-amd64/include

# install gtest
sudo apt -y install libgtest-dev 
cd /usr/src/gtest 
sudo cmake CMakeLists.txt 
sudo make -j32
sudo cp lib/*.a /usr/lib

git clone https://github.com/shenweihai1/tapir.git
mkdir -p ~/logs/tapir
mkdir -p ~/tapir/logs
cd ~/tapir
mkdir -p .obj/gtest 
sudo cp /usr/lib/libgtest.a .obj/gtest/gtest.a
sudo cp /usr/lib/libgtest_main.a .obj/gtest/gtest_main.a
make -j32
```

### Run the code
```bash

# Update ./store/tools/ips-*.pub accordingly
cd ~/tapir/store/tools
python3 generator.py 10 24

cd ~/tapir
python3 generater.py

# Run a test, and then check logs under ./tapir/logs
bash cmds-1.sh

# Get the Throughput
cat ./logs/client-*.log|ag 'TPS'| ag 'TPS' | wc -l
cat ./logs/client-*.log| ag 'TPS'| awk '{sum += $2} END {print sum}'
```