#!/usr/bin/env bash
clear 
echo ""
echo "############################################################"
echo "## You Have Three Attempts to guess a number from 1 to 10 ##"
echo "############################################################"
TryCount=0
while true; 
do 
    rand=$[ 1 + $RANDOM %10 ]
    echo ""

    while [[ TryCount -lt 3 ]];
    do
        echo -n "Guess The Number: "
        read -r enteredNum
        if [[ enteredNum -eq 0 ]]; then
            echo "please enter a valid number !" 
            break
        fi 


        if [[ enteredNum -gt rand ]]; then
            
            
            ((TryCount=TryCount+1))
            if [[ TryCount -le 2 ]];then 
                echo "Try Less"
            elif [[ TryCount -eq 3 ]];then
                echo "Game Over !"
                echo "The Number Was: $rand "
            fi

        elif [[ enteredNum -lt rand ]];then 
            
            ((TryCount=TryCount+1))
            if [[ TryCount -le 2 ]];then 
                echo "Try More"
            elif [[ TryCount -eq 3 ]];then
                echo "Game Over !"
                echo "The Number Was: $rand "
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
            break
        fi 

    done 
    echo ""
    echo "###########################################"
    echo "## Do You Want To Play Again? [yes / no] ##"
    echo "###########################################"
    read -r  ans
    if  [[ "${ans,,}" == "no" ]]; then
        echo "Quitting .."
        break
    elif [[ "${ans,,}" != "yes" ]]; then
        echo "please enter valed response!! Quitting .."
        break
    else
        TryCount=0
    fi

done