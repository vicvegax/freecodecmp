#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "$1"
  fi

  # get available bikes
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")

  # if no bikes available
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    # send to main menu
    MAIN_MENU "Sorry, we don't have any service available right now."
  else
    # display available bikes
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done

    # ask for bike to rent
    #echo -e "\nWhich one would you like to pick?"
    read SERVICE_ID_SELECTED

    # if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # get bike availability
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      # if not available
      if [[ -z $SERVICE_NAME ]]
      then
        # send to main menu
        MAIN_MENU "\nI could not find that service. What would you like today?"
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi

        # get customer_id
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

        # insert appointment
        echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

        # send to main menu
        echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
      fi
    fi
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"