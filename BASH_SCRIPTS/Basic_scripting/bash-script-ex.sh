#!/bin/bash

# This script displays various information to the screen. 

# Display 'Hello'
echo 'Hello'

# Assign a value to a varaible
WORD='script'

#Display taht value using the variable. 
echo "$WORD"

#Demonstrate that single quotes cause variables to NOT get expanded
echo '$WORD'

#Combine the variable with hard-coded text.
echo "This is a shell $WORD"

#Display the  contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

#Append text to the variable.
echo "${WORD}ing is fun!"

#Create a new variable
ENDING='ed'

#Combine the two variables. 
echo "This is ${WORD}${ENDING}."