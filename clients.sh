prefix=$1
nthreads=$2
total_shards=$3
keys=$4
let clients=$nthreads*9
echo "using keys: $keys, clients: $clients"

ROOT=$HOME

for ((i = 1; i <= $clients; i++)); do
  $ROOT/tapir/store/benchmark/benchClient \
    -c $ROOT/tapir/store/tools/shard -N $total_shards \
    -f $ROOT/tapir/store/tools/keys -d 30 -l 4 \
    -w 50 -k $keys -m txn-l -e 0 -s 0 -z -1 > ./logs/client-$prefix-$i.log 2>&1 &
done
