prefix=$1
ns=$2
ne=$3
keys=$4
# # Start all replicas and timestamp servers
# /home/azureuser/tapir/timeserver/timeserver \
#     -c /home/azureuser/tapir/store/tools/shard.tss.config \
#     -i 0 > /home/azureuser/tapir/logs/tss.replica0.log 2>&1 &
# sleep 0.1

for ((i = $ns; i <= $ne; i++)); do
/home/azureuser/tapir/store/tapirstore/server \
    -m txn-l -f /home/azureuser/tapir/store/tools/keys \
    -k $keys -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard$i.config \
    -i 1 > ./logs/server-replica$prefix-$i.log 2>&1 &
done
