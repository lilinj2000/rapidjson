
SET(GTEST_SEARCH_PATH
    "${GTEST_SOURCE_DIR}"
    "${CMAKE_CURRENT_LIST_DIR}/../thirdparty/gtest/googletest"
    "~/3rd/googletest")

IF(UNIX)
    IF(RAPIDJSON_BUILD_THIRDPARTY_GTEST)
        LIST(APPEND GTEST_SEARCH_PATH "/usr/src/gtest")
    ELSE()
        LIST(INSERT GTEST_SEARCH_PATH 1 "/usr/src/gtest")
    ENDIF()
ENDIF()

# FIND_PATH(GTEST_SOURCE_DIR
#     NAMES CMakeLists.txt src/gtest_main.cc
#     PATHS ${GTEST_SEARCH_PATH})


# Debian installs gtest include directory in /usr/include, thus need to look
# for include directory separately from source directory.
FIND_PATH(GTEST_INCLUDE_DIR
    NAMES gtest/gtest.h
    PATH_SUFFIXES include
    # HINTS ${GTEST_SOURCE_DIR}
    PATHS ${GTEST_SEARCH_PATH})

FIND_PATH(GTEST_LIB_DIR
    NAMES libgtest.a libgtest_main.a
    PATH_SUFFIXES lib
    # HINTS ${GTEST_SOURCE_DIR}
    PATHS ${GTEST_SEARCH_PATH})

# INCLUDE(FindPackageHandleStandardArgs)
# find_package_handle_standard_args(GTestSrc DEFAULT_MSG
#     GTEST_SOURCE_DIR
#     GTEST_INCLUDE_DIR)
