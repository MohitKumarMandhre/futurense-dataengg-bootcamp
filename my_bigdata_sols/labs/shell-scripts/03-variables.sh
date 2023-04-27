#!/bin/bash

#********************************************
# Stores data in the variable and prints
# Also, shows how to make variable readonly
# and unset the value from variable
#********************************************

NAME="Saravana Kumar"
echo "Welcome, $NAME"

# Making variable as readonly
#readonly NAME
#NAME="Kumar"

# Unsetting variable value
unset NAME
echo $NAME