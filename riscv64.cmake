# Target platform
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

# Never try to run test executables when cross-compiling
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Toolchain location (Buildroot's)
set(BR_ROOT "/opt/soc/work/abdelkadir/cheshire/sw/deps/cva6-sdk/buildroot/output")
set(BR_HOST "${BR_ROOT}/host")
set(CMAKE_SYSROOT "${BR_ROOT}/staging")

# Buildroot's toolchain
set(TOOL_PREFIX "riscv64-buildroot-linux-gnu")
set(CMAKE_C_COMPILER   "${BR_HOST}/bin/${TOOL_PREFIX}-gcc")
set(CMAKE_CXX_COMPILER "${BR_HOST}/bin/${TOOL_PREFIX}-g++")
set(CMAKE_ASM_COMPILER "${BR_HOST}/bin/${TOOL_PREFIX}-gcc")
set(CMAKE_AR           "${BR_HOST}/bin/${TOOL_PREFIX}-ar")
set(CMAKE_NM           "${BR_HOST}/bin/${TOOL_PREFIX}-nm")
set(CMAKE_RANLIB       "${BR_HOST}/bin/${TOOL_PREFIX}-ranlib")
set(CMAKE_STRIP        "${BR_HOST}/bin/${TOOL_PREFIX}-strip")

# Compile flags 
set(CMAKE_C_FLAGS_INIT   "-march=rv64gc -mabi=lp64d")
set(CMAKE_CXX_FLAGS_INIT "-march=rv64gc -mabi=lp64d")

# Dynamic loader 
set(_LD_PATH "/lib64/ld-linux-riscv64-lp64d.so.1")

set(_BR_LIBDIR_TOOLCHAIN "${BR_HOST}/${TOOL_PREFIX}/lib64")
set(_BR_LIBDIR_SYSROOT   "${CMAKE_SYSROOT}/usr/lib64")

# Linker
set(_LINK_COMMON
  "-Wl,--dynamic-linker=${_LD_PATH} \
   -L${_BR_LIBDIR_TOOLCHAIN} -L${_BR_LIBDIR_SYSROOT} \
   -Wl,-rpath,${_BR_LIBDIR_TOOLCHAIN} -Wl,-rpath,${_BR_LIBDIR_SYSROOT} \
   -Wl,-rpath,/lib64 -Wl,-rpath,/usr/lib64 \
   -latomic -lpthread -ldl"
)

set(CMAKE_EXE_LINKER_FLAGS_INIT    "${_LINK_COMMON}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${_LINK_COMMON}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${_LINK_COMMON}")








#set(CMAKE_C_COMPILER   "/opt/soc/riscv64-linux/bin/riscv64-sys-gcc")
#set(CMAKE_CXX_COMPILER "/opt/soc/riscv64-linux/bin/riscv64-sys-g++")
#set(CMAKE_ASM_COMPILER "/opt/soc/riscv64-linux/bin/riscv64-sys-gcc")
#
#set(_LINK "-Wl,--dynamic-linker=/lib64/ld-linux-riscv64-lp64d.so.1 \
#           -Wl,-rpath,/lib64 -Wl,-rpath,/usr/lib64 \
#           -static-libstdc++=no -static-libgcc=no \
#           -latomic -lpthread")
#set(CMAKE_EXE_LINKER_FLAGS_INIT    "${_LINK}")
#set(CMAKE_SHARED_LINKER_FLAGS_INIT "${_LINK}")
#set(CMAKE_MODULE_LINKER_FLAGS_INIT "${_LINK}")
#
## iconv via glibc:
#set(Iconv_INCLUDE_DIR "/opt/soc/work/abdelkadir/cheshire/sw/deps/cva6-sdk/buildroot/output/staging/usr/include" CACHE PATH "" FORCE)
#set(Iconv_IS_BUILT_IN TRUE CACHE BOOL "" FORCE)
#set(Iconv_LIBRARY "c" CACHE STRING "" FORCE)
#set(Iconv_LIBRARIES "c" CACHE STRING "" FORCE)
#set(Iconv_FOUND TRUE CACHE BOOL "" FORCE)

#
# Your Buildroot sysroot (glibc-2.33)
#set(CMAKE_SYSROOT "/opt/soc/work/abdelkadir/cheshire/sw/cva6-sdk/buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot")
#
## Pick the toolchain that actually exists (adjust if yours is /opt/soc/riscv-linux)
## compilers
#set(CMAKE_C_COMPILER   "/opt/soc/riscv64-linux/bin/riscv64-sys-gcc")
#set(CMAKE_CXX_COMPILER "/opt/soc/riscv64-linux/bin/riscv64-sys-g++")
#set(CMAKE_ASM_COMPILER "/opt/soc/riscv64-linux/bin/riscv64-sys-gcc")
#
## ensure we never try to run test exes
#set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
#
## Make GCC use the sysroot for headers & libs
#set(CMAKE_C_FLAGS_INIT   "--sysroot=${CMAKE_SYSROOT} -march=rv64gc -mabi=lp64d")
#set(CMAKE_CXX_FLAGS_INIT "--sysroot=${CMAKE_SYSROOT} -march=rv64gc -mabi=lp64d")
#set(CMAKE_ASM_FLAGS_INIT "--sysroot=${CMAKE_SYSROOT} -march=rv64gc -mabi=lp64d")
#
## Linker flags (keep your previous ones + -latomic)
#set(CMAKE_EXE_LINKER_FLAGS_INIT
#    "-Wl,--dynamic-linker=/lib64/ld-linux-riscv64-lp64d.so.1 \
#     -Wl,-rpath,/lib64 -Wl,-rpath,/usr/lib64 \
#     -static-libstdc++ -static-libgcc -latomic")
#set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT}")
#set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS_INIT}")
#
## Find logic through sysroot
#set(CMAKE_FIND_ROOT_PATH "${CMAKE_SYSROOT}")
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
#set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
#
#set(Iconv_INCLUDE_DIR "/opt/soc/work/abdelkadir/cheshire/sw/cva6-sdk/buildroot/output/host/riscv64-buildroot-linux-gnu/sysroot/usr/include" CACHE PATH "")
#set(Iconv_IS_BUILT_IN ON CACHE BOOL "")
#set(Iconv_FOUND ON CACHE BOOL "")
#
## --- force iconv detection for glibc-based sysroot ---
#set(Iconv_LIBRARY "c" CACHE STRING "")
#set(Iconv_LIBRARIES "c" CACHE STRING "")
#set(Iconv_LIB_FOUND TRUE CACHE BOOL "")
#set(Iconv_IS_BUILT_IN TRUE CACHE BOOL "")
#set(Iconv_FOUND TRUE CACHE BOOL "")