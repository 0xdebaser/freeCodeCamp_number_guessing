#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate random integer between 1 and 1000
RANDOM_INT=$(shuf -i 1-1000 -n 1)
GUESSES=0

# echo -e "The answer is: $RANDOM_INT"

MAIN() {
  echo -e "\nEnter your username:"
  read USERNAME
  USERDATA=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")
    if [[ -z $USERDATA ]]
  then
    NEW_USER=$($PSQL "INSERT INTO users(username, games_played) VALUES ('$USERNAME', 0)")
    GAMES_PLAYED=0
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  CHECK_GUESS $GUESS
}

CHECK_GUESS() {
  INT_RE='^[0-9]+$'
  if ! [[ $1 =~ $INT_RE ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
    CHECK_GUESS $GUESS
  else
    GUESSES=$(( $GUESSES + 1 ))
    if (( $1 == $RANDOM_INT ))
    then
      HANDLE_CORRECT
    else
      if (( $1 > $RANDOM_INT ))
      then
        echo "It's lower than that, guess again:"
        read GUESS
        CHECK_GUESS $GUESS
      else
        echo "It's higher than that, guess again:"
        read GUESS
        CHECK_GUESS $GUESS
      fi
    fi
  fi
}

HANDLE_CORRECT() {
  echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDOM_INT. Nice job!"
  GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
  if [[ -z $BEST_GAME ]]
  then
    BEST_GAME=$GUESSES
  fi
  if (( $GUESSES < $BEST_GAME ))
  then
    BEST_GAME=$GUESSES
  fi
  UPDATE_RESULT=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
}

MAIN
