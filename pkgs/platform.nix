{ lib }:

let
  base = lib.systems.examples.sheevaplug;
in base // {
  tomtom = {
    name = "tomtom";

    #platform = platforms.sheevaplug;
    kernelMajor = "2.6";
    kernelBaseConfig = "multi_v5_defconfig";
    kernelArch = "arm";
    kernelAutoModules = false;
    kernelExtraConfig = ''
      BLK_DEV_RAM y
      BLK_DEV_INITRD y
      BLK_DEV_CRYPTOLOOP m
      BLK_DEV_DM m
      DM_CRYPT m
      MD y
      REISERFS_FS m
      BTRFS_FS m
      XFS_FS m
      JFS_FS m
      EXT4_FS m
      USB_STORAGE_CYPRESS_ATACB m

      # mv cesa requires this sw fallback, for mv-sha1
      CRYPTO_SHA1 y
      # Fast crypto
      CRYPTO_TWOFISH y
      CRYPTO_TWOFISH_COMMON y
      CRYPTO_BLOWFISH y
      CRYPTO_BLOWFISH_COMMON y

      IP_PNP y
      IP_PNP_DHCP y
      NFS_FS y
      ROOT_NFS y
      TUN m
      NFS_V4 y
      NFS_V4_1 y
      NFS_FSCACHE y
      NFSD m
      NFSD_V2_ACL y
      NFSD_V3 y
      NFSD_V3_ACL y
      NFSD_V4 y
      NETFILTER y
      IP_NF_IPTABLES y
      IP_NF_FILTER y
      IP_NF_MATCH_ADDRTYPE y
      IP_NF_TARGET_LOG y
      IP_NF_MANGLE y
      IPV6 m
      VLAN_8021Q m

      CIFS y
      CIFS_XATTR y
      CIFS_POSIX y
      CIFS_FSCACHE y
      CIFS_ACL y

      WATCHDOG y
      WATCHDOG_CORE y
      ORION_WATCHDOG m

      ZRAM m
      NETCONSOLE m

      # Disable OABI to have seccomp_filter (required for systemd)
      # https://github.com/raspberrypi/firmware/issues/651
      OABI_COMPAT n

      # Fail to build
      DRM n
      SCSI_ADVANSYS n
      USB_ISP1362_HCD n
      SND_SOC n
      SND_ALI5451 n
      FB_SAVAGE n
      SCSI_NSP32 n
      ATA_SFF n
      SUNGEM n
      IRDA n
      ATM_HE n
      SCSI_ACARD n
      BLK_DEV_CMD640_ENHANCED n

      FUSE_FS m

      # systemd uses cgroups
      CGROUPS y

      # Latencytop
      LATENCYTOP y

      # Ubi for the mtd
      MTD_UBI y
      UBIFS_FS y
      UBIFS_FS_XATTR y
      UBIFS_FS_ADVANCED_COMPR y
      UBIFS_FS_LZO y
      UBIFS_FS_ZLIB y
      UBIFS_FS_DEBUG n

      # Kdb, for kernel troubles
      KGDB y
      KGDB_SERIAL_CONSOLE y
      KGDB_KDB y
    '';
    #kernelMakeFlags = [ "LOADADDR=0x0200000" ];
    kernelTarget = "zImage";
    #kernelDTB = true; # Beyond 3.10
    gcc = {
      arch = "armv5te";
    };
  };
}
