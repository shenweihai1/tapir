nshards=$1
# Start all replicas and timestamp servers
/home/weihai/tapir/timeserver/timeserver \
    -c /home/weihai/tapir/store/tools/shard.tss.config \
    -i 2 > /home/weihai/tapir/logs/tss.replica2.log 2>&1 &
sleep 0.1

for ((i = 0; i < nshards; i++)); do
/home/weihai/tapir/store/tapirstore/server \
    -m txn-l -f /home/weihai/tapir/store/tools/keys \
    -k 1000000 -e 0 -s 0 -c /home/weihai/tapir/store/tools/shard$i.config \
    -i 2 > ./logs/server-replica2-$i.log 2>&1 &
    sleep 0.1

done