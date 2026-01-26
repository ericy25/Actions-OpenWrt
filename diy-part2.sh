#!/bin/bash
# 在 feeds.conf.default 末尾添加 passwall 源
echo "src/gz passwall https://github.com/sbwml/immortalwrt-passwall/releases/download/openwrt-23.05/x86_64" >> "feeds.conf.default"

# 更新并安装
./scripts/feeds update -a
./scripts/feeds install -a -p passwall

# 启用 PassWall2 和中文
echo "CONFIG_PACKAGE_luci-app-passwall2=y" >> .config
echo "CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y" >> .config

# 确保输出 ext4 镜像（支持扩容）
echo "CONFIG_TARGET_ROOTFS_EXT4=y" >> .config
echo "CONFIG_TARGET_ROOTFS_SQUASHFS=n" >> .config
