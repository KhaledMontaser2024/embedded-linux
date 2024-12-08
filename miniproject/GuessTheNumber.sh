#!/usr/bin/env bash
clear 
echo ""
echo "############################################################"
echo "## You Have Three Attempts to guess a number from 1 to 10 ##"
echo "############################################################"
TryCount=0
enteredNum=0
rand=$[ 1 + $RANDOM %10 ]
echo ""
function take_the_guess()
{
    echo -n "Guess The Number: "    
    while read -r enteredNum
    do
        if [[ enteredNum -eq 0 || enteredNum -gt 10 ]]; then
            echo "please enter a valid number between 1 and 10 !" 
        else 
            break
        fi 
        
    done 


} 

function check_the_guess()
{
    if [[ enteredNum -gt rand ]]; 
    then 
        ((TryCount=TryCount+1))
        if [[ TryCount -le 2 ]];then 
            echo "Try Less"
        elif [[ TryCount -eq 3 ]];then
            echo "Game Over !"
            echo "The Number Was: $rand "
            PlayAgain
        fi

    elif [[ enteredNum -lt rand ]];
    then 
        
        ((TryCount=TryCount+1))
        if [[ TryCount -le 2 ]];then 
            echo "Try More"
        elif [[ TryCount -eq 3 ]];then
            echo "Game Over !"
            echo "The Number Was: $rand "
            PlayAgain
        fi  

    else
        case $TryCount in
        0)
            echo "You got it right on First Try!"
            ;;
        1)
            echo "You got it right on Second Try!"
            ;;
        2)
            echo "You got it right on third Try!"
            ;;
        esac
        PlayAgain
    fi 


}

function PlayAgain()
{
    echo ""
    echo "###########################################"
    echo "## Do You Want To Play Again? [yes / no] ##"
    echo "###########################################"
    while read -r  ans
    do     
        if  [[ "${ans,,}" == "no" ]]; then
            echo ""
            echo "##########################################"
            echo "## Developed By Khaled Montaser .. Bye! ##"
            echo "##########################################" 
            exit
        elif [[ "${ans,,}" != "yes" ]]; then
            echo "please enter valed response!! "
        else
            TryCount=0
            rand=$[ 1 + $RANDOM %10 ]
            echo ""
            break
        fi
    done 

} 

while [[ TryCount -lt 3 ]];
do
    take_the_guess  
    check_the_guess
done 

