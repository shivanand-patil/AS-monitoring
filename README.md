# Aerospike Monitoring Using Aerolab

reference: https://github.com/aerospike/aerospike-monitoring

This exercise focuses on monitoring aerospike database nodes across multiple clusters levaraging docker as a backend type, also mimicing xdr among diffent clusters.

NOTE: This exercise assumes to have aerolab installed and configured already, refer to [Aerolab setup guide](https://github.com/shivanand-patil/AS-monitoring/blob/main/aerolab_setup.md) 

## Steps

- Clone the repo using:
```bash
git clone https://github.com/shivanand-patil/AS-monitoring.git
```

- Set permissions
```bash
chmod +x *.sh
```

- To test and deploy clusters locally using docker run:
```bash
./create.sh
```

- Add load to clusters to mimic real-world workloads using:
```bash
./load.sh
```

- Destroy cluster
```bash
./destroy.sh
```
### Run prometheus 

- Run a Prometheus container and configure database containers as a scrape targets using [`prometheus.yml`](https://github.com/shivanand-patil/AS-monitoring/blob/main/prometheus.yml)
```bash
docker run -tid --name prometheus --link="aerolab_c-ams_1" -p 9090:9090 -v /Users/shivanand.intern/AS-monitoring/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus:latest
```
## Flow

<img width="988" alt="Screenshot 2024-05-28 at 10 08 23 PM" src="https://github.com/shivanand-patil/AS-monitoring/assets/70444072/d04584da-1dd7-483f-840a-be05373fa21f">

