#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdbool.h>
#include <string.h>

typedef enum {
    _INIT_ELEM,
    _DECIMAL_ELEM,
    _REAL_ELEM,
    _STRING_ELEM,
} vtype_list_t;

typedef union {
    int64_t decimal;
    double real;
    uint8_t *string;
} value_list_t;

typedef struct List {
    vtype_list_t type;
    value_list_t value;
    struct List *next;
} List;

extern List *new_list(uint8_t *format, ...);
extern void free_list(List *list);

extern List *push_list(List *list, uint8_t *format, ...);
extern List *pop_list(List *list);

extern void print_list(List *list);

extern List *delbyid_list(List *list, size_t index);
extern List *addbyid_list(List *list, size_t index, uint8_t *format, ...);
extern bool elemin_list(List *list, uint8_t *format, ...);

int main(void) {
    List *list = new_list("dddd", 1, 555, 555, 333);
    List *temp = push_list(list, "r", 1.3);
    
    printf("%d\n", elemin_list(list, "r", 1.3));

    print_list(list);
    
    free_list(list);

    return 0;
}

extern List *new_list(uint8_t *format, ...) {
    List *list = (List*)malloc(sizeof(List));
    List *list_ptr = list;

    list->type = _INIT_ELEM;
    list->next = NULL;

    value_list_t value;
    va_list factor;

    va_start(factor, format);

    while(*format) {
        switch(*format) {
            case 'd':
                value.decimal = va_arg(factor, int64_t);
                list_ptr = push_list(list_ptr, "d", value.decimal);
                break;
            case 'r':
                value.real = va_arg(factor, double);
                list_ptr = push_list(list_ptr, "r", value.real);
                break;
            case 's':
                value.string = va_arg(factor, uint8_t*);
                list_ptr = push_list(list_ptr, "s", value.string);
                break;
        }
        ++format;
    }
    va_end(factor);

    return list;
}

extern List *push_list(List *list, uint8_t *format, ...) {
    if (list == NULL) {
        fprintf(stderr, "%s\n", "list is null");
        return NULL;
    }

    while (list->next != NULL) {
        list = list->next;
    }

    value_list_t value;
    va_list factor;

    va_start(factor, format);

    while(*format) {
        switch(*format) {
            case 'd':
                value.decimal = va_arg(factor, int64_t);
                list->next = (List*)malloc(sizeof(List));
                list = list->next;
                list->type = _DECIMAL_ELEM;
                list->value.decimal = value.decimal;
                list->next = NULL;
                break;
            case 'r':
                value.real = va_arg(factor, double);
                list->next = (List*)malloc(sizeof(List));
                list = list->next;
                list->type = _REAL_ELEM;
                list->value.real = value.real;
                list->next = NULL;
                break;
            case 's':
                value.string = va_arg(factor, uint8_t*);
                list->next = (List*)malloc(sizeof(List));
                list = list->next;
                list->type = _STRING_ELEM;
                list->value.string = value.string;
                list->next = NULL;
                break;
        }
        ++format;
    }
    va_end(factor);

    return list;
}

extern List *pop_list(List *list) {
    if (list == NULL) {
        fprintf(stderr, "%s\n", "list is null");
        return NULL;
    }

    if (list->next == NULL) {
        return list;
    }

    List *prev_list = list;
    List *past_list = list->next;

    while(past_list->next != NULL) {
        prev_list = past_list;
        past_list = past_list->next;
    }

    prev_list->next = NULL;

    return past_list;
}

extern bool elemin_list(List *list, uint8_t *format, ...) {
    if (list == NULL) {
        fprintf(stderr, "%s\n", "list is null");
        return false;
    }

    va_list factor;
    va_start(factor, format);

    while (*format) {
        switch (*format) {
            case 'd': {
                int64_t target_decimal = va_arg(factor, int64_t);
                while (list != NULL) {
                    if (list->type == _DECIMAL_ELEM && list->value.decimal == target_decimal) {
                        va_end(factor);
                        return true;
                    }
                    list = list->next;
                }
                break;
            }
            case 'r': {
                double target_real = va_arg(factor, double);
                while (list != NULL) {
                    if (list->type == _REAL_ELEM && list->value.real == target_real) {
                        va_end(factor);
                        return true;
                    }
                    list = list->next;
                }
                break;
            }
            case 's': {
                uint8_t *target_string = va_arg(factor, uint8_t*);
                while (list != NULL) {
                    if (list->type == _STRING_ELEM && strcmp((char*)list->value.string, (char*)target_string) == 0) {
                        va_end(factor);
                        return true;
                    }
                    list = list->next;
                }
                break;
            }
        }
        ++format;
    }

    va_end(factor);

    return false;
}

extern void print_list(List *list) {
    printf("[ ");
    while (list != NULL) {
        switch (list->type) {
            case _DECIMAL_ELEM:
                printf("%ld ", list->value.decimal);
                break;
            case _REAL_ELEM:
                printf("%lf ", list->value.real);
                break;
            case _STRING_ELEM:
                printf("'%s' ", list->value.string);
                break;
        }
        list = list->next;
    }
    printf("]\n");
}

extern void free_list(List *list) {
    List *list_ptr;
    while (list != NULL) {
        list_ptr = list->next;
        free(list);
        list = list_ptr;
    }
}