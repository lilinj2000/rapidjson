find_package(GTestSrc)

cmake_policy(SET CMP0015 NEW)

# IF(GTESTSRC_FOUND)
    enable_testing()

    if (WIN32 AND (NOT CYGWIN) AND (NOT MINGW))
        set(gtest_disable_pthreads ON)
        set(gtest_force_shared_crt ON)
    endif()

    # add_subdirectory(${GTEST_SOURCE_DIR} ${CMAKE_BINARY_DIR}/googletest)
    include_directories(SYSTEM ${GTEST_INCLUDE_DIR})
    link_directories(${GTEST_LIB_DIR})

    set(TEST_LIBRARIES gtest gtest_main -pthread)

    add_custom_target(tests ALL)
    add_subdirectory(perftest)
    add_subdirectory(unittest)

# ENDIF(GTESTSRC_FOUND)
