#include <unistd.h>

int main(int argc, char** argv) {
    char* binary = "/home/ug2018/cs4115/labs/week03/matmult";
    argv[0] = binary;
    execv(binary, argv);
    return 0;
}