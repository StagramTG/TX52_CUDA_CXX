#include "processor.h"

__global__
void kernel_test()
{
    //
}

void pTest()
{
    kernel_test<<<1, 1>>>();
}