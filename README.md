# Buildroot for HPMicro MCUs

[![Build](https://github.com/hpm-rs/buildroot/actions/workflows/build.yml/badge.svg)](https://github.com/hpm-rs/buildroot/actions/workflows/build.yml)

为 HPMicro MCUs 生成可启动的 Linux 镜像。

**考虑到 Buildroot 编译一次耗时过长，提供了 pre-built 镜像，可在最新的 [CI 构建](https://github.com/hpm-rs/buildroot/actions/workflows/build.yml) 中下载。**

如果你想在本地环境编译，请参考下列说明。

## 获取源码

```shell
git clone https://github.com/hpm-rs/buildroot.git
```

## 配置编译环境

### Ubuntu 22.04

```shell
sudo apt-get install bc bison build-essential flex libssl-dev unzip
```

## 编译

```shell
make hpmicro_hpm6360evk_defconfig
make all
```

## 烧录

生成的镜像路径为 `output/images/flash.img`。可使用 [hpm_isp](https://github.com/tfx2001/hpm_isp) 工具进行烧录。

修改启动模式选择管脚为 `BOOT_MODE[1:0]=0b10` 后将 USB0 连接至 PC，运行如下命令进行烧录。

```shell
hpm_isp flash 0 write 0x0 output/images/flash.img
```
