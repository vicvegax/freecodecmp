#!/bin/bash

# Number Guessing Game
PSQL="psql -X --username=freecodecamp --dbname=number_guess  --tuples-only -c"

NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Enter your username:"
read NAME
if [[ ! -z $NAME ]]
then
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME'")
  if [[ -z $USER_ID ]]
  then
    # 
    echo "Welcome, $NAME! It looks like this is your first time here."

    INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$NAME')") 
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$NAME'")
  else
    GAMES=$($PSQL "SELECT COUNT(game_id), COALESCE(MIN(tries),0) FROM users INNER JOIN games USING(user_id) FULL JOIN wins USING(game_id) WHERE user_id=$USER_ID")
    echo "$GAMES" | while read GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id) VALUES($USER_ID)") 
  GAME_ID=$($PSQL "SELECT MAX(game_id) FROM games WHERE user_id=$USER_ID")

  echo "Guess the secret number between 1 and 1000:"
  GUESS=0
  TRIES=1
  until [ $GUESS == $NUMBER ]
  do
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    else 
      if [[ $GUESS > $NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $GUESS < $NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
        INSERT_GAME=$($PSQL "INSERT INTO wins(game_id, tries) VALUES($GAME_ID, $TRIES)")
      fi
    fi
    TRIES=$((TRIES+1))
  done
else 
  echo "Bye bye bye"
fi