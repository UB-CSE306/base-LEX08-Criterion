#include <stdlib.h>
#include <string.h>
#include <stdio.h>

struct Node {
  int value;
  struct Node * next;
};

void printList(struct Node *);
void program1();
struct Node * program2(int argc, char * argv[]);
