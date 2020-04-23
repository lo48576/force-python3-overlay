# force-python3 overlay

Packages in this overlay is marked as supporting python3, but they are not tested.
Use at your own risk.

## Packages

### Simply marked as supporting python 3 (and/or python 3.8)

Packages which already (probably) supports Python 3 and/or Python 3.8.

* app-admin/ansible-2.9.7
* dev-libs/zziplib-0.13.70
    + This version is not in gentoo repo.
    + Some patches are applied.
* dev-python/crcmod-1.7-r3
* dev-python/nototools-20191017
    + This version is not in gentoo repo.
* dev-python/python-evdev-1.1.2-r1
* games-util/lutris-0.5.6
* sys-power/acpilight-1.2

### Patches added to port to python 3 (and/or python 3.8)

Packages which does not work with Python 3 and/or Python 3.8.
These packages are patched to make it work.

**USE AT YOUR OWN RISK**.
I don't like and don't know Python, and they can have new errors or bugs.

* gnome-base/gconf-3.2.6-r4
    + `gsettings-schema-convert` script is modified
      ([`gconf-3.2.6-python3.patch`](gnome-base/gconf/files/gconf-3.2.6-python3.patch)).
* media-fonts/noto-emoji-20191017
    + This version is not in gentoo repo.
    + Build scripts (written in python 2) are modified
      ([`noto-emoji-20191017-python3.patch`](media-fonts/noto-emoji/files/noto-emoji-20191017-python3.patch)).
        - <https://github.com/googlefonts/noto-emoji/pull/267> and its review helped a lot. Thanks.
