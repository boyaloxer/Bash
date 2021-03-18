#!/usr/bin/bash

# A simple brute forcer for sha256. Word list required. See line 9 for path used in this example.

# 1. Take user input for variable called "hash" with hashed password we're looking for.
read -p "Paste the sha256 hash: " hash

# 2. Create loop to hash every word in the file with sha256sum, using space as a delimiter, pulling only field 1, and saving each hashed word to variable called "wordhash".
for word in $(cat /usr/share/metasploit-framework/data/wordlists/password.lst)
do
wordhash=$(printf $word | sha256sum | cut -d " " -f1)

# 3. Create "if" statement that compares the "wordhash" variable to our first variable, "hash", checking if they are equal/same.
    if [ $wordhash == $hash ]
# 4. "then" portion of "if" statement, printing the word from the .lst doc that, when hashed, matched our given hash at the top of the script ("hash" variable)
        then
            printf "===========================\n"
            printf "HIT: $word\n"
            printf "===========================\n"
# 5. Break the loop upon matching a hashed word with our hash variable.
            break
# 6. Whenever a hashed word doesn't match our hash variable, we print the hashed word just to know something is happening.
        else
            printf "$wordhash\n"
# 7. End our entire if statement with fi, and then wrap up the script with done.
    fi
done

