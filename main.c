#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Определение типов данных
typedef enum {
    TYPE_INT,
    TYPE_STRING
} DataType;

// Определение структуры для элемента списка
typedef struct List {
    DataType type;
    void *data;
    struct List *next;
} List;

// Функция для добавления элемента в начало списка
void add_to_list(List **head, DataType type, void *new_data) {
    List *new_node = (List *)malloc(sizeof(List));
    new_node->type = type;
    new_node->next = *head;

    if (type == TYPE_INT) {
        new_node->data = malloc(sizeof(int));
        *(int *)(new_node->data) = *(int *)new_data;
    } 
    else if (type == TYPE_STRING) {
        size_t len = strlen((char *)new_data) + 1;
        new_node->data = malloc(len);
        strcpy((char *)(new_node->data), (char *)new_data);
    }

    *head = new_node;
}

// Функция для вывода списка
void print_list(List *node) {
    while (node != NULL) {
        if (node->type == TYPE_INT) {
            printf("%d -> ", *(int *)node->data);
        } else if (node->type == TYPE_STRING) {
            printf("%s -> ", (char *)node->data);
        }
        node = node->next;
    }
    printf("NULL\n");
}

// Функция для освобождения памяти, выделенной для списка
void free_list(List *head) {
    while (head != NULL) {
        List *temp = head;
        head = head->next;
        free(temp->data);
        free(temp);
    }
}

int main() {
    List *list = NULL;

    int int_data1 = 10;
    int int_data2 = 20;
    int int_data3 = 30;

    add_to_list(&list, TYPE_INT, &int_data1);
    add_to_list(&list, TYPE_INT, &int_data2);
    add_to_list(&list, TYPE_INT, &int_data3);

    char *str_data1 = "Hello";
    char *str_data2 = "World";

    add_to_list(&list, TYPE_STRING, str_data1);
    add_to_list(&list, TYPE_STRING, str_data2);

    printf("Mixed List: ");
    print_list(list);

    // Освобождение памяти
    free_list(list);

    return 0;
}