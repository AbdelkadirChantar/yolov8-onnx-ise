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