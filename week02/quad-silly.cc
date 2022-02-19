#include <iostream>

using std::cout;
using std::endl;

#include <stdlib.h>

int main(int argc, char *argv[])
{
  int n = atoi(argv[1]);
  int arr[25];

  cout<< "No. of iterations will be "<< n<< endl;

  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < i; j++)
    {
      int l = 5; // some gratuitous lines of code, just
		 //   to have something in the loop
		 // in fact, a clever compiler might detect that
		 //   since the line of code doesn't depend on the
		 //   iteration of the loop it could be removed!!
    }
  }
}
