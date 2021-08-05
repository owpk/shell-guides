#!/bin/bash

# multiple comments
: '
Comment
Coment'

# [ DOC DELIMITER ]
# Read all lines between "EOF (can be any word actually)" and write it to file.txt
sudo cat >> file.txt << EOF
ABOBA
TEXT
EOF

# [ CONDITIONAL STATEMENTS ]
count=10
# -eq "equal"
if [ $count -eq 10 ]
then
   echo "the conditional is true"
else
   echo "the conditional is false"
fi

# else if
if (( $count < 9 ))
then
   echo "false"
elif (( $count <= 9 ))
then
   echo "true"
fi

# and &&, -a
# or ||
# -gt "greater then"
# -lt "less then"
if [ $count -gt 11 ] && [ $count -lt 8 ]
   # or syntax [[ cond1 && cond2 ]] or syntax [[ cond1 -a cond2 ]]
then
   echo "false"
fi

# [ LOOPS ]

# while
number=1
while [ $number -lt 10 ]
do
   echo "$number" while loop
   number=$(( number + 1 ))
done

# until
number=1
# -ge "greater than"
until [ $number -ge 10 ]
do
   echo "$number" until loop
   number=$(( number + 1 ))
done

# for
# {start..ending..increment} increment default val is 1
for i in {0..20..5}
do
   echo $i for loop
done

# for break continue
for (( i=0; i<10; i++ ))
do
   if [ $i -gt 5 ]
   then
      break
   elif [ $i -lt 4 ]
   then
      continue
   fi
   echo $i antother for loop
done

# [ SCRIPT INPUT ]
# input args represented by $1 ... $n
# $@ - unlimited number of args
# $# - length of input args
# ${#args[@]} - array length
args=("$@")
for (( i=0; i<"${#args[@]}"; i++ ))
do
   echo ${args[$i]}
done

# pass args from file
while read line
do
   echo "$line"
done < "${1:-/dev/stdin}"

# redirect stdout
# 1> - standart output
# 2> - error output
ls -al 1> file1.txt 2> file2.txt

# both out redirection
ls -al > file3.txt 2>&1 # or ls -al >& file3.txt

# [ SEND OUTPUT FROM ONE SCRIPT TO ANOTHER ]
MESSAGE="HELLO LINUX"
export MESSAGE # exporting MESSAGE variable to the system
./secondscript.sh # executing second script which contains MESSAGE variable

# [ STRINGS ]
# compare two strings by content
s1="abc"
s2="DEF"
if [ "s1" == "s2" ]
then
   echo "mathced"
else
   echo "unmatched"
fi

# compare by length
if [ "$s1" \< "$s2" ]
then
   echo "smaller"
fi

# upper and lower case
echo ${s1^} # upper first letter
echo ${s1^^} # upper all letters

# [ NUMBERS AND ARITHMETIC ]
n1=4
n2=3
echo $(( $n1 + $n2 ))
echo $(( $n1 - $n2 ))
echo $(( $n1 * $n2 ))
echo $(( $n1 / $n2 ))
echo $(( $n1 % $n2 ))
# expression
echo $(expr $n1 + $n2 )

# convert hex to decimal
HEX="FFFA"
echo "obase=10; ibase=16; $HEX" | bc

# [ DECLARE COMMAND ]
# declare a read only variable
declare -r myvar=somevalue
echo $myvar

# [ ARRAYS ]
# index starts with 0
car=('BMW' 'TOYOTA' 'HONDA')

# all array vals
echo "${car[@]}"
# arr length
echo "${#car[@]}"
# show indexes
echo "${!car[@]}"

# delete value
unset car[2]
# add value
set car[2]='Mercedese'

# [ FUNCTIONS ]
function funcName() {
   echo "my func with args: $@"
   retVal="Something returned"
}

# after func invoked this value will change by value in func
retVal="Nothing returned"

# pass any args to func
funcName var1 var2
echo $retVal

# [ FILES AND DIRECTORIES ]
# check if directory is exists
dir="~/not_existed_dir"
if [ -d $dir ]
then echo "exists"
else echo "not exists"
fi

# check if file is exists
file="~/not_existed_file"
if [ -f $file ]
then echo "exists"
else echo "not exists"
fi

# [ CURL ]
# download file
url="https://url"
curl $url -O 2> /dev/null
# with custom name
cur $url -o name 2> /dev/null
# with curl metadata
curl -I $url 2> /dev/null

# [ PROFESSIONAL MENUS ]
# select with case
select var in VAR1 VAR2 VAR3
do
   echo "$var"
   case $var in
      VAR1)
         echo "ABOBA";;
      VAR2)
         echo "ABOBUS";;
      VAR3)
         echo "AMOGUS";;
      *)
         break;;
   esac
done
