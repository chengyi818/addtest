include $(TOPDIR)/rules.mk

PKG_NAME:=addtest
PKG_VERSION=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/addtest
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Addtest--print something to /var/addtest
endef

define Package/addtest/description
	It's a test,print something to /var/addtest cyclicaliy
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/addtest/postinst
#!/bin/sh
rm -rf /tmp/luci*
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/$(PKG_NAME)/install
	$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN)  $(PKG_BUILD_DIR)/addtest  $(1)/bin
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
