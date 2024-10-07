# Using this config on WSL via RDP
It is even possible to use WSL and RDP to connect to your WSL instance.
For this I'd recommend to install xrdp via 

```bash
sudo apt-get install xrdp
```

Then run the following to set-up your xrdp config:
```bash
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32\nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24\nxserverbpp=128/g' /etc/xrdp/xrdp.ini
```

Then change the `/etc/xrdp/startwm.sh` file

```
#!/bin/sh
if [ -r /etc/default/locale ]; then
. /etc/default/locale
export LANG LANGUAGE
fi
xrdb -merge ~/.Xresources
/usr/bin/i3
```

And restart the xrdp service via init.d (e.g. `sudo /etc/init.d/xrdp restart`)

Now you should be able to connect via the Windows RDP tool on `localhost:3390`
