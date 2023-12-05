echo "start kill..."
cmd="cd tapir;bash kill.sh"
echo "ssh 20.7.73.161"
ssh 20.7.73.161 "$cmd"
echo "ssh 20.7.75.5"
ssh 20.7.75.5 "$cmd"
echo "ssh 20.230.88.107"
ssh 20.230.88.107 "$cmd"
echo "ssh 172.177.43.196"
ssh 172.177.43.196 "$cmd"
echo "ssh 20.114.170.255"
ssh 20.114.170.255 "$cmd"
echo "ssh 20.119.184.193"
ssh 20.119.184.193 "$cmd"
echo "ssh 172.177.44.39"
ssh 172.177.44.39 "$cmd"
echo "ssh 20.97.161.113"
ssh 20.97.161.113 "$cmd"
echo "ssh 20.119.186.135"
ssh 20.119.186.135 "$cmd"
echo "ssh 20.242.21.226"
ssh 20.242.21.226 "$cmd"
echo "ssh 20.97.161.36"
ssh 20.97.161.36 "$cmd"
echo "ssh 20.119.185.89"
ssh 20.119.185.89 "$cmd"
echo "ssh 20.98.252.16"
ssh 20.98.252.16 "$cmd"
echo "ssh 20.97.162.180"
ssh 20.97.162.180 "$cmd"
echo "ssh 20.119.186.174"
ssh 20.119.186.174 "$cmd"
echo "ssh 20.242.21.227"
ssh 20.242.21.227 "$cmd"
echo "ssh 20.97.162.170"
ssh 20.97.162.170 "$cmd"
echo "ssh 20.119.186.202"
ssh 20.119.186.202 "$cmd"
echo "ssh 20.98.239.172"
ssh 20.98.239.172 "$cmd"
echo "ssh 20.119.180.46"
ssh 20.119.180.46 "$cmd"
echo "ssh 20.114.138.242"
ssh 20.114.138.242 "$cmd"


keys=7000000


sleep 5
echo "start server..."
ssh 20.7.73.161 "ulimit -n 20000;cd tapir;bash r0.sh 0 0 23 $keys"
ssh 20.7.75.5 "ulimit -n 20000;cd tapir;bash r1.sh 1 0 23 $keys"
ssh 20.230.88.107 "ulimit -n 20000;cd tapir;bash r2.sh 2 0 23 $keys"
ssh 172.177.43.196 "ulimit -n 20000;cd tapir;bash r0.sh 3 24 47 $keys"
ssh 20.114.170.255 "ulimit -n 20000;cd tapir;bash r1.sh 4 24 47 $keys"
ssh 20.119.184.193 "ulimit -n 20000;cd tapir;bash r2.sh 5 24 47 $keys"
ssh 172.177.44.39 "ulimit -n 20000;cd tapir;bash r0.sh 6 48 71 $keys"
ssh 20.97.161.113 "ulimit -n 20000;cd tapir;bash r1.sh 7 48 71 $keys"
ssh 20.119.186.135 "ulimit -n 20000;cd tapir;bash r2.sh 8 48 71 $keys"
ssh 20.242.21.226 "ulimit -n 20000;cd tapir;bash r0.sh 9 72 95 $keys"
ssh 20.97.161.36 "ulimit -n 20000;cd tapir;bash r1.sh 10 72 95 $keys"
ssh 20.119.185.89 "ulimit -n 20000;cd tapir;bash r2.sh 11 72 95 $keys"
ssh 20.98.252.16 "ulimit -n 20000;cd tapir;bash r0.sh 12 96 119 $keys"
ssh 20.97.162.180 "ulimit -n 20000;cd tapir;bash r1.sh 13 96 119 $keys"
ssh 20.119.186.174 "ulimit -n 20000;cd tapir;bash r2.sh 14 96 119 $keys"
ssh 20.242.21.227 "ulimit -n 20000;cd tapir;bash r0.sh 15 120 143 $keys"
ssh 20.97.162.170 "ulimit -n 20000;cd tapir;bash r1.sh 16 120 143 $keys"
ssh 20.119.186.202 "ulimit -n 20000;cd tapir;bash r2.sh 17 120 143 $keys"
ssh 20.98.239.172 "ulimit -n 20000;cd tapir;bash r0.sh 18 144 167 $keys"
ssh 20.119.180.46 "ulimit -n 20000;cd tapir;bash r1.sh 19 144 167 $keys"
ssh 20.114.138.242 "ulimit -n 20000;cd tapir;bash r2.sh 20 144 167 $keys"


sleep 5
echo "start clients..."
trd=24
total_shards=168
ssh 20.7.73.161     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
ssh 20.7.75.5     "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
ssh 20.230.88.107     "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &
ssh 172.177.43.196     "ulimit -n 20000;cd tapir;bash clients.sh 3 $trd $total_shards $keys" &
ssh 20.114.170.255     "ulimit -n 20000;cd tapir;bash clients.sh 4 $trd $total_shards $keys" &
ssh 20.119.184.193     "ulimit -n 20000;cd tapir;bash clients.sh 5 $trd $total_shards $keys" &
ssh 172.177.44.39     "ulimit -n 20000;cd tapir;bash clients.sh 6 $trd $total_shards $keys" &
ssh 20.97.161.113     "ulimit -n 20000;cd tapir;bash clients.sh 7 $trd $total_shards $keys" &
ssh 20.119.186.135     "ulimit -n 20000;cd tapir;bash clients.sh 8 $trd $total_shards $keys" &
ssh 20.242.21.226     "ulimit -n 20000;cd tapir;bash clients.sh 9 $trd $total_shards $keys" &
ssh 20.97.161.36     "ulimit -n 20000;cd tapir;bash clients.sh 10 $trd $total_shards $keys" &
ssh 20.119.185.89     "ulimit -n 20000;cd tapir;bash clients.sh 11 $trd $total_shards $keys" &
ssh 20.98.252.16     "ulimit -n 20000;cd tapir;bash clients.sh 12 $trd $total_shards $keys" &
ssh 20.97.162.180     "ulimit -n 20000;cd tapir;bash clients.sh 13 $trd $total_shards $keys" &
ssh 20.119.186.174     "ulimit -n 20000;cd tapir;bash clients.sh 14 $trd $total_shards $keys" &
ssh 20.242.21.227     "ulimit -n 20000;cd tapir;bash clients.sh 15 $trd $total_shards $keys" &
ssh 20.97.162.170     "ulimit -n 20000;cd tapir;bash clients.sh 16 $trd $total_shards $keys" &
ssh 20.119.186.202     "ulimit -n 20000;cd tapir;bash clients.sh 17 $trd $total_shards $keys" &
ssh 20.98.239.172     "ulimit -n 20000;cd tapir;bash clients.sh 18 $trd $total_shards $keys" &
ssh 20.119.180.46     "ulimit -n 20000;cd tapir;bash clients.sh 19 $trd $total_shards $keys" &
ssh 20.114.138.242     "ulimit -n 20000;cd tapir;bash clients.sh 20 $trd $total_shards $keys" &


