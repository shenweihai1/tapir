nshards=$1
keys=$2
let clients=$nshards*9
echo "using keys: $keys, clients: $clients"

for ((i = 1; i <= $clients; i++)); do
  /home/weihai/tapir/store/benchmark/benchClient \
    -c /home/weihai/tapir/store/tools/shard -N $nshards \
    -f /home/weihai/tapir/store/tools/keys -d 30 -l 4 \
    -w 50 -k $keys -m txn-l -e 0 -s 0 -z -1 > ./logs/client-$i.log 2>&1 &
done
