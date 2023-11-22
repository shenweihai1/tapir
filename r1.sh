nshards=$1
keys=$2
# Start all replicas and timestamp servers
/home/weihai/tapir/timeserver/timeserver \
    -c /home/weihai/tapir/store/tools/shard.tss.config \
    -i 1 > /home/weihai/tapir/logs/tss.replica1.log 2>&1 &
sleep 0.1

for ((i = 0; i < nshards; i++)); do
/home/weihai/tapir/store/tapirstore/server \
    -m txn-l -f /home/weihai/tapir/store/tools/keys \
    -k $keys -e 0 -s 0 -c /home/weihai/tapir/store/tools/shard$i.config \
    -i 1 > ./logs/server-replica1-$i.log 2>&1 &
    sleep 0.1
done