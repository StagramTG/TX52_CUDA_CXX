cmake_minimum_required(VERSION "3.14")

# VC Package
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)
set(CMAKE_TOOLCHAIN_FILE "D:/programs/vcpkg/scripts/buildsystems/vcpkg.cmake")

# Set 64bit plateform
set(CMAKE_GENERATOR_PLATFORM "x64")

# Setup the project with used languages
project("TX_52_CUDA" CXX)

# Find libs
find_package(OpenGL REQUIRED)
find_package(GLEW REQUIRED)
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)

add_subdirectory(renderer)
add_subdirectory(processor)

# Setup executable
add_executable("${PROJECT_NAME}" main.cpp)
# Link libs
target_link_libraries(
    "${PROJECT_NAME}" 
    ${OPENGL_LIBRARIES} GLEW::GLEW ${glfw3_LIBRARIES} ${glm_LIBRARIES} renderer processor
)