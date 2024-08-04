################################################################################
#
# rustsbi-hpm
#
################################################################################

RUSTSBI_HPM_VERSION = 4637e866fd38882dca4a17790fdffe1c9e687b8d
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
