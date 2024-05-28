Quickly spin up a single node cluster and setup aerospike montioring using prometheus and grafana using docker containers

reference: https://aerospike.com/docs/monitorstack/install/docker
## Steps 
1. Run Aerospike Prometheus Exporter
```bash
docker run -itd --name exporter --link="aerospike" -e AS_HOST=aerospike -e AS_PORT=3000 -e METRIC_LABELS="type='development',source='aerospike'" -p 9145:9145 aerospike/aerospike-prometheus-exporter:latest
```
2. Run Prometheus

Run a Prometheus container and configure the exporter as a scrape target.

Create `prometheus.yml` with this content:

```bash
global:
  scrape_interval: 15s
  ‎
scrape_configs:
  - job_name: 'aerospike'
    static_configs:
        - targets: ['exporter:9145']
```
```bash
docker run -tid --name prometheus --link="exporter" -p 9090:9090 -v <Path_of_prometheus.yml>:/etc/prometheus/prometheus.yml prom/prometheus:latest

```
3. Run Grafana

Grafana's default port is 3000, however Aerospike is already bound to ports 3000, 3001, and 3002. To avoid a conflict, you must use the -p flag to rebind Grafana to a new port outside this range. The following example rebinds it to 3003.

```bash
docker run -d --name grafana -p 3003:3000 grafana/grafana
```

Visit http://localhost:3003/ to access the dashboard.
