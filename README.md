# Aerolab guide

- References https://github.com/aerospike/aerolab/blob/master/docs/GETTING_STARTED.md 

1. Install docker desktop on [mac](https://www.docker.com/products/docker-desktop/)
2. install [aerolab-macos-arm64](https://github.com/aerospike/aerolab/releases/download/7.6.0-3a71c9d/aerolab-macos-arm64-7.6.0.zip) (or download any compatible version based on your system architecture)
```
wget https://github.com/aerospike/aerolab/releases/download/7.6.0-3a71c9d/aerolab-macos-arm64-7.6.0.zip
```
3. unzip tar file
```bash 
tar -xvf aerolab-macos-arm64-7.6.0.zip
```
4. set permissions for aerolab binary
```bash
sudo chmod +x aerolab
```
5. move aerolab bin to `/usr/local/bin/` make it executable from anywhere
```bash
 sudo mv aerolab /usr/local/bin/
```


**Getting Started**

- Run aerolab -h to get details on different backend types supported by aerolab (we will be using containers for deployment)
```bash
aerolab --help
```
- Generate a basic aerospike database configuration file using command:
```bash
aerolab 
```

- Set docker as backend deployment type for aerolab to spinup aerolab test cluster on docker containers using the following command:
```bash
aerolab config backend -t docker -d /Users/shivanand.intern/aerolab
```
- To enable shell completion, run one (or both) of:

```
aerolab completion zsh
aerolab completion bash
```
- Before spinning up a cluster generate a basic configuration for database nodes using:
```bash
aerolab conf generate
```
### Deploy a cluster called `testme` with 3 nodes
```
aerolab cluster create --name=testme --count=5
```
