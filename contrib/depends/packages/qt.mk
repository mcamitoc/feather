package=qt
$(package)_version=6.5.0-beta2
$(package)_download_path=https://download.qt.io/development_releases/qt/6.5/$($(package)_version)/submodules
$(package)_suffix=everywhere-src-$($(package)_version).tar.xz
$(package)_file_name=qtbase-$($(package)_suffix)
$(package)_sha256_hash=15f7af35c1cfb7a4cf6103879d61aa5e682f4ed577bb0bb73c56f0d927208a15
$(package)_darwin_dependencies=native_cctools native_qt openssl
$(package)_mingw32_dependencies=openssl native_cmake native_qt native_libxkbcommon
$(package)_linux_dependencies=openssl native_qt freetype fontconfig libxcb libxkbcommon libxcb_util libxcb_util_render libxcb_util_keysyms libxcb_util_image libxcb_util_wm libxcb_util_cursor
$(package)_qt_libs=corelib network widgets gui plugins testlib
$(package)_linguist_tools = lrelease lupdate lconvert
$(package)_patches  = aarch64Toolchain.cmake
$(package)_patches += dont_hardcode_pwd.patch
$(package)_patches += fast_fixed_dtoa_no_optimize.patch
$(package)_patches += gnueabihfToolchain.cmake
$(package)_patches += guix_cross_lib_path.patch
$(package)_patches += MacToolchain.cmake
$(package)_patches += no_pthread_cond_clockwait.patch
$(package)_patches += no-renameat2.patch
$(package)_patches += no-statx.patch
$(package)_patches += no_wraprt_on_apple.patch
$(package)_patches += qtbase-moc-ignore-gcc-macro.patch
$(package)_patches += qtmultimedia-fixes.patch
$(package)_patches += rcc_hardcode_timestamp.patch
$(package)_patches += root_CMakeLists.txt
$(package)_patches += v4l2.patch
$(package)_patches += windows_func_fix.patch
$(package)_patches += WindowsToolchain.cmake

$(package)_qttranslations_file_name=qttranslations-$($(package)_suffix)
$(package)_qttranslations_sha256_hash=a18dab61430ce487e82c63bfa5f730f217646e90ef74e220d1e4b75829653d58

$(package)_qttools_file_name=qttools-$($(package)_suffix)
$(package)_qttools_sha256_hash=c1dcb509c37e61971a8b2c1cde2bf7efafa43d92209d3d144a983019dbfb9ab6

$(package)_qtsvg_file_name=qtsvg-$($(package)_suffix)
$(package)_qtsvg_sha256_hash=c13fcefa9a23813cd9546d07e59c044c9d7e6081a4b7eaa911ed72ae7a7cce7f

$(package)_qtwebsockets_file_name=qtwebsockets-$($(package)_suffix)
$(package)_qtwebsockets_sha256_hash=5d8ea552cc524e4fed0b5e0ac0c335c3346405c7fbc1cd9a7915b2e484f84738

$(package)_qtmultimedia_file_name=qtmultimedia-$($(package)_suffix)
$(package)_qtmultimedia_sha256_hash=7a323953de91ff87c1231733002033d25676a388e3bab82b058ed15ae8563a83

$(package)_qtshadertools_file_name=qtshadertools-$($(package)_suffix)
$(package)_qtshadertools_sha256_hash=511f4cbcf3b394b5218f23c56211f6fb4083806be052a4023707654440ae7d39

$(package)_extra_sources  = $($(package)_qttranslations_file_name)
$(package)_extra_sources += $($(package)_qttools_file_name)
$(package)_extra_sources += $($(package)_qtsvg_file_name)
$(package)_extra_sources += $($(package)_qtwebsockets_file_name)
$(package)_extra_sources += $($(package)_qtmultimedia_file_name)
$(package)_extra_sources += $($(package)_qtshadertools_file_name)

