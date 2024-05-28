#!/bin/bash

aerolab cluster create -n dc1 -c 2
aerolab cluster create -n dc2 -c 1 

aerolab xdr connect -S dc1 -D dc2 -M test

aerolab cluster add exporter -n dc1 -o ape1.toml
aerolab cluster add exporter -n dc2 -o ape2.toml

aerolab client create ams -n ams -s dc1,dc2 -e 3000:3000
aerolab client attach  -n ams -- grafana-cli plugins install grafana-polystat-panel
aerolab client attach  -n ams -- grafana-cli plugins install jdbranham-diagram-panel
aerolab client attach  -n ams -- service grafana-server restart
