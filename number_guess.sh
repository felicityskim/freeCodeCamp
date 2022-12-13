#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

NUMBER=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$USERNAME'")
if [[ $USER_INFO ]]
then
  IFS="|" read USERNAME GAMES_PLAYED BEST_GAME <<< $USER_INFO
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

READ_GUESS() {
  read GUESS

  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS
  done
}

NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
READ_GUESS
(( NUMBER_OF_GUESSES++ ))

while [[ $GUESS -ne $NUMBER ]]
do
  case $(( (GUESS > NUMBER) * 1 + (GUESS < NUMBER) * 2 )) in
    1) echo "It's lower than that, guess again:" ;;
    2) echo "It's higher than that, guess again:" ;;
  esac
  READ_GUESS
  (( NUMBER_OF_GUESSES++ ))
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"

if [[ $USER_INFO ]]
then
  if [[ $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played = $(( GAMES_PLAYED + 1 )), best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
  else
    UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played = $(( GAMES_PLAYED + 1 )) WHERE username = '$USERNAME'")
  fi
else
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, best_game) VALUES('$USERNAME', $NUMBER_OF_GUESSES)")
fi
