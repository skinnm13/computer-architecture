#include <stdio.h>

/*
  Step 2: Four loop versions of the same function logic.
  Each function returns the sum of all integers from a to b inclusive.
  Assumption: a <= b (as typical for this assignment).
*/

/* (a) for loop */
int sum_for(int a, int b) {
    int sum = 0;
    int i;
    for (i = a; i <= b; i++) {
        sum += i;
    }
    return sum;
}

/* (b) while loop */
int sum_while(int a, int b) {
    int sum = 0;
    int i = a;
    while (i <= b) {
        sum += i;
        i++;
    }
    return sum;
}

/* (c) do..while loop */
int sum_do_while(int a, int b) {
    int sum = 0;
    int i = a;

    /* If you want to handle a > b safely, uncomment this:
       if (a > b) return 0;
    */

    do {
        sum += i;
        i++;
    } while (i <= b);

    return sum;
}

/* (d) goto loop */
int sum_goto(int a, int b) {
    int sum = 0;
    int i = a;

start:
    if (i > b) {
        return sum;
    }
    sum += i;
    i++;
    goto start;
}

/* Test driver */
int main(void) {
    int a, b;

    printf("Enter two integers a and b (a <= b): ");
    if (scanf("%d %d", &a, &b) != 2) {
        printf("Invalid input.\n");
        return 1;
    }

    printf("sum_for      (%d..%d) = %d\n", a, b, sum_for(a, b));
    printf("sum_while    (%d..%d) = %d\n", a, b, sum_while(a, b));
    printf("sum_do_while (%d..%d) = %d\n", a, b, sum_do_while(a, b));
    printf("sum_goto     (%d..%d) = %d\n", a, b, sum_goto(a, b));

    return 0;
}