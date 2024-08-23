################################################################################
#
# ramspeed
#
################################################################################
HPMICRO_LOADER_VERSION = 5acfbb3dd810b56ea1e7837b00660c79d8975d9a
HPMICRO_LOADER_SITE = https://github.com/xuzihan351/opensbi_loader.git
HPMICRO_LOADER_SITE_METHOD = git
HPMICRO_LOADER_GIT_SUBMODULES = YES

HPMICRO_LOADER_INSTALL_IMAGES = YES

define HPMICRO_LOADER_BUILD_CMDS
	cd $(@D) && \
	HPM_SDK_BASE=$(@D)/hpm_sdk HPM_SDK_TOOLCHAIN_VARIANT=gcc cmake -GNinja -DBOARD=$(BR2_TARGET_HPMICRO_BOARD_NAME) -DHPM_BUILD_TYPE=flash_xip -DCMAKE_BUILD_TYPE=debug $(@D) -Bbuild && \
	ninja -C build
endef

define HPMICRO_LOADER_INSTALL_TARGET_CMDS
	dd if=/dev/zero of=$(@D)/build/output/temp.bin bs=1 count=1024
	cat $(@D)/build/output/temp.bin $(@D)/build/output/demo.bin > $(@D)/build/output/opensbiloader.bin
	$(INSTALL) -D -m 0644 $(@D)/build/output/opensbiloader.bin $(BINARIES_DIR)/opensbiloader.bin
endef

$(eval $(generic-package))
