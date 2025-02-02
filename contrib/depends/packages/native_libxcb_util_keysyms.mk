package=native_libxcb_util_keysyms
$(package)_version=0.4.0
$(package)_download_path=https://xcb.freedesktop.org/dist
$(package)_file_name=xcb-util-keysyms-$($(package)_version).tar.bz2
$(package)_sha256_hash=0ef8490ff1dede52b7de533158547f8b454b241aa3e4dcca369507f66f216dd9
$(package)_dependencies=native_libxcb native_xproto

define $(package)_set_vars
$(package)_config_opts=--disable-static --disable-devel-docs --without-doxygen
$(package)_config_opts += --disable-dependency-tracking --enable-option-checking
endef

define $(package)_preprocess_cmds
  cp -f $(BASEDIR)/config.guess $(BASEDIR)/config.sub .
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef

define $(package)_postprocess_cmds
  rm -rf share/man share/doc lib/*.la
endef
