cmake_minimum_required(VERSION 2.14)

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)
set(CMAKE_TOOLCHAIN_FILE "D:\\programs\\vcpkg\\scripts\\buildsystems\\vcpkg.cmake")

set(CMAKE_GENERATOR_PLATFORM "x64")
project(renderer CUDA CXX)

find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

add_library(renderer STATIC renderer.cpp renderer.h)
target_link_libraries(
    renderer 
    PUBLIC ${OPENGL_LIBRARIES} 
    PUBLIC GLEW::GLEW
    PUBLIC ${glfw3_LIBRARIES} 
    PRIVATE ${glm_LIBRARIES}
)