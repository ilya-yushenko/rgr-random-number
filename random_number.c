#include <stdlib.h>
#include <time.h>
#include "random_number.h"

int generate_random_number() {
    srand(time(NULL));
    return (rand() % 19) - 9;
}
