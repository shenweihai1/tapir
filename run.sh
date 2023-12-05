bash cmds-6.sh
sleep 5
bash cmds-7.sh
sleep 5
bash cmds-8.sh
sleep 5
bash cmds-9.sh
sleep 5
bash cmds-10.sh

mkdir -p ~/tapir/logs/trail-1
mv ~/tapir/logs/shard-* ~/tapir/logs/trail-1

bash cmds-6.sh
sleep 5
bash cmds-7.sh
sleep 5
bash cmds-8.sh
sleep 5
bash cmds-9.sh
sleep 5
bash cmds-10.sh
sleep 5

mkdir -p ~/tapir/logs/trail-2
mv ~/tapir/logs/shard-* ~/tapir/logs/trail-2

bash cmds-6.sh
sleep 5
bash cmds-7.sh
sleep 5
bash cmds-8.sh
sleep 5
bash cmds-9.sh
sleep 5
bash cmds-10.sh
sleep 5

mkdir -p ~/tapir/logs/trail-3
mv ~/tapir/logs/shard-* ~/tapir/logs/trail-3
