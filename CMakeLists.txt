cmake_minimum_required(VERSION 3.26)

project("CudaOpenCV")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(DEPENDENCIES_DIR "${CMAKE_SOURCE_DIR}/dependencies")

set(OPENCV_INSTALL_DIR "${DEPENDENCIES_DIR}/opencv_build/install")

file(GLOB_RECURSE HEADERS CMAKE_CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/include/*.h")
file(GLOB_RECURSE SOURCES CMAKE_CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/src/*.cpp")

add_executable(${PROJECT_NAME} ${HEADERS} ${SOURCES})

target_compile_definitions(${PROJECT_NAME} PRIVATE RESOURCES_PATH="${CMAKE_SOURCE_DIR}/resources/")

target_include_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_SOURCE_DIR}/include"
    "${OPENCV_INSTALL_DIR}/include"
)

target_link_libraries(${PROJECT_NAME} PRIVATE "${OPENCV_INSTALL_DIR}/x64/vc17/lib/opencv_world4100.lib")

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    "${OPENCV_INSTALL_DIR}/x64/vc17/bin" "$<TARGET_FILE_DIR:${PROJECT_NAME}>"
)
