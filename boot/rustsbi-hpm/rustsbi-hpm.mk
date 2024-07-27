################################################################################
#
# rustsbi-hpm
#
################################################################################

RUSTSBI_HPM_VERSION = d2ffb6d76a59f2aaf8a64de1602164cffd62b77a
RUSTSBI_HPM_SITE = $(call github,rustsbi,rustsbi-hpm,$(RUSTSBI_HPM_VERSION))

RUSTSBI_HPM_INSTALL_IMAGES = YES

define RUSTSBI_HPM_BUILD_CMDS
	cd $(RUSTSBI_HPM_SRCDIR) && \
	cargo build --features flash --release && \
	cargo objcopy --features flash --release -- -O binary $(@D)/rustsbi.bin
endef

define RUSTSBI_HPM_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/rustsbi.bin $(BINARIES_DIR)/rustsbi.bin
endef

$(eval $(generic-package))
