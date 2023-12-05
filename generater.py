leaders=[
"20.7.73.161",
"172.177.43.196",
"172.177.44.39",
"20.242.21.226",
"20.98.252.16",
"20.242.21.227",
"20.98.239.172",
"20.98.251.234",
"20.242.22.50",
"20.7.74.198"
]
p1s=[
"20.7.75.5",
"20.114.170.255",
"20.97.161.113",
"20.97.161.36",
"20.97.162.180",
"20.97.162.170",
"20.119.180.46",
"20.161.4.243",
"20.110.131.171",
"20.22.210.204"
]
p2s=[
"20.230.88.107",
"20.119.184.193",
"20.119.186.135",
"20.119.185.89",
"20.119.186.174",
"20.119.186.202",
"20.114.138.242",
"20.119.187.240",
"20.119.234.31",
"20.119.234.161"
]

def generate(shard):
    oout = open("cmds-{s}.sh".format(s=shard), "w+")
    kill='echo "start kill..."\n'
    kill+='cmd="cd tapir;bash kill.sh"\n'
    for k in range(shard):
        kill+='echo "ssh {h}"\n'.format(h=leaders[k])
        kill+='ssh {h} "$cmd"\n'.format(h=leaders[k])
        kill+='echo "ssh {h}"\n'.format(h=p1s[k])
        kill+='ssh {h} "$cmd"\n'.format(h=p1s[k])
        kill+='echo "ssh {h}"\n'.format(h=p2s[k])
        kill+='ssh {h} "$cmd"\n'.format(h=p2s[k])
    

    server='keys={k}\n\n\n'.format(k=100*10000*shard)
    server+='sleep 5\n'
    server+='echo "start server..."\n'

    j = 0
    for k in range(shard):
        server+='ssh {h} "ulimit -n 20000;cd tapir;bash r0.sh {prefix} {ns} {ne} $keys"\n'.format(h=leaders[k],prefix=j,ns=k*24,ne=(k+1)*24-1)
        j+=1
        server+='ssh {h} "ulimit -n 20000;cd tapir;bash r1.sh {prefix} {ns} {ne} $keys"\n'.format(h=p1s[k],prefix=j,ns=k*24,ne=(k+1)*24-1)
        j+=1
        server+='ssh {h} "ulimit -n 20000;cd tapir;bash r2.sh {prefix} {ns} {ne} $keys"\n'.format(h=p2s[k],prefix=j,ns=k*24,ne=(k+1)*24-1)
        j+=1


    clients='sleep 5\n'
    clients+='echo "start clients..."\n'
    clients+='trd=24\n'
    clients+='total_shards={n}\n'.format(n=shard*24)
    j = 0
    for k in range(shard):
        clients+='ssh {h}     "ulimit -n 20000;cd tapir;bash clients.sh {prefix} $trd $total_shards $keys" &\n'.format(h=leaders[k],prefix=j)
        j+=1
        clients+='ssh {h}     "ulimit -n 20000;cd tapir;bash clients.sh {prefix} $trd $total_shards $keys" &\n'.format(h=p1s[k],prefix=j)
        j+=1
        clients+='ssh {h}     "ulimit -n 20000;cd tapir;bash clients.sh {prefix} $trd $total_shards $keys" &\n'.format(h=p2s[k],prefix=j)
        j+=1
        
    process='''
sleep 80
mkdir -p ~/tapir/logs/shard-{s}
rm ~/tapir/logs/shard-{s}/*
mv ~/tapir/logs/client*.log ~/tapir/logs/shard-{s}/
cp ~/tapir/logs/cal.sh ~/tapir/logs/shard-{s}/
cd ~/tapir/logs/shard-{s}/
bash cal.sh
rm ~/tapir/*.bin
'''.format(s=shard)
    
    oout.write(kill)
    oout.write("\n\n")
    oout.write(server)
    oout.write("\n\n")
    oout.write(clients)
    oout.write("\n\n")
    #oout.write(process)

    oout.flush()
    

if __name__ == "__main__":
    for shard in range(1,11):
        generate(shard)
