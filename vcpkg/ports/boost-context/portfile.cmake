# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/context
    REF boost-1.83.0
    SHA512 726d54231de62eb5a30331ff21c334f6fd88a70ec35904315753c695c8470f38904ed65cf468015ef2284901080df17fab28db68a028c6cfe7ef0e3d0cc7545d
    HEAD_REF master
)

vcpkg_replace_string("${SOURCE_PATH}/build/Jamfile.v2"
    "import ../../config/checks/config"
    "import ../config/checks/config"
)
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/config")
include(${CURRENT_HOST_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
configure_file(
    "${CMAKE_CURRENT_LIST_DIR}/b2-options.cmake.in"
    "${CURRENT_BUILDTREES_DIR}/vcpkg-b2-options.cmake"
    @ONLY
)
boost_modular_build(
    SOURCE_PATH ${SOURCE_PATH}
    BOOST_CMAKE_FRAGMENT "${CURRENT_BUILDTREES_DIR}/vcpkg-b2-options.cmake"
)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
