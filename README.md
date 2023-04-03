# termux-docker
This repo is literally the same script you have [here](https://github.com/mrp-yt/docker_and_portainer_on_dex), but it works and it is actively maintained.



### How to use

  Create the virtual machine with
  
  ``` sh
  # It will take some time, don't worry
  curl -o setup.sh https://raw.githubusercontent.com/Zeioth/termux-docker/main/setup.sh && chmod 755 ./setup.sh && ./setup.sh
  ```

  That's all. Now you can run qemu with:
  
  ``` sh
  # Login with user: root PASSWORD: groovy
  $HOME/alpine/startqemu.sh
  ```

### WIP

  (OPTIONAL) Install portainer
  ```
  curl -o portainer_port.sh https://raw.githubusercontent.com/mrp-yt/docker_and_portainer_on_dex/main/portainer_port.sh &&
  chmod 755 ./portainer_port.sh &&
  ./portainer_port.sh &&
  rm portainer_port.sh
  ```

* Portainer-CE container install command
  ```
  docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
  ```

* To check if Portainer container is running.
  ```
  docker ps
  ```
* Access Portainer Dashboard from same device
  ```
  http://localhost:9000
  ```
  To access Portainer Dashboard from another device on same network you will need to know your device local IP address. \
  Example `192.168.*.*` followed by Portainer port `:9000`\
  `http://192.168.123.123:9000`
  
## Original project info

* This is a guide on how to setup Docker and Portainer on Samsung DeX (Android)
* [Reddit post](https://www.reddit.com/r/SamsungDex/comments/pegoti/run_docker_containers_on_samsung_dex_bonus/)
* [MRP YouTube video](https://youtu.be/IthUo9zVfmg)

### FAQ

* **Where do I run the commands?** In [Termux](https://termux.dev/en/). You can download it from [F-Droid](https://www.f-droid.org/).
