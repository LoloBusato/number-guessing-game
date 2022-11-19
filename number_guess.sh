#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

echo "Enter your username:"
read USER_NAME #Min characters 22

USER_ID=$($PSQL "SELECT user_id FROM user_information WHERE username = '$USER_NAME'")
GUESS=1

PLAY_MENU() {
  read GUESS_NUMBER
  if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    PLAY_MENU
  else
    if [[ ! $GUESS_NUMBER -eq $RANDOM_NUMBER ]]
    then
      if [[ $GUESS_NUMBER -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
      GUESS=$(($GUESS + 1))
      PLAY_MENU
    else
      echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      if [[ -z $USER_ID ]]
      then
        INSERT_USER_RESULT=$($PSQL "INSERT INTO user_information(username) VALUES('$USER_NAME')")
        USER_ID=$($PSQL "SELECT user_id FROM user_information WHERE username = '$USER_NAME'")
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, tries) VALUES($USER_ID, $GUESS)")
      else
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, tries) VALUES($USER_ID, $GUESS)")
      fi
    fi
  fi
}

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = '$USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE user_id = '$USER_ID'")
  USERNAME=$($PSQL "SELECT username FROM user_information WHERE user_id = '$USER_ID'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
echo "Guess the secret number between 1 and 1000:"
PLAY_MENU

