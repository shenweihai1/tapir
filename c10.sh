for i in {1..10}
do
  ./c.sh > ./logs/client-$i.log 2>&1 &
done
