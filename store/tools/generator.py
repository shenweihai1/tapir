import collections
import subprocess
import sys

# 30 for clients , 10 for the leader+p1+p2
def getNoLeaderBasedShardsInfo():
    ips = []
    for e in open("./ips.pub","r").readlines():
        ips.append(e.strip())
    
    n_partitions=-1
    with open('./n_partitions', 'r') as file:
        file_contents = file.read()
        n_partitions = int(file_contents)

    data = collections.defaultdict(list)
    data["n_partitions"] = n_partitions
    for i in range(n_partitions):
        data["c1"].append(ips[n_partitions*0+i]) # learner
        data["c2"].append(ips[n_partitions*1+i]) # localhost
        data["c3"].append(ips[n_partitions*2+i]) # p1
        data["p123"].append(ips[n_partitions*3+i]) # p2

    return data

# Janus
# 30 for clients, 10 for leader, 10 for p1+p2
def convertNoLeaderBasedYamlMulti(trds, shards):
    total = trds * shards
    shardInfo = getNoLeaderBasedShardsInfo()
    
    basePort = 51000
    i = 0
    for trd in range(1,trds+1):
        for shard in range(shards):
            file_name = "shard{idx}.config".format(idx=i)
            host = shardInfo["p123"][shard]
            content = """f 1
replica {host}:{port0}
replica {host}:{port1}
replica {host}:{port2}""".format(host=host, port0=basePort, port1=basePort+1, port2=basePort+2)
            f = open(file_name, "w")
            f.write(content)
            f.close()
            basePort += 3
            i += 1

if __name__ == "__main__":
    result = subprocess.run("rm *.config", shell=True, check=True, text=True)
    print("rm all config:", result.stdout)

    shards = int(sys.argv[1])
    trds = int(sys.argv[2])
    convertNoLeaderBasedYamlMulti(trds=trds, shards=shards)