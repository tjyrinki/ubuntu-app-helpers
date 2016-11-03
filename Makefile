#!/usr/bin/make -f

FLAVOR ?= qt5
SRC_DIR ?= .

DEST_LAUNCHER = ubuntu-app-launch

arch_triplet := $(shell dpkg-architecture -q DEB_TARGET_MULTIARCH)


build: $(DEST_LAUNCHER)

clean:
	rm -f $(DEST_LAUNCHER)

ubuntu-app-launch:
	@echo "#!/bin/bash" > $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/desktop-exports >> $(DEST_LAUNCHER)
	@cat $(SRC_DIR)/launcher-specific >> $(DEST_LAUNCHER)
		
install: ubuntu-app-launch
	install -D -m755 $(DEST_LAUNCHER) $(DESTDIR)/bin/$(DEST_LAUNCHER)

