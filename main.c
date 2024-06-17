#include <stdio.h>
#include "guess_number.h"
#include "random_number.h"

int main() {
    int userGuess;
    int randomNumber = generate_random_number();

    printf("Введіть число від -9 до 9: ");
    scanf("%d", &userGuess);

    if (check_guess(userGuess, randomNumber)) {
        printf("Ви виграли! Вгадане число: %d\n", randomNumber);
        return 0;
    } else {
        printf("Ви програли. Вгадане число: %d\n", randomNumber);
        return 1;
    }
}
