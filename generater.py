leaders = []
for e in open("./store/tools/ips_l.pub","r").readlines():
    leaders.append(e.strip())

p1s = []
for e in open("./store/tools/ips_f1.pub","r").readlines():
    p1s.append(e.strip())

p2s = []
for e in open("./store/tools/ips_f2.pub","r").readlines():
    p2s.append(e.strip())


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
    
    oout.write(kill)
    oout.write("\n\n")
    oout.write(server)
    oout.write("\n\n")
    oout.write(clients)
    oout.write("\n\n")
    oout.write("sleep 35")
    oout.write("\n\n")
    oout.write("echo 'DONE'")

    oout.flush()
    

if __name__ == "__main__":
    for shard in range(1,11):
        generate(shard)
