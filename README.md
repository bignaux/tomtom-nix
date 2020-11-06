# NixOS on the Tomtom

# Build and install uboot

**Read this first**: [Upgrading u-boot on
SheevaPlug](https://www.cyrius.com/debian/kirkwood/tomtom/uboot-upgrade/)

**You must manually preserve your ethernet address**

```
$ nix-build uboot.nix -o uboot
```

Install from linux:

```
$ flash_erase /dev/mtd0 0 0
$ nandwrite -p /dev/mtd0 u-boot.kwb
```

If this goes wrong, you can recover via [jtag with
openocd](https://newit.co.uk/forum/index.php?topic=2835.0).

# Build and dump the sdImage

```
$ nix-build tomtom-system.nix -A config.system.build.sdImage -o sdImage
$ bzcat sdImage/sd-image/*.bz2 > /dev/$sdcard
```

The contents `sd-image-tomtom.nix` are almost identical to
upstream `sd-image-aarch64.nix` and
`sd-image-armv7l-multiplatform.nix`, the main differences are
 - no raspberry pi support
 - smaller set of dependencies required
