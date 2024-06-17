#!/bin/bash

print_colored() {
    text=$1
    color=$2
    case $color in
        "green")
            echo -e "\e[32m$text\e[0m"
            ;;
        "red")
            echo -e "\e[31m$text\e[0m"
            ;;
        *)
            echo "$text"
            ;;
    esac
}

win_count=0
lose_count=0

run_game() {
    ./main
    result=$?
    if [ $result -eq 0 ]; then
        print_colored "Congratulations!!!" "green"
        win_count=$((win_count + 1))
    else
        print_colored "Try one more time :-(" "red"
        lose_count=$((lose_count + 1))
    fi
}

while true; do
    read -p "Do you want to continue (y/n) or set a number of repetitions (r)? " answer
    answer=${answer,,}
    if [ "$answer" == "n" ]; then
        break
    elif [ "$answer" == "y" ]; then
        run_game
    elif [ "$answer" == "r" ]; then
        read -p "Enter the number of repetitions: " repetitions
        for ((i = 0; i < repetitions; i++)); do
            run_game
        done

        echo "Games won: $win_count"
        echo "Games lost: $lose_count"
        echo "Games won: $win_count" > result.tmp
        echo "Games lost: $lose_count" >> result.tmp
        break
    else
        echo "Invalid option. Please enter y, n, or r."
    fi
done
