# force-python3 overlay

Packages in this overlay is marked as supporting python3, but they are not tested.
Use at your own risk.

## Packages

### Simply marked as supporting python 3 (and/or python 3.9)

Packages which already (probably) supports Python 3 and/or Python 3.9.

* app-emulation/virtualbox-6.1.16-r1
* dev-python/crcmod-1.7-r4
* net-libs/webkit-gtk-2.28.2
* net-libs/webkit-gtk-2.28.3
* net-libs/webkit-gtk-2.28.4
* net-wireless/blueman-2.1.4
* sys-power/acpilight-1.2

### Patches added to port to python 3 (and/or python 3.9)

Packages which does not work with Python 3 and/or Python 3.9.
These packages are patched to make it work.

**USE AT YOUR OWN RISK**.
I don't like and don't know Python, and they can have new errors or bugs.

* gnome-base/gconf-3.2.6-r4
    + `gsettings-schema-convert` script is modified
      ([`gconf-3.2.6-python3.patch`](gnome-base/gconf/files/gconf-3.2.6-python3.patch)).
