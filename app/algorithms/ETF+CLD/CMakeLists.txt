CMAKE_MINIMUM_REQUIRED(VERSION 3.10)

PROJECT(Coherent-Line-Drawing)
FIND_PACKAGE(OpenCV REQUIRED)
FIND_PACKAGE(Boost COMPONENTS program_options REQUIRED)

INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR})

SET(DEFAULT_BUILD_TYPE "Release")
SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})

    MESSAGE( STATUS "Boost_INCLUDE_DIRS = ${Boost_INCLUDE_DIRS}.")
    MESSAGE( STATUS "Boost_LIBRARIES = ${Boost_LIBRARIES}.")
    MESSAGE( STATUS "Boost_LIB_VERSION = ${Boost_LIB_VERSION}.")
endif()
ADD_EXECUTABLE(cld
            "${PROJECT_SOURCE_DIR}/src/cmd.cpp"
            "${PROJECT_SOURCE_DIR}/src/ETF.cpp"
            "${PROJECT_SOURCE_DIR}/src/CLD.cpp"
            "${PROJECT_SOURCE_DIR}/src/postProcessing.cpp"
            "${PROJECT_SOURCE_DIR}/include/ETF.h"
            "${PROJECT_SOURCE_DIR}/include/CLD.h"
            "${PROJECT_SOURCE_DIR}/include/postProcessing.h"
            )

TARGET_LINK_LIBRARIES(cld ${OpenCV_LIBS} ${Boost_LIBRARIES})





