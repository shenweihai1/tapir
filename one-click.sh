
skill server
skill timeserver
skill benchClient
rm /home/weihai/tapir/s*:*
rm /home/weihai/tapir/logs/*.log 
#rm /home/weihai/tapir/store/tools/keys
sleep 1

nshards=$1
# let keys=1*1000000
# echo "start to generate keys: $keys"
# python /home/weihai/tapir/store/tools/key_generator.py $keys > /home/weihai/tapir/store/tools/keys
# echo "generate DONE"

trd=$nshards
L=0
R=$trd
taskset -ac $L-$R bash r0.sh $nshards
sleep 1
let L=24
let R=$L+$trd
taskset -ac $L-$R bash r1.sh $nshards
sleep 1
let L=48
let R=$L+$trd
taskset -ac $L-$R bash r2.sh $nshards
sleep 1
let L=72
let R=128
taskset -ac $L-$R bash clients.sh $nshards

while ! grep -q "TPS" ./logs/client-1.log; do
    tail ./logs/client-*.log
    sleep 1
done

sleep 2
# cat client-* > client.log
# cat client.log |ag 'TPS:'|cut -f1 -d ','| sed 's/TPS: //'
cat ./logs/client-*.log|ag 'TPS'| ag 'TPS' | wc -l
cat ./logs/client-*.log| ag 'TPS'| awk '{sum += $2} END {print sum}'
echo ""