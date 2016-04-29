ifneq ($(filter yukon rhine shinano kanuti kitakami,$(PRODUCT_PLATFORM)),)

include $(call all-subdir-makefiles)

endif
