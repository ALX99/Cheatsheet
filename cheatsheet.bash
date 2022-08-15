#!/bin/bash
set -euo pipefail
# -e means to exit directly whenever any command exists with a non-zero exit code
# -u means to treat any unset variable as an error
# -o pipefail means if any command in a pipeline retuns a non-zero exist code it will be used as the return code of the whole pipeline

#####################
# Bash substitution #
#####################
ex="${1-defaultValue}" # If $1 is not set use defaultValue
ex="${1+defaultValue}" # If $1 is set use defaultValue, else use null string
ex="${ex?error message}" # If ex is not set print error message and exit
ex="${ex+newVal}" # If $1 is set use newVal
echo "Length of ex is: ${#ex}" # Length of variable
echo "Number of args supplied is: $#" # Number of args supplied to script
ex="aaa bbb ccc"
echo "ex substitution 1: ${ex#a*\ }" # Remove from $ex the shortest part of $Pattern that matches the front end of $ex
echo "ex substitution 2: ${ex##a*\ }" # Remove from $ex the longest part of $Pattern that matches the front end of $ex
echo "ex substitution 3: ${ex%\ *}" # Remove from $ex the shortest part of $Pattern that matches the back end of $ex
echo "ex substitution 4: ${ex%%\ *}" # Remove from $ex the longest part of $Pattern that matches the back end of $ex
echo "ex substitution 5: ${ex:1}" # Variable $ex expanded, starting from offset 1
echo "ex substitution 5: ${ex:0:3}" # Variable $ex expanded to max 3 characters starting from offset 0
echo "ex substitution 6: ${ex/aaa/xxx}" # First match of aaa within ex is replaced by xxx
echo "ex substitution 7: ${ex// /x}" # All matches of space within ex is replaced by x
echo "ex substitution 8: ${ex/#a/hello }" # If prefix of ex matches a, then substitute for hello
echo "ex substitution 9: ${ex/%c*/hello }" # If suffix of ex matches c*, then substitute for hello
echo "ex substitution 10: ${!e*}" # Match names of all previously declared variable beginning with e
echo "Example working directory name: ${PWD##*/}"
echo "Example name of script: ${0##*/}"
echo

#####################
# Common conditions #
#####################
[[ -f $ex ]] && echo "Regular file exists" || echo "Regular file does not exist"
[[ -e $ex ]] && echo "File exists" || echo "File does not exist"
[[ -r $ex ]] && echo "File exists and user has read access" || echo "Filed does not exist or user can't read file"
[[ -d $ex ]] && echo "Directory exists" || echo "Directory does not exist"
[[ -z $ex ]] && echo "Variable length is zero (is not set)" || echo "Variable is set"
[[ -n ${x-} ]] && echo "Variable length is nonzero (is set)" || echo "Variable is not set"
echo

#######
# IFS #
#######
# IFS (Internal Field Separator) controls what Bash calls word splitting
# Each character in the IFS will result in word splitting by default it is set to $' \n\t'
IFS=$' '
items="a b c"
for i in $items; do echo "$i"; done # Results in "a\nb\nc"

IFS=$'\n'
for i in $items; do echo "$i"; done # Results in "a b c"
echo

##########
# Arrays #
##########
arr=() # Create empty array
arr=("This is" "an")  # Create array with values
arr+=("array") # Add to array

for i in "${arr[@]}"; do echo "$i"; done