define $(package)_set_vars
$(package)_config_opts_release = -release
$(package)_config_opts_debug = -debug
$(package)_config_opts_debug += -optimized-tools
$(package)_config_opts += -libexecdir $(build_prefix)/bin
$(package)_config_opts += -confirm-license
$(package)_config_opts += -no-cups
$(package)_config_opts += -no-egl
$(package)_config_opts += -no-eglfs
$(package)_config_opts += -no-evdev
$(package)_config_opts += -no-gif
$(package)_config_opts += -no-glib
$(package)_config_opts += -no-icu
$(package)_config_opts += -no-ico
$(package)_config_opts += -no-kms
$(package)_config_opts += -no-linuxfb
#$(package)_config_opts += -no-libjpeg # Needed
#$(package)_config_opts += -no-libproxy # Needed
$(package)_config_opts += -no-libudev
$(package)_config_opts += -no-mtdev
$(package)_config_opts += -no-openssl # Needed
$(package)_config_opts += -openssl-linked
$(package)_config_opts += -no-openvg
$(package)_config_opts += -no-reduce-relocations
$(package)_config_opts += -no-schannel
$(package)_config_opts += -no-sctp
$(package)_config_opts += -no-securetransport
$(package)_config_opts += -no-system-proxies
$(package)_config_opts += -no-use-gold-linker
$(package)_config_opts += -no-zstd
$(package)_config_opts += -nomake examples
$(package)_config_opts += -nomake tests
$(package)_config_opts += -opensource
$(package)_config_opts += -pkg-config
$(package)_config_opts += -prefix $(host_prefix)
$(package)_config_opts += -qt-libpng
$(package)_config_opts += -qt-pcre
$(package)_config_opts += -qt-harfbuzz
$(package)_config_opts += -qt-zlib
$(package)_config_opts += -static
$(package)_config_opts += -no-feature-colordialog
#$(package)_config_opts += -no-feature-concurrent # Needed
$(package)_config_opts += -no-feature-dial
$(package)_config_opts += -no-feature-fontcombobox
#$(package)_config_opts += -no-feature-http # Needed
$(package)_config_opts += -no-feature-image_heuristic_mask
$(package)_config_opts += -no-feature-keysequenceedit
$(package)_config_opts += -no-feature-lcdnumber
$(package)_config_opts += -no-feature-networkdiskcache
#$(package)_config_opts += -no-feature-networkproxy # Needed
$(package)_config_opts += -no-feature-pdf
$(package)_config_opts += -no-feature-printdialog
$(package)_config_opts += -no-feature-printer
$(package)_config_opts += -no-feature-printpreviewdialog
$(package)_config_opts += -no-feature-printpreviewwidget
$(package)_config_opts += -no-feature-printsupport
$(package)_config_opts += -no-feature-sessionmanager
#$(package)_config_opts += -no-feature-socks5 # Needed
$(package)_config_opts += -no-feature-sql
$(package)_config_opts += -no-feature-syntaxhighlighter
#$(package)_config_opts += -no-feature-textbrowser # Needed
$(package)_config_opts += -no-feature-textmarkdownwriter
$(package)_config_opts += -no-feature-textodfwriter
$(package)_config_opts += -no-feature-topleveldomain
#$(package)_config_opts += -no-feature-udpsocket # Neede
$(package)_config_opts += -no-feature-undocommand
$(package)_config_opts += -no-feature-undogroup
$(package)_config_opts += -no-feature-undostack
$(package)_config_opts += -no-feature-undoview
$(package)_config_opts += -no-feature-vnc
#$(package)_config_opts += -no-feature-wizard # Needed

$(package)_config_opts_darwin = -no-dbus
$(package)_config_opts_darwin += -no-pch
$(package)_config_opts_darwin += -no-freetype
$(package)_config_opts_darwin += QMAKE_MACOSX_DEPLOYMENT_TARGET=$(OSX_MIN_VERSION)

