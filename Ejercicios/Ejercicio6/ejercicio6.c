#include <stdio.h>
#include <ctype.h>

int main(int argc, char *argv[]) {
    int chars = 0;
    int words = 0;
    int lines = 0;
    int in_word = 0;
    FILE *fp;

    if (argc < 2) {
        fprintf(stderr, "Uso: %s archivo\n", argv[0]);
        return 1;
    }

    fp = fopen(argv[1], "r");
    if (!fp) {
        perror("Error al abrir archivo");
        return 1;
    }

    int c;
    while ((c = fgetc(fp)) != EOF) {
        chars++;

        if (c == '\n')
            lines++;

        if (isalpha(c)) {
            if (!in_word) {
                words++;
                in_word = 1;
            }
        } else {
            in_word = 0;
        }
    }

    fclose(fp);
    printf("%8d %8d %8d\n", lines, words, chars);
    return 0;
}
