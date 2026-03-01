#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILE_NAME "students.dat"

struct Student {
    int studentID;
    char studentName[50];
    char email[50];
    char courseID[20];
    char grade[5];
};

/* Function Prototypes */
void createFile();
void addRecord();
void displayRecords();
void searchRecord();
void updateRecord();
void deleteRecord();

int main() {
    int choice;

    do {
        printf("\n===== MAIN MENU =====\n");
        printf("1. Create the binary file\n");
        printf("2. Add a record\n");
        printf("3. Display all records\n");
        printf("4. Seek a specific record\n");
        printf("5. Update a record\n");
        printf("6. Delete a record by name\n");
        printf("7. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch(choice) {
            case 1: createFile(); break;
            case 2: addRecord(); break;
            case 3: displayRecords(); break;
            case 4: searchRecord(); break;
            case 5: updateRecord(); break;
            case 6: deleteRecord(); break;
            case 7: printf("Exiting program...\n"); break;
            default: printf("Invalid choice!\n");
        }

    } while(choice != 7);

    return 0;
}

/* Create File */
void createFile() {
    FILE *fp = fopen(FILE_NAME, "wb");
    if(fp == NULL) {
        printf("Error creating file!\n");
        return;
    }
    fclose(fp);
    printf("File created successfully!\n");
}

/* Add Record */
void addRecord() {
    FILE *fp = fopen(FILE_NAME, "ab");
    struct Student s;

    if(fp == NULL) {
        printf("File not found! Create file first.\n");
        return;
    }

    printf("Enter Student ID: ");
    scanf("%d", &s.studentID);

    printf("Enter Student Name: ");
    scanf(" %[^\n]", s.studentName);

    printf("Enter Email: ");
    scanf(" %[^\n]", s.email);

    printf("Enter Course ID: ");
    scanf(" %[^\n]", s.courseID);

    printf("Enter Grade: ");
    scanf(" %[^\n]", s.grade);

    fwrite(&s, sizeof(struct Student), 1, fp);
    fclose(fp);

    printf("Record added successfully!\n");
}

/* Display Records */
void displayRecords() {
    FILE *fp = fopen(FILE_NAME, "rb");
    struct Student s;

    if(fp == NULL) {
        printf("File not found!\n");
        return;
    }

    printf("\n--- Student Records ---\n");
    while(fread(&s, sizeof(struct Student), 1, fp)) {
        printf("\nID: %d\nName: %s\nEmail: %s\nCourse: %s\nGrade: %s\n",
               s.studentID, s.studentName, s.email, s.courseID, s.grade);
    }

    fclose(fp);
}

/* Search Record */
void searchRecord() {
    FILE *fp = fopen(FILE_NAME, "rb");
    struct Student s;
    char name[50];
    int found = 0;

    if(fp == NULL) {
        printf("File not found!\n");
        return;
    }

    printf("Enter name to search: ");
    scanf(" %[^\n]", name);

    while(fread(&s, sizeof(struct Student), 1, fp)) {
        if(strcmp(s.studentName, name) == 0) {
            printf("\nRecord Found!\n");
            printf("ID: %d\nEmail: %s\nCourse: %s\nGrade: %s\n",
                   s.studentID, s.email, s.courseID, s.grade);
            found = 1;
            break;
        }
    }

    if(!found)
        printf("Record not found!\n");

    fclose(fp);
}

/* Update Record */
void updateRecord() {
    FILE *fp = fopen(FILE_NAME, "rb+");
    struct Student s;
    char name[50];
    int found = 0;

    if(fp == NULL) {
        printf("File not found!\n");
        return;
    }

    printf("Enter name to update: ");
    scanf(" %[^\n]", name);

    while(fread(&s, sizeof(struct Student), 1, fp)) {
        if(strcmp(s.studentName, name) == 0) {
            printf("Enter new Grade: ");
            scanf(" %[^\n]", s.grade);

            fseek(fp, -sizeof(struct Student), SEEK_CUR);
            fwrite(&s, sizeof(struct Student), 1, fp);

            printf("Record updated successfully!\n");
            found = 1;
            break;
        }
    }

    if(!found)
        printf("Record not found!\n");

    fclose(fp);
}

/* Delete Record */
void deleteRecord() {
    FILE *fp = fopen(FILE_NAME, "rb");
    FILE *temp = fopen("temp.dat", "wb");
    struct Student s;
    char name[50];
    int found = 0;

    if(fp == NULL) {
        printf("File not found!\n");
        return;
    }

    printf("Enter name to delete: ");
    scanf(" %[^\n]", name);

    while(fread(&s, sizeof(struct Student), 1, fp)) {
        if(strcmp(s.studentName, name) != 0) {
            fwrite(&s, sizeof(struct Student), 1, temp);
        } else {
            found = 1;
        }
    }

    fclose(fp);
    fclose(temp);

    remove(FILE_NAME);
    rename("temp.dat", FILE_NAME);

    if(found)
        printf("Record deleted successfully!\n");
    else
        printf("Record not found!\n");
}