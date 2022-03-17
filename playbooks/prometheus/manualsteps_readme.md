### CHECK OPEN PORTS
```
sudo netstat -tulpn | grep 'LISTEN&&\|9090\|9100\|9835\|3000'
```

## Installing Prometheus server on any one server
#### make directories
```
sudo mkdir -p /etc/prometheus_dockerised/conf
sudo mkdir -p /etc/prometheus_dockerised/data

```
- if user with id 1001 is not present then create user & group with id 1001 as container is going to use this perticular id.
  
```
sudo cat /etc/passwd | grep -i "1001"
# sudo groupadd -g 1001 prometheususer
# sudo useradd prometheususer -u 1001 -g 1001 -m -s /bin/bash
sudo chown -R 1001:1001 /etc/prometheus_dockerised
```
- create config file /etc/prometheus_dockerised/conf/prometheus.yml
  
```
sudo cat <<EOF | sudo tee /etc/prometheus_dockerised/conf/prometheus.yml

global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
    - targets: ['localhost:9093']
  - job_name: 'node_exporter'
    scrape_interval: 5s
    static_configs:
    - targets: ['localhost:9100','192.168.0.215:9100']
  - job_name: 'nvidia_gpu_exporter'
    scrape_interval: 5s
    static_configs:
    - targets: ['192.168.0.211:9835']

EOF
```

### execute docker container with volumes mapped to above folders.
```
docker run -dit -p 9093:9090 --name prometheus \
-v /etc/prometheus_dockerised/conf:/opt/bitnami/prometheus/conf/ \
-v /etc/prometheus_dockerised/data:/opt/bitnami/prometheus/data \
bitnami/prometheus:latest
```

## Installing node-exporter & gpu-exporter
### node-exporter to pull node metrics
```
docker run --name node-exporter-node1 -d -p 9100:9100 bitnami/node-exporter:latest
```

### gpu-exporter  to pull gpu metrics
```
docker run -d \
--name nvidia_smi_exporter \
--restart unless-stopped \
--device /dev/nvidiactl:/dev/nvidiactl \
--device /dev/nvidia0:/dev/nvidia0 \
-v /usr/lib/x86_64-linux-gnu/libnvidia-ml.so:/usr/lib/x86_64-linux-gnu/libnvidia-ml.so \
-v /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1:/usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1 \
-v /usr/bin/nvidia-smi:/usr/bin/nvidia-smi \
-p 9835:9835 \
utkuozdemir/nvidia_gpu_exporter:0.2.0
```

## Installing Grafana
### docker for grafana
```
docker run -d \
  -p 3000:3000 \
  --name=grafana \
  -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource" \
  grafana/grafana-enterprise
```
### login to grafana using cred admin:admin 
  - add datasource -> prometheus
  - create required dashboards (1457 -> gpu exporter)(1860 -> node exporter full).
