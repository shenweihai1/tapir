echo "start kill..."
cmd="cd tapir;bash kill.sh"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"
echo "ssh 127.0.0.1"
ssh 127.0.0.1 "$cmd"


keys=9000000


sleep 5
echo "start server..."
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 0 0 23 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 1 0 23 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 2 0 23 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 3 24 47 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 4 24 47 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 5 24 47 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 6 48 71 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 7 48 71 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 8 48 71 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 9 72 95 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 10 72 95 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 11 72 95 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 12 96 119 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 13 96 119 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 14 96 119 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 15 120 143 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 16 120 143 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 17 120 143 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 18 144 167 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 19 144 167 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 20 144 167 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 21 168 191 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 22 168 191 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 23 168 191 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r0.sh 24 192 215 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r1.sh 25 192 215 $keys"
ssh 127.0.0.1 "ulimit -n 20000;cd tapir;bash r2.sh 26 192 215 $keys"


sleep 5
echo "start clients..."
trd=24
total_shards=216
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 0 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 1 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 2 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 3 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 4 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 5 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 6 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 7 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 8 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 9 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 10 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 11 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 12 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 13 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 14 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 15 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 16 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 17 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 18 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 19 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 20 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 21 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 22 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 23 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 24 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 25 $trd $total_shards $keys" &
ssh 127.0.0.1     "ulimit -n 20000;cd tapir;bash clients.sh 26 $trd $total_shards $keys" &


sleep 35

echo 'DONE'