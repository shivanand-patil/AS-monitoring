# Aerospike Monitoring Using Aerolab

reference: https://github.com/aerospike/aerospike-monitoring

This exercise focuses on monitoring aerospike database nodes across multiple clusters levaraging docker as a backend type, also mimicing xdr between two data centers (two different clusters).

NOTE: This exercise assumes to have aerolab installed and configured already, refer to [Aerolab setup guide](https://github.com/shivanand-patil/AS-monitoring/blob/main/aerolab_setup.md) 

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

<img width="988" alt="Screenshot 2024-05-28 at 10 08 23 PM" src="https://github.com/shivanand-patil/AS-monitoring/assets/70444072/d04584da-1dd7-483f-840a-be05373fa21f">

