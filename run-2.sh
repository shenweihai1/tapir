echo "start kill..."
cmd="cd tapir;bash kill.sh"
ssh 20.7.73.161     "$cmd"
ssh 20.7.75.5       "$cmd"
ssh 20.230.88.107   "$cmd"
ssh 172.177.43.196  "$cmd"
ssh 20.114.170.255  "$cmd"
ssh 20.119.184.193  "$cmd"

keys=2000000
sleep 5
echo "start server..."
# start server
ssh 20.7.73.161     "ulimit -n 20000;cd tapir;bash r0.sh 0 0 23 $keys"
ssh 20.7.75.5       "ulimit -n 20000;cd tapir;bash r1.sh 1 0 23 $keys"
ssh 20.230.88.107   "ulimit -n 20000;cd tapir;bash r2.sh 2 0 23 $keys"
ssh 172.177.43.196  "ulimit -n 20000;cd tapir;bash r0.sh 3 24 47 $keys"
ssh 20.114.170.255  "ulimit -n 20000;cd tapir;bash r1.sh 4 24 47 $keys"
ssh 20.119.184.193  "ulimit -n 20000;cd tapir;bash r2.sh 5 24 47 $keys"
sleep 5

echo "start clients..."
# start clients
trd=24
total_shards=48
ssh 20.7.73.161     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
sleep 0.1
ssh 20.7.75.5       "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
sleep 0.1
ssh 20.230.88.107   "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &
sleep 0.1
ssh 172.177.43.196  "ulimit -n 20000;cd tapir;bash clients.sh 3 $trd $total_shards $keys" &
sleep 0.1
ssh 20.114.170.255  "ulimit -n 20000;cd tapir;bash clients.sh 4 $trd $total_shards $keys" &
sleep 0.1
ssh 20.119.184.193  "ulimit -n 20000;cd tapir;bash clients.sh 5 $trd $total_shards $keys" &
