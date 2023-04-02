# termux-docker
Just a script that setups everything for you. It is literally the same script you have [here](https://github.com/mrp-yt/docker_and_portainer_on_dex), but it works and it is actively maintained.

### Setup process

* Download Termux from [F-Droid](https://www.f-droid.org/) store and install it, if you didn't alreary.

* Setup Alpine VM in Termux with this one-line-install command (Thanks to egandro)
  ```
  curl -o setup.sh https://github.com/Zeioth/termux-docker/blob/main/setup.sh && chmod 755 ./setup.sh && ./setup.sh
  ```
  *This will take around 8 minutes to complete*

* Run curl script. This will backup default `startqemu.sh` that got generated during VM creation and put amended on in it's place.
  ```
  curl -o portainer_port.sh https://raw.githubusercontent.com/mrp-yt/docker_and_portainer_on_dex/main/portainer_port.sh &&
  chmod 755 ./portainer_port.sh &&
  ./portainer_port.sh &&
  rm portainer_port.sh
  ```

* Start Alpine VM using new `startqemu.sh` file
  ```
  cd ~/alpine/ && ./startqemu.sh
  ```
  **NOTE** - Default login details:\
  User `root`\
  Passwd `Secret123`

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
