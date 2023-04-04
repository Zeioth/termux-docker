# termux-docker
This repo is a combination of [this](https://github.com/egandro/docker-qemu-arm) and [this](https://github.com/mrp-yt/docker_and_portainer_on_dex), except it works and it is actively maintained.


## How to use: Docker

  Create the virtual machine with:
  
  ``` sh
  curl -o setup.sh https://raw.githubusercontent.com/Zeioth/termux-docker/main/setup.sh && chmod 755 ./setup.sh && ./setup.sh
  ```

  And start start it with:
  
  ``` sh
  # Login credentials → USER: root PASSWORD: groovy
  ~/alpine/startqemu.sh
  ```
  
  Inside this virtual machine you can use docker as you would do in a normal computer.

## How to use: Portainer

  Run it with
  ``` sh
  # Run the container → Then open this URL in your browser to use it: http://localhost:9000
  docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce && echo " * Open http://localhost:9000 in your browser to use portainer." && echo " * You can make sure the container is running with 'docker ps'."
  ```

  If you want to access the Portainer Dashboard from another device on your same network, you will need your device local IP address.
  
  ``` sh
  # Example:
  http://192.168.123.123:9000
  ```

## How to use: Kubernetes

  Run it with
  ```sh
  # Included packages: kubectl, kustomize, helm, aws-cli, aws-authenticator...
  # Port reference: https://kubernetes.io/docs/reference/networking/ports-and-protocols/
  docker run -d -p 8000:8000 -p 6443:6443 -p 2379:2380 -p 10250:10250 -p 10259:10259 -p 10257:10257 -p 6443:6443 -p 10250:10250 -p 30000:32767 --name=kubernetes --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v kubernetes_data:/data alpine/k8s:1.24.12 && echo " * You can make sure the container is running with 'docker ps'."
  ```

## How to use: Prometheus
  ```sh
  # Run the container → Then open this URL in your browser to use it: http://localhost:9090
  docker run -d -p 9090:9090 -v /path/to/prometheus.yml:/etc/prometheus/prometheus.yml --name=prometheus --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v prometheus_data:/data prom/prometheus && echo " * Open http://localhost:9090 in your browser to use prometheus." && echo " * You can make sure the container is running with 'docker ps'."
  ```

## How to use: Grafana

  ```sh
  # Run the container → Then open this URL in your browser to use it: http://localhost:3000
  docker run -d -p 8000:8000 -p 3000:3000 --name=grafana --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v grafana_data:/data grafana/grafana-oss:8.5.22 && echo " * Open http://localhost:3000 in your browser to use grafana." && echo " * You can make sure the container is running with 'docker ps'."
  ```

## Demo

![doc](https://user-images.githubusercontent.com/3357792/229592523-72232b5a-02ee-478a-9d25-420472fbce47.jpg)

# Other relevant reference data

* [Kubernetes Port reference](https://kubernetes.io/docs/reference/networking/ports-and-protocols/): We are opening the necessary ports
* [Kubernetes docker image reference](https://hub.docker.com/r/alpine/k8s): The image we use include Helm and other stuff you would normally use.
* [Portainer docker image reference](https://hub.docker.com/r/portainer/portainer-ce): Noting super relevant here. Just for reference.
* [Grafana docker image reference](https://hub.docker.com/r/grafana/grafana/tags): Nothing super relevant here. Check [their official docs](https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/) also if you want.

## FAQ

* **Where do I run the commands?** In [Termux](https://termux.dev/en/). You can download it from [F-Droid](https://www.f-droid.org/).
* **I can't run portainer/kubernetes!** You need to setup docker first, follow the steps.
* **It is really actively maintained?** Yes. Even if for some wild reason I don't have a lot of time to fix bugs myself, I tend to revise PRs quite fast.
* **Can I open issues?**: By general rule only PRs are allowed, but if an issue show a certain degree of reseach prior to submit it, or it is part or a reseach process, I will be glad to discuss it. Any other issue will be closed without answer.
* **Does my device need to be rooted?** No.
* **Do I need to run the docker images every time?** No. You can see we are using "--restart=always" which means the images will run automatically every time you run "startqemu.sh".
