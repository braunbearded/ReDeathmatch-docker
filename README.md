# CS 1.6 Docker Server 🕹️

This repository contains all the necessary files to create a Counter-Strike 1.6 server with Deathmatch (CSDM) using Docker on a Linux environment. It’s designed to be lightweight and straightforward, focusing solely on CSDM gameplay without additional features like stats, sounds, or custom skins.

## Table of Contents 📑

- [Usage](#usage-rocket)
- [Networking](#networking-globe_with_meridians)
- [Shell in Container](#shell-in-container-computer)
- [Requirements](#requirements-package)
- [Technical Details](#technical-details-gear)
- [Support](#support-raising_hand)
- [References](#references-books)

## Usage 🚀

1. **Edit the `.env` file**:  
   Make sure to update the environment variables in the `.env` file according to your preferences. This file controls various configurations for your server.

2. **Update Configurations**:  
   Change the `<changeme>` placeholders in the following configuration files:

   - `configs/yapb.cfg`
   - `configs/users.ini`

3. **Start the Server**:  
   Once everything is configured, run the following command to start your server:
   ```bash
   docker compose up
   ```
   Enjoy your new Counter-Strike 1.6 Deathmatch server!

## Networking 🌐

To ensure your server is accessible, make sure the port specified in your `.env` file (default is `27015`) is not blocked by your firewall. You can open the port using the following command:

```bash
sudo firewall-cmd --add-port=27015/udp --permanent
sudo firewall-cmd --reload
```

This command opens the UDP port `27015` permanently.

## Shell in Container 🖥️

If you need to access the running container’s shell, use the following command:

```bash
sudo docker compose exec hlds-gameserver bash
```

This will drop you into the container’s shell, where you can perform various administrative tasks.

## Requirements 📦

The server is lightweight and doesn't require much in terms of resources. It has been successfully tested on an Oracle Always Free AMD server. However, it should work on any Linux-based system that supports Docker.

## Technical Details ⚙️

- **ReHLDS**: Re-engineered HLDS, a more secure, faster, and efficient version of the original Half-Life Dedicated Server.
- **ReGameDLL_CS**: A reimplementation of the original game DLL for Counter-Strike 1.6.
- **ReDeathMatch**: A plugin that enables Deathmatch mode in Counter-Strike.
- **YaPB**: A bot plugin that adds AI-controlled players to your server.

These components are integrated to create a smooth and efficient CSDM server experience.

## Support 🙋

If you encounter any issues or have suggestions for improvements, feel free to [create an issue](https://github.com/braunbearded/ReDeathmatch-docker/issues) or submit a pull request (PR). Your contributions are highly appreciated!

## References 📚

- [Docker Documentation](https://docs.docker.com)
- [ReHLDS GitHub](https://github.com/dreamstalker/rehlds)
- [ReGameDLL_CS GitHub](https://github.com/s1lentq/ReGameDLL_CS)
- [ReDeathMatch GitHub](https://github.com/s1lentq/ReDeathMatch)
- [YaPB GitHub](https://github.com/jeefo/yapb)
- [hldsdocker Github](https://github.com/hldsdocker/rehlds)
- [CSDM by bailopan](https://www.bailopan.net/csdm/)

For more detailed information, please refer to the above links. If you have any questions, don't hesitate to reach out!

---

Happy fragging! 🎮
