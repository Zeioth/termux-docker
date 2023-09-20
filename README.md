# termux-docker
This repo is a combination of [this](https://github.com/egandro/docker-qemu-arm) and [this](https://github.com/mrp-yt/docker_and_portainer_on_dex), except it works and it is actively maintained.


## How to use: Docker

  Create the virtual machine with:
  
  ``` sh
  curl -o setup.sh https://raw.githubusercontent.com/Zeioth/termux-docker/main/setup.sh && chmod 755 ./setup.sh && ./setup.sh
  ```

  And start it with:
  
  ``` sh
  # Login credentials → USER: root PASSWORD: groovy
  ~/alpine/startqemu.sh
  ```
  
  Inside this virtual machine you can use docker as you would do in a normal computer.

## How to use: Portainer

  Run it with
  ``` sh
  # Run the container → Then open this URL in your browser to use it: http://localhost:9000
  docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v ~/docker-volumes/portainer:/home portainer/portainer-ce && echo " * Open http://localhost:9000 in your browser to use portainer." && echo " * You can make sure the container is running with 'docker ps'."
  ```

  If you want to access the Portainer Dashboard from another device on your same network, you will need your device local IP address.
  
  ``` sh
  # Example:
  http://192.168.123.123:9000
  ```

## How to use: Kubernetes

  Run it with
  ```sh
  # Run this command to login interactively into the container and run commands like 'kubectl'.
  # WARNING: This container won't do anything by itself if you make in run on background.
  docker run -it --entrypoint /bin/sh -p 6443:6443 -p 2379:2380 -p 10250:10250 -p 10259:10259 -p 10257:10257 -p 30001:32767 -v ~/docker-volumes/kubernetes:/home -v /var/run/docker.sock:/var/run/docker.sock alpine/k8s:1.24.12
  ```

## How to use: Prometheus
  ```sh
  # WARNING: You must edit the command to change "/path/to/prometheus.yml" by the actual file.
  # See: https://github.com/prometheus/prometheus/blob/main/documentation/examples/prometheus.yml
  docker run -d -p 9090:9090 -v /path/to/prometheus.yml:/etc/prometheus/prometheus.yml --name=prometheus --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v ~/docker-volumes/prometheus:/home prom/prometheus && echo " * You can make sure the container is running with 'docker ps'."
  ```

## How to use: Grafana

  ```sh
  # Run the container → Then open this URL in your browser to use it: http://localhost:3000
  docker run -d -p 3000:3000 --name=grafana --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v ~/docker-volumes/grafana:/home grafana/grafana-oss:8.5.22 && echo " * Open http://localhost:3000 in your browser to use grafana." && echo " * You can make sure the container is running with 'docker ps'."
  ```

## Demo

![doc](https://user-images.githubusercontent.com/3357792/229592523-72232b5a-02ee-478a-9d25-420472fbce47.jpg)

# Other relevant reference data

* [Kubernetes Port reference](https://kubernetes.io/docs/reference/networking/ports-and-protocols/): We are opening the necessary ports, but you can double check here.
* [Kubernetes docker image reference](https://hub.docker.com/r/alpine/k8s): The image we use include Helm and other stuff you would normally use.
* [Portainer docker image reference](https://hub.docker.com/r/portainer/portainer-ce): Noting super relevant here. Just for reference.
* [Prometheus docker image reference](https://hub.docker.com/r/prom/prometheus): You can find an example prometheus.yaml file in [the prometheus github repo](https://github.com/prometheus/prometheus/blob/main/documentation/examples/prometheus.yml).
* [Grafana docker image reference](https://hub.docker.com/r/grafana/grafana/tags): Nothing super relevant here. Check [their official docs](https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/) also if you want.


## FAQ

* **Where do I run the commands?** In [Termux](https://termux.dev/en/). You can download it from [F-Droid](https://www.f-droid.org/).
* **I can't run portainer/kubernetes!** You need to setup docker first, follow the steps.
* **It is really actively maintained?** Yes. Even if for some wild reason I don't have a lot of time to fix bugs myself, I tend to revise PRs quite fast.
* **Can I open issues?**: By general rule only PRs are allowed, but if an issue show a certain degree of reseach prior to submit it, or it is part or a reseach process, I will be glad to discuss it. Any other issue will be closed without answer.
* **Does my device need to be rooted?** No.
* **Do I need to run the docker images every time?** No. You can see we are using "--restart=always" which means the images will run automatically every time you run "startqemu.sh".
* **Give me a short explanation about everything** The setup.sh script uses qemu to create a virtual machine based on an alpine iso image, then docker is installed on it. From this point you can optionally install the rest of the software using docker. Docker run containers. Kubernetes is used for automated deployment. Portainer allow you to manage containers visually. Prometheus can be connected to everything to gather data. Grafana is a frontent for prometheus, mostly used to check logs.
* **How do I make changes in a container permanent?** You can see when we use 'docker run' we are always using the -v parameter. That's a volume. After you exit your container, volumes will remain. By default we use ~/docker-volumes/container-name. Remember this IS inside the qemu virtual machine, NOT in your Termux directories.
