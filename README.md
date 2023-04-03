# termux-docker
This repo is a combination of [this](https://github.com/egandro/docker-qemu-arm) and [this](https://github.com/mrp-yt/docker_and_portainer_on_dex), except it works and it is actively maintained.


### How to use

  Create the virtual machine with
  
  ``` sh
  curl -o setup.sh https://raw.githubusercontent.com/Zeioth/termux-docker/main/setup.sh && chmod 755 ./setup.sh && ./setup.sh
  ```

  That's all. Now you can run qemu with:
  
  ``` sh
  # Login with user: root PASSWORD: groovy
  $HOME/alpine/startqemu.sh
  ```

### Extra things you might like

  Run portainer
  ```
  # Run the container → Then open this URL in your browser to use it: http://localhost:9000
  docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce && echo " * Open http://localhost:9000 in your browser to use portainer." && echo " * You can make sure the container is running running 'docker ps'."
  ```

  If you want to access the Portainer Dashboard from another device on your same network, you will need your device local IP address. \
  
    Example:
    http://192.168.123.123:9000

### FAQ

* **Where do I run the commands?** In [Termux](https://termux.dev/en/). You can download it from [F-Droid](https://www.f-droid.org/).
* **It is really actively maintained?** Yes. Even if for some wild reason I don't have a lot of time to fix bugs myself, I tend to revise PRs quite fast.
