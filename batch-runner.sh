leaders=(
20.7.73.161
172.177.43.196
172.177.44.39
20.242.21.226
20.98.252.16
20.242.21.227
20.98.239.172
20.98.251.234
20.242.22.50
20.7.74.198
)
p1s=(
20.7.75.5
20.114.170.255
20.97.161.113
20.97.161.36
20.97.162.180
20.97.162.170
20.119.180.46
20.161.4.243
20.110.131.171
20.22.210.204
)
p2s=(
20.230.88.107
20.119.184.193
20.119.186.135
20.119.185.89
20.119.186.174
20.119.186.202
20.114.138.242
20.119.187.240
20.119.234.31
20.119.234.161
)

outfile="cmds.sh"
echo "" > $outfile

n_partitions=$1
leaders=("${leaders[@]:0:$n_partitions}")
p1s=("${p1s[@]:0:$n_partitions}")
p2s=("${p2s[@]:0:$n_partitions}")


echo "using partitions: $n_partitions..."
echo "" > $outfile

echo 'echo "start kill..."' >> $outfile
cmd="cd tapir;bash kill.sh"
for i in "${!leaders[@]}"
do
  ip=${leaders[$i]}
  echo "ssh $ip '$cmd'" >> $outfile
done
for i in "${!p1s[@]}"
do
  ip=${p1s[$i]}
  echo "ssh $ip '$cmd'" >> $outfile
done
for i in "${!p2s[@]}"
do
  ip=${p2s[$i]}
  echo "ssh $ip '$cmd'" >> $outfile
done

keys=1000000
let keys=$n_partitions*$keys
echo 'sleep 5' >> $outfile
echo 'echo "start server..."' >> $outfile
j=0
for i in "${!leaders[@]}"
do
  let j=$i+1
  ip=${leaders[$i]}
  echo "ssh $ip 'ulimit -n 20000;cd tapir;bash r0.sh $j 0 23 $keys'" >> $outfile
done
for i in "${!p1s[@]}"
do
  let j=$j+1
  ip=${p1s[$i]}
  echo "ssh $ip 'ulimit -n 20000;cd tapir;bash r1.sh $j 0 23 $keys'" >> $outfile
done
for i in "${!p2s[@]}"
do
  let j=$j+1
  ip=${p2s[$i]}
  echo "ssh $ip 'ulimit -n 20000;cd tapir;bash r2.sh $j 0 23 $keys'" >> $outfile
done






needToRuns=(1 2 3 4 5 6 7 8 9 10)
needToRuns=(2)
for shards in "${needToRuns[@]}"
do
for i in "${!leaders[@]}"
do
  ip=${leaders[$i]}
  cmd="ulimit -n 30000;cd srolis;bash bash/shard.sh $n_partitions $i $thds 30 localhost > ./results/exp-localhost-v14-$n_partitions-$thds-$i-$r.log 2>&1 &"
  echo "ssh to reqest to $ip, $cmd"
  ssh $ip "$cmd" &
  sleep 0.3
  echo "ssh $ip '$cmd' &" >> $outfile
  echo "sleep 0.3" >> $outfile
done

for i in "${!p1s[@]}"
do
  ip=${p1s[$i]}
  cmd="ulimit -n 30000;cd srolis;bash bash/shard.sh $n_partitions $i $thds 30 p1 > ./results/exp-p1-v14-$n_partitions-$thds-$i-$r.log 2>&1 &"
  echo "ssh to reqest to $ip, $cmd"
  ssh $ip "$cmd" &
  sleep 0.3
  echo "ssh $ip '$cmd' &" >> $outfile
  echo "sleep 0.3" >> $outfile
done

for i in "${!p2s[@]}"
do
  ip=${p2s[$i]}
  cmd="ulimit -n 30000;cd srolis;bash bash/shard.sh $n_partitions $i $thds 30 p2 > ./results/exp-p2-v14-$n_partitions-$thds-$i-$r.log 2>&1 &"
  echo "ssh to reqest to $ip, $cmd"
  ssh $ip "$cmd" &
  sleep 0.3
  echo "ssh $ip '$cmd' &" >> $outfile
  echo "sleep 0.3" >> $outfile
done


echo "127.0.0.1" "echo 'waiting...'"

echo "Wait for jobs..."
FAIL=0
for job in `jobs -p`
do
    wait $job || let "FAIL+=1"
done

if [ "$FAIL" == "0" ];
then
    echo "YAY!"
else
    echo "FAIL! ($FAIL)"
fi

while ! grep -q "10000 ms" ./results/exp-localhost-v14-$n_partitions-24-0-0.log; do
    sleep 0.1
done
#echo "kill leader-datacenter"
#bash bash/kill_leader_datacenter.sh
echo "event triggerd, Kill the leader-0"
ps aux |  grep -i localhost | grep -i "shard-index 0" |  awk '{print $2}'  |  xargs sudo kill -9

let sTime=$thds+20
sleep $sTime
#nnn=$thds
#cat ~/srolis/results/localhost-u-$n_partitions-$nnn-*.log | ag 'NewOrder_remote_commit_latency'
#cat ~/srolis/results/localhost-u-$n_partitions-$nnn-*.log | ag 'agg_throughput'
#cat ~/srolis/results/localhost-u-$n_partitions-$nnn-*.log | ag 'agg_throughput' | wc -l
#cat ~/srolis/results/localhost-u-$n_partitions-$nnn-*.log | ag 'agg_throughput'| awk '{sum += $2} END {print sum}'
##echo ""

done