ifneq ($(build_os),darwin)
$(package)_config_opts_darwin += -xplatform macx-clang
$(package)_config_opts_darwin += -device-option MAC_SDK_PATH=$(OSX_SDK)
$(package)_config_opts_darwin += -device-option MAC_SDK_VERSION=$(OSX_SDK_VERSION)
$(package)_config_opts_darwin += -device-option CROSS_COMPILE="$(host)-"
$(package)_config_opts_darwin += -device-option MAC_TARGET=$(host)
$(package)_config_opts_darwin += -device-option XCODE_VERSION=$(XCODE_VERSION)
$(package)_config_opts_darwin += -qt-host-path $(build_prefix)/qt-host
endif

ifneq ($(build_arch),$(host_arch))
$(package)_config_opts_aarch64_darwin += -device-option QMAKE_APPLE_DEVICE_ARCHS=arm64
$(package)_config_opts_x86_64_darwin += -device-option QMAKE_APPLE_DEVICE_ARCHS=x86_64
endif

$(package)_config_opts_darwin += -no-feature-ffmpeg
$(package)_config_opts_darwin += -- -DCMAKE_TOOLCHAIN_FILE=MacToolchain.cmake -DCMAKE_LIBRARY_PATH=$(HOME)/.guix-profile/lib

$(package)_config_opts_linux = -xcb
$(package)_config_opts_linux += -no-xcb-xlib
$(package)_config_opts_linux += -no-feature-xlib
#$(package)_config_opts_linux += -feature-ffmpeg
#$(package)_config_opts_linux += -feature-pulseaudio

# https://bugreports.qt.io/browse/QTBUG-99957
$(package)_config_opts_linux += -no-pch

$(package)_config_opts_linux += -system-freetype
$(package)_config_opts_linux += -fontconfig
$(package)_config_opts_linux += -no-opengl
$(package)_config_opts_linux += -no-feature-vulkan
$(package)_config_opts_linux += -dbus-runtime
ifneq ($(LTO),)
$(package)_config_opts_linux += -ltcg
endif
$(package)_config_opts_linux += -platform linux-g++ -xplatform linux-g++
ifneq (,$(findstring -stdlib=libc++,$($(1)_cxx)))
$(package)_config_opts_x86_64_linux = -xplatform linux-clang-libc++
endif

$(package)_config_opts_arm_linux += -qt-host-path $(build_prefix)/qt-host
$(package)_config_opts_arm_linux += -- -DCMAKE_TOOLCHAIN_FILE=gnueabihfToolchain.cmake -DCMAKE_LIBRARY_PATH=$(HOME)/.guix-profile/lib

$(package)_config_opts_aarch64_linux += -qt-host-path $(build_prefix)/qt-host
$(package)_config_opts_aarch64_linux += -- -DCMAKE_TOOLCHAIN_FILE=aarch64Toolchain.cmake -DCMAKE_LIBRARY_PATH=$(HOME)/.guix-profile/lib

$(package)_config_opts_mingw32 += -no-opengl
$(package)_config_opts_mingw32 += -no-dbus
$(package)_config_opts_mingw32 += -no-freetype
$(package)_config_opts_mingw32 += -xplatform win32-g++
$(package)_config_opts_mingw32 += -device-option CROSS_COMPILE="$(host)-"
$(package)_config_opts_mingw32 += -pch
$(package)_config_opts_mingw32 += -qt-host-path $(build_prefix)/qt-host
$(package)_config_opts_mingw32 += -no-feature-ffmpeg
$(package)_config_opts_mingw32 += -wmf
$(package)_config_opts_mingw32 += -- -DCMAKE_TOOLCHAIN_FILE=WindowsToolchain.cmake -DCMAKE_LIBRARY_PATH=$(HOME)/.guix-profile/lib

$(package)_config_opts_android = -xplatform android-clang
$(package)_config_opts_android += -android-sdk $(ANDROID_SDK)
$(package)_config_opts_android += -android-ndk $(ANDROID_NDK)
$(package)_config_opts_android += -android-ndk-platform android-$(ANDROID_API_LEVEL)
$(package)_config_opts_android += -egl
$(package)_config_opts_android += -no-dbus
$(package)_config_opts_android += -opengl es2
$(package)_config_opts_android += -qt-freetype
$(package)_config_opts_android += -no-fontconfig
$(package)_config_opts_android += -L $(host_prefix)/lib
$(package)_config_opts_android += -I $(host_prefix)/include
$(package)_config_opts_android += -pch
$(package)_config_opts_android += -no-feature-vulkan

