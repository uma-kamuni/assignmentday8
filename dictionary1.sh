#! /bin/bash
declare -A dictionary
dictionary=( [num1]=0 [num2]=0 [num3]=0 [num4]=0 [num5]=0 [num6]=0 )
condition=10
while [[ ${dictionary[num$diceNumber]} -lt $condition ]]
do
diceNumber=$(( RANDOM%6+1))
if [ $diceNumber -eq 1 ]
then
dictionary["num1"]=$(( ${dictionary[num1]}+1 ))
elif [ $diceNumber -eq 2 ]
then
dictionary["num2"]=$(( ${dictionary[num2]}+1 ))
elif [ $diceNumber -eq 3 ]
then
dictionary["num3"]=$(( ${dictionary[num3]}+1 ))
elif [ $diceNumber -eq 4 ]
then
dictionary["num4"]=$(( ${dictionary[num4]}+1 ))
elif [ $diceNumber -eq 5 ]
then
dictionary["num5"]=$(( ${dictionary[num5]}+1 ))
else
dictionary["num6"]=$(( ${dictionary[num6]}+1 ))
fi
if [[ ${dictionary[num$diceNumber]} -eq condition ]]
then
max=num$diceNumber
fi
done
for key in "${!dictionary[@]}"
do
echo "$key: ${dictionary[$key]}"
done
min=10
for key in "${!dictionary[@]}"
do
if [[ ${dictionary[$key]} -lt $min ]]
then
min="${dictionary[$key]}"
minKey=$key
fi
done
echo minimum face is $minKey with count $min
echo maximum face is $max with count $condition
