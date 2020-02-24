#include <stdio.h>

void printNumbersGoto(int n);
void printNumbersFor(int n);
void printNumbersRecursiveFunction(int n);

int main() {
  printNumbersGoto(7);
  printf("= printNumbersGoto(7)\n");
  printNumbersFor(7);
  printf("= printNumbersFor(7)\n");
  printNumbersRecursiveFunction(7);
  printf("= printNumbersRecursiveFunction(7)\n");
}

// print numbers up to `n` using goto:
void printNumbersGoto(int n) {
  int i = 0;
start:
  printf("%i ", i++);
  if (i <= n) goto start;
}

// print numbers up to `n` using for:
void printNumbersFor(int n) {
  for (int i = 0; i <= n; i++) {
    printf("%i ", i);
  }
}

// print numbers up to `n` using goto:
void printNumbersRecursiveFunction(int n) {
  if (n > 0) {
    printNumbersRecursiveFunction(n - 1);
  }

  printf("%d ", n);

}