$(package)_config_opts_aarch64_android += -android-arch arm64-v8a
$(package)_config_opts_armv7a_android += -android-arch armeabi-v7a
$(package)_config_opts_x86_64_android += -android-arch x86_64

$(package)_openssl_flags_$(host_os)="-lssl -lcrypto -lpthread -ldl"
$(package)_openssl_flags_mingw32="-lssl -lcrypto -lws2_32"
endef

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttranslations_file_name),$($(package)_qttranslations_file_name),$($(package)_qttranslations_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttools_file_name),$($(package)_qttools_file_name),$($(package)_qttools_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtsvg_file_name),$($(package)_qtsvg_file_name),$($(package)_qtsvg_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtwebsockets_file_name),$($(package)_qtwebsockets_file_name),$($(package)_qtwebsockets_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtmultimedia_file_name),$($(package)_qtmultimedia_file_name),$($(package)_qtmultimedia_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qtshadertools_file_name),$($(package)_qtshadertools_file_name),$($(package)_qtshadertools_sha256_hash))
endef

define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttranslations_sha256_hash)  $($(package)_source_dir)/$($(package)_qttranslations_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttools_sha256_hash)  $($(package)_source_dir)/$($(package)_qttools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtsvg_sha256_hash)  $($(package)_source_dir)/$($(package)_qtsvg_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtwebsockets_sha256_hash)  $($(package)_source_dir)/$($(package)_qtwebsockets_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtmultimedia_sha256_hash)  $($(package)_source_dir)/$($(package)_qtmultimedia_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qtshadertools_sha256_hash)  $($(package)_source_dir)/$($(package)_qtshadertools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir qtbase && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source) -C qtbase && \
  mkdir qttranslations && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttranslations_file_name) -C qttranslations && \
  mkdir qttools && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttools_file_name) -C qttools && \
  mkdir qtsvg && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtsvg_file_name) -C qtsvg && \
  mkdir qtwebsockets && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtwebsockets_file_name) -C qtwebsockets && \
  mkdir qtmultimedia && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtmultimedia_file_name) -C qtmultimedia && \
  mkdir qtshadertools && \
  $(build_TAR) --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qtshadertools_file_name) -C qtshadertools
endef

define $(package)_preprocess_cmds
  cp $($(package)_patch_dir)/root_CMakeLists.txt CMakeLists.txt && \
  patch -p1 -i $($(package)_patch_dir)/dont_hardcode_pwd.patch && \
  patch -p1 -i $($(package)_patch_dir)/qtbase-moc-ignore-gcc-macro.patch && \
  patch -p1 -i $($(package)_patch_dir)/rcc_hardcode_timestamp.patch && \
  patch -p1 -i $($(package)_patch_dir)/fast_fixed_dtoa_no_optimize.patch && \
  patch -p1 -i $($(package)_patch_dir)/guix_cross_lib_path.patch && \
  patch -p1 -i $($(package)_patch_dir)/no-statx.patch && \
  patch -p1 -i $($(package)_patch_dir)/no-renameat2.patch && \
  patch -p1 -i $($(package)_patch_dir)/no_pthread_cond_clockwait.patch && \
  patch -p1 -i $($(package)_patch_dir)/windows_func_fix.patch && \
  patch -p1 -i $($(package)_patch_dir)/no_wraprt_on_apple.patch && \
  mv $($(package)_patch_dir)/WindowsToolchain.cmake . && \
  mv $($(package)_patch_dir)/MacToolchain.cmake . && \
  mv $($(package)_patch_dir)/aarch64Toolchain.cmake . && \
  mv $($(package)_patch_dir)/gnueabihfToolchain.cmake . && \
  cd qtmultimedia && \
  patch -p1 -i $($(package)_patch_dir)/qtmultimedia-fixes.patch && \
  patch -p1 -i $($(package)_patch_dir)/v4l2.patch
