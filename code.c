#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "code.h"

void program1() {
  int table[3][5];

  int i=0;
  for (int r=0; r<3; r++) {
    for (int c=0; c<5; c++) {
      table[c][r] = i++;
    }
  }
}


struct Node {
  int value;
  struct Node * next;
};

struct Node * program2(int argc, char * argv[]) {
  struct Node * list;
  list = NULL;
  for (int i=1; i<argc; i++) {
    struct Node * newNode;
    newNode = malloc(sizeof(newNode));
    (*newNode).value = atoi(argv[i]);
    (*newNode).next = list;
    list = newNode;
  }
  return list;
}

