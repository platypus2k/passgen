#!/bin/bash
# MIT License Copyright (c) 2021 Jeremias Grym
# version 0.1

# first check for no command line arguments

if [ -z $1 ]
then
    echo "-d [number] for number of digits"
    echo "-c [number] for number of characters only"
    echo "-p [number] for number of chars with specials"
    exit 1

#/dev/urandom for random data
#use tr to filter out the characters we want
#use head for the number of chars we want to output

elif [ $1 = '-d' ]
then
    random=$(cat /dev/urandom | tr -dc '0-9' | head -c $2)
elif [ $1 = '-c' ]
then
    random=$(cat /dev/urandom | tr -dc '0-9A-Za-z' | head -c $2)
elif [ $1 = '-p' ]
then
    random=$(cat /dev/urandom | tr -dc '0-9A-Za-z!@#$%&=+' | head -c $2)

#naive regex to regenerate password until it contains at least one of each:
#lower case, upper case, number, special character

    while ! [[ $random =~ [a-z]+ &&
               $random =~ [A-Z]+ &&
               $random =~ [0-9]+ &&
               $random =~ [\!\@\#\$\%\&\=\+]+ ]]
    do
        random=$(cat /dev/urandom | tr -dc '0-9A-Za-z!@#$%&=+' | head -c $2)
    done
fi

echo "$random"