endef

# TODO: this is a mess, but i'm tired of rebuilding Qt so it is what it is
# TODO: find a better way to make WMF libraries available to Qt without polluting the environment
ifeq ($(host_os),darwin)
define $(package)_config_cmds
  export OPENSSL_LIBS=${$(package)_openssl_flags_$(host_os)} \
  export PKG_CONFIG_SYSROOT_DIR=/ && \
  export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
  export QT_MAC_SDK_NO_VERSION_CHECK=1 && \
  cd qtbase && \
  env -u C_INCLUDE_PATH -u CPLUS_INCLUDE_PATH -u OBJC_INCLUDE_PATH -u OBJCPLUS_INCLUDE_PATH -u CPATH -u LIBRARY_PATH ./configure -top-level $($(package)_config_opts) -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
endef
else ifeq ($(host_os),mingw32)
define $(package)_config_cmds
  cp $(HOME)/.guix-profile/lib/libstrmiids.a \
     $(HOME)/.guix-profile/lib/libamstrmid.a \
     $(HOME)/.guix-profile/lib/libdmoguids.a \
     $(HOME)/.guix-profile/lib/libuuid.a \
     $(HOME)/.guix-profile/lib/libmsdmo.a \
     $(HOME)/.guix-profile/lib/libole32.a \
     $(HOME)/.guix-profile/lib/liboleaut32.a \
     $(HOME)/.guix-profile/lib/libmf.a \
     $(HOME)/.guix-profile/lib/libmfuuid.a \
     $(HOME)/.guix-profile/lib/libmfplat.a \
     $(HOME)/.guix-profile/lib/libmfcore.a \
     $(HOME)/.guix-profile/lib/libpropsys.a \
     /feather/contrib/depends/x86_64-w64-mingw32/lib/ && \
   export OPENSSL_LIBS=${$(package)_openssl_flags_$(host_os)} \
   export PKG_CONFIG_SYSROOT_DIR=/ && \
   export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
   export QT_MAC_SDK_NO_VERSION_CHECK=1 && \
   export V=1 && \
   export VERBOSE=1 && \
   cd qtbase && \
  ./configure -top-level $($(package)_config_opts) -DCMAKE_LIBRARY_PATH=$(HOME)/.guix-profile/lib --debug-find-pkg=WMF -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
endef
else
define $(package)_config_cmds
  export OPENSSL_LIBS=${$(package)_openssl_flags_$(host_os)} \
  export PKG_CONFIG_SYSROOT_DIR=/ && \
  export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
  export QT_MAC_SDK_NO_VERSION_CHECK=1 && \
  cd qtbase && \
  ./configure -top-level $($(package)_config_opts)
endef
endif

ifeq ($(host_os),darwin)
define $(package)_build_cmds
  export LD_LIBRARY_PATH=${build_prefix}/lib/ && \
  env -u C_INCLUDE_PATH -u CPLUS_INCLUDE_PATH -u OBJC_INCLUDE_PATH -u OBJCPLUS_INCLUDE_PATH -u CPATH -u LIBRARY_PATH  $(MAKE)
endef
else ifeq ($(host_os),mingw32)
define $(package)_build_cmds
  export LD_LIBRARY_PATH=${build_prefix}/lib/ && \
  $(MAKE)
endef
else ifneq (,$(findstring x86_64,$(HOST)))
define $(package)_build_cmds
  export LD_LIBRARY_PATH=${host_prefix}/lib/ && \
  cmake --build . --target syncqt_build && \
  $(MAKE)
endef
else
define $(package)_build_cmds
  export LD_LIBRARY_PATH=${build_prefix}/lib/ && \
  $(MAKE)
endef
endif

define $(package)_stage_cmds
  DESTDIR=$($(package)_staging_dir) cmake --install .
endef
