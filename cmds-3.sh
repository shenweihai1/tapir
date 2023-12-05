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


keys=3000000


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


sleep 5
echo "start clients..."
trd=24
total_shards=72
ssh 20.7.73.161     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
ssh 20.7.75.5     "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
ssh 20.230.88.107     "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &
ssh 172.177.43.196     "ulimit -n 20000;cd tapir;bash clients.sh 3 $trd $total_shards $keys" &
ssh 20.114.170.255     "ulimit -n 20000;cd tapir;bash clients.sh 4 $trd $total_shards $keys" &
ssh 20.119.184.193     "ulimit -n 20000;cd tapir;bash clients.sh 5 $trd $total_shards $keys" &
ssh 172.177.44.39     "ulimit -n 20000;cd tapir;bash clients.sh 6 $trd $total_shards $keys" &
ssh 20.97.161.113     "ulimit -n 20000;cd tapir;bash clients.sh 7 $trd $total_shards $keys" &
ssh 20.119.186.135     "ulimit -n 20000;cd tapir;bash clients.sh 8 $trd $total_shards $keys" &


