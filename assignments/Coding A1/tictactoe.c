#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <string.h>

#define SIZE 3

char board[SIZE][SIZE];

/* Function Prototypes */
void initializeBoard();
void printBoard();
int checkWinner();
int isBoardFull();
void userMove();
void computerMove();

int main() {
    char name[50];
    int winner = 0;

    printf("*********************************\n");
    printf("Tic Tac Toe\n");
    printf("COMP 2131\n");
    printf("You will be playing against the computer\n");
    printf("*********************************\n\n");

    printf("What is your name? ");
    scanf("%s", name);

    printf("\nHello %s ... Let's have fun!!! You = X | Computer = O\n\n", name);

    initializeBoard();
    printBoard();

    srand(time(NULL));

    while (1) {
        userMove();
        printBoard();
        winner = checkWinner();

        if (winner == 1) {
            printf("\n*******\nYou won!\n*******\n");
            break;
        }

        if (isBoardFull()) {
            printf("\nIt's a draw!\n");
            break;
        }

        computerMove();
        printBoard();
        winner = checkWinner();

        if (winner == 2) {
            printf("\n*******\nComputer wins!\n*******\n");
            break;
        }

        if (isBoardFull()) {
            printf("\nIt's a draw!\n");
            break;
        }
    }

    return 0;
}

/* Initialize Board */
void initializeBoard() {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            board[i][j] = ' ';
        }
    }
}

/* Print Board */
void printBoard() {
    printf("\n");
    for (int i = 0; i < SIZE; i++) {
        printf(" %c | %c | %c \n", board[i][0], board[i][1], board[i][2]);
        if (i < SIZE - 1)
            printf("---|---|---\n");
    }
    printf("\n");
}

/* User Move */
void userMove() {
    char s[100];
    int row, col;

    while (1) {
        printf("Enter X,Y coordinates for your move (example: 12 means row 1 col 2): ");

        if (scanf("%99s", s) != 1) {
            printf("Invalid input!\n");
            continue;
        }

        // Must be exactly 2 characters and both digits
        if (strlen(s) != 2 || !isdigit((unsigned char)s[0]) || !isdigit((unsigned char)s[1])) {
            printf("Invalid input! Enter two digits like 12.\n");
            continue;
        }

        row = s[0] - '0';
        col = s[1] - '0';

        // Convert 1-3 -> 0-2
        row--;
        col--;

        if (row < 0 || row >= SIZE || col < 0 || col >= SIZE) {
            printf("Out of range! Use digits 1-3.\n");
            continue;
        }

        if (board[row][col] != ' ') {
            printf("That spot is taken! Try again.\n");
            continue;
        }

        board[row][col] = 'X';
        break;
    }
}

/* Computer Move */
void computerMove() {
    int row, col;

    while (1) {
        row = rand() % 3;
        col = rand() % 3;

        if (board[row][col] == ' ') {
            board[row][col] = 'O';
            printf("Computer chose: %d %d\n", row + 1, col + 1);
            break;
        }
    }
}

/* Check Winner */
int checkWinner() {
    // Rows & Columns
    for (int i = 0; i < SIZE; i++) {
        if (board[i][0] == board[i][1] &&
            board[i][1] == board[i][2] &&
            board[i][0] != ' ') {

            if (board[i][0] == 'X') return 1;
            else return 2;
        }

        if (board[0][i] == board[1][i] &&
            board[1][i] == board[2][i] &&
            board[0][i] != ' ') {

            if (board[0][i] == 'X') return 1;
            else return 2;
        }
    }

    // Diagonals
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != ' ') {

        if (board[0][0] == 'X') return 1;
        else return 2;
    }

    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != ' ') {

        if (board[0][2] == 'X') return 1;
        else return 2;
    }

    return 0;
}

/* Check if board full */
int isBoardFull() {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (board[i][j] == ' ')
                return 0;
        }
    }
    return 1;
}