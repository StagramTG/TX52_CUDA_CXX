cmake_minimum_required(VERSION "2.14")

project(processor CUDA CXX)

add_library(processor STATIC processor.cu processor.h)