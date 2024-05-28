# Aerospike Monitoring Using Aerolab

- reference: https://github.com/aerospike/aerospike-monitoring

This exercise focuses on monitoring aerospike database nodes across multiple clusters levaraging docker as a backend type, also mimicing xdr among diffent clusters.

NOTE: This exercise assumes to have aerolab tool installed and configured already, refer to [Aerolab setuo guide](https://github.com/shivanand-patil/AS-monitoring/blob/main/aerolab_setup.md) 

## Steps

1. Clone the repo using:
```bash
git clone https://github.com/shivanand-patil/AS-monitoring.git
```

2. To test and deploy clusters locally using docker run:
```bash
./create.sh
```

3. Add load to clusters to mimic real-world workloads using:
```bash
./load.sh
```

4. Destroy cluster
```bash
./destroy.sh
```
