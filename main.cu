/* main.cu */
#include <iostream>
#include "renderer/renderer.h"
#include "processor/processor.h"

__global__
void swap(int& px, int& py)
{
    int tmp = px;
    px = py;
    py = tmp;
}

int main()
{
    int* x;
    int* y;

    cudaMallocManaged(&x, sizeof(int));
    cudaMallocManaged(&y, sizeof(int));

    *x = 5;
    *y = 8;

    std::cout << "Hello" << std::endl;
    std::cout << "GPU process... : " << *x << "  " << *y << std::endl;

    swap<<<1, 1>>>(*x, *y);
    pTest<<<1, 1>>>();
    cudaDeviceSynchronize();

    test();

    std::cout << "Process ended -> x = " << *x << ", y = " << *y << std::endl;

    cudaFree(x);
    cudaFree(y);

    return 0;
}