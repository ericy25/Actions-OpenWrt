#!/bin/bash
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall2.git package/passwall2

./scripts/feeds update -a
./scripts/feeds install -a

echo "CONFIG_PACKAGE_luci-app-passwall2=y" >> .config
echo "CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y" >> .config
echo "CONFIG_TARGET_ROOTFS_EXT4=y" >> .config
echo "CONFIG_TARGET_ROOTFS_SQUASHFS=n" >> .config

# === 关键：释放磁盘空间 ===
rm -rf /tmp/*
rm -rf build_dir/target-*/linux-*/root.*
rm -rf staging_dir/target-*/root-*
rm -rf build_dir/target-*/linux-*/feeds
