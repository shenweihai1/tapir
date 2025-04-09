echo "start kill..."
cmd="cd tapir;bash kill.sh"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"


keys=1000000


sleep 5
echo "start server..."
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 0 0 23 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 1 0 23 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 2 0 23 $keys"


sleep 5
echo "start clients..."
trd=24
total_shards=24
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &


sleep 35

echo 'DONE'