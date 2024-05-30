# Aerospike Monitoring Using Aerolab

reference: https://github.com/aerospike/aerospike-monitoring

This exercise focuses on monitoring aerospike database nodes across multiple clusters levaraging docker as a backend type, also mimicing xdr between two data centers (two different clusters).

NOTE: This exercise assumes to have aerolab installed and configured already, refer to [Aerolab setup guide](https://github.com/shivanand-patil/AS-monitoring/blob/main/aerolab_setup.md) 

If you don't have aerolab installed, give [sinle node cluster](https://github.com/shivanand-patil/AS-monitoring/tree/main/single%20node%20cluster) a try, which will help you quickly spin up a single node cluster and setup aerospike montioring using prometheus and grafana using docker containers

## Steps

Clone the repo using:
```bash
git clone https://github.com/shivanand-patil/AS-monitoring.git
```

Set permissions
```bash
chmod +x *.sh
```

To test and deploy clusters locally using docker run:
```bash
./create.sh
```

Add load to clusters to mimic real-world workloads using:
```bash
./load.sh

```
List the cluster details:
```bash
aerolab cluster list
```
```bash
(aerolab) shivanand.intern@PP-LLP45HJC7N ~ % aerolab cluster list
 CLUSTERS
 ClusterName  NodeNo  State          PublicIP  PrivateIP   ExposedPort  Owner            AsdVer   Arch   Distro  DistroVer  InstanceID    ImageID                         ~
 dc1          1       Up_28_minutes            172.17.0.2  3100         shivanandintern  7.1.0.0  arm64  ubuntu  22.04      bdb268ca810c  aerolab-ubuntu_22.04_arm64:7.1. ~
 dc1          2       Up_28_minutes            172.17.0.3  3101         shivanandintern  7.1.0.0  arm64  ubuntu  22.04      b6a09792dcee  aerolab-ubuntu_22.04_arm64:7.1. ~
 dc1          3       Up_14_minutes            172.17.0.6  3103         shivanandintern  7.1.0.0  arm64  ubuntu  22.04      7ef656efa693  aerolab-ubuntu_22.04_arm64:7.1. ~
 dc1          4       Up_14_minutes            172.17.0.7  3104         shivanandintern  7.1.0.0  arm64  ubuntu  22.04      0d6bad008c5f  aerolab-ubuntu_22.04_arm64:7.1. ~
 dc2          1       Up_28_minutes            172.17.0.4  3102         shivanandintern  7.1.0.0  arm64  ubuntu  22.04      d405fa600a74  aerolab-ubuntu_22.04_arm64:7.1. ~
```
Grow the cluster by adding nodes:
```bash
aerolab cluster grow -n dc1 -c 2
```

Configure prometheus for newly added nodes:
```bash
aerolab cluster add exporter -n dc1 -o ape1.toml --nodes 3,4
```


Destroy cluster
```bash
./destroy.sh
```

## Flow

<img width="951" alt="Screenshot 2024-05-30 at 1 08 17 PM" src="https://github.com/shivanand-patil/AS-monitoring/assets/70444072/6764d7b0-480d-44ed-9b04-3a928f16e57a">

