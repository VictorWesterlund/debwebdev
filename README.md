**Jump start web development on a fresh installation of Debian.**

This script will install and configure the following programs by default:
- Python3 (with [PIP](https://pypi.org/project/pip/))
- NGINX
- PHP 7.4 FPM (with [Composer](https://getcomposer.org/))

## Step-by-step
*`sudo` is not installed by default in Debian. [Follow this guide](https://unix.stackexchange.com/a/425664) to enable sudo for your non-root user*
1. Install `git`
```
sudo apt-get install -y git
```
2. Clone this repository with `git`
```
git clone https://github.com/VictorWesterlund/debwebdev.git
```
3. Navigate into the cloned folder
```
cd debwebdev
```
4. Run `install.sh` without sudo (sudo password prompt will appear where necessary)
```
./install.sh
```
## What will be installed
- This script will set up and configure NGINX with a self-signed certificate and expose the folder `/var/www/` to `https://localhost`
- A self-signed RSA 4096 certificate (and key) will be generated with `opensll` and installed to `/etc/ssl/certs/` and `/etc/ssl/keys/`
