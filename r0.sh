prefix=$1
ns=$2
ne=$3
keys=$4

ROOT=$HOME

# # Start all replicas and timestamp servers
# $ROOT/tapir/timeserver/timeserver \
#     -c $ROOT/tapir/store/tools/shard.tss.config \
#     -i 0 > $ROOT/tapir/logs/tss.replica0.log 2>&1 &
# sleep 0.1

for ((i = $ns; i <= $ne; i++)); do
$ROOT/tapir/store/tapirstore/server \
    -m txn-l -f $ROOT/tapir/store/tools/keys \
    -k $keys -e 0 -s 0 -c $ROOT/tapir/store/tools/shard$i.config \
    -i 0 > ./logs/server-replica$prefix-$i.log 2>&1 &
done
