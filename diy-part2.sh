#!/bin/bash
# diy-part2.sh

# 克隆官方 PassWall2 仓库到 package 目录
git clone --depth=1 https://github.com/Openwrt-Passwall/openwrt-passwall2.git package/passwall2

# 安装依赖（可选，但建议）
./scripts/feeds update -a
./ scripts/feeds install -a

# 启用 PassWall2 及中文语言包
echo "CONFIG_PACKAGE_luci-app-passwall2=y" >> .config
echo "CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y" >> .config

# 确保输出 ext4 镜像（支持 16GB 自动扩容）
echo "CONFIG_TARGET_ROOTFS_EXT4=y" >> .config
echo "CONFIG_TARGET_ROOTFS_SQUASHFS=n" >> .config
