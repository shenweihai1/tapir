rm qbert:*
skill server
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard0.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard1.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard2.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard3.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard4.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard5.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard6.config -i 2 &
/home/azureuser/tapir/store/tapirstore/server -m txn-l -f /home/azureuser/tapir/store/tools/keys -k 100000 -e 0 -s 0 -c /home/azureuser/tapir/store/tools/shard7.config -i 2 &

