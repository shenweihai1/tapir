echo "start kill..."
cmd="cd tapir;bash kill.sh"
echo "ssh 20.7.73.161"
ssh 20.7.73.161 "$cmd"
echo "ssh 20.7.75.5"
ssh 20.7.75.5 "$cmd"
echo "ssh 20.230.88.107"
ssh 20.230.88.107 "$cmd"


keys=1000000


sleep 5
echo "start server..."
ssh 20.7.73.161 "ulimit -n 20000;cd tapir;bash r0.sh 0 0 23 $keys"
ssh 20.7.75.5 "ulimit -n 20000;cd tapir;bash r1.sh 1 0 23 $keys"
ssh 20.230.88.107 "ulimit -n 20000;cd tapir;bash r2.sh 2 0 23 $keys"


sleep 5
echo "start clients..."
trd=24
total_shards=24
ssh 20.7.73.161     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
ssh 20.7.75.5     "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
ssh 20.230.88.107     "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &


