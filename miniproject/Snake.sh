#!/usr/bin/env bash


score=0
snake_x=$[ 1+$RANDOM %28 ]
snake_y=$[ 1+$RANDOM %28 ]
food_x=$[ 1+$RANDOM %28 ]
food_y=$[ 1+$RANDOM %28 ]

function welcome()
{
    clear 
    echo "################################"
    echo "## Welcome To Snake on Bash ! ##"
    echo "## To Start, Please Press S   ##"
    echo "## To Quit , Please Press Q   ##"
    echo "################################"
    while read -sn1 welcome
    do
        case ${welcome,,} in 
            s)
                break
            ;;
            q)
                echo "Developed By Khaled Montaser .. Bye!" 
                exit
            ;;
            *)
                echo "Please enter a valid command "
                echo "To Start, Please Press S   "
                echo "To Quit , Please Press Q   "
            ;; 
        esac 
    
    done
}

function display()
{
    clear
    for ((i=0 ; i<30 ; i++));
    do
        for((j=0 ; j<30 ; j++));
        do 
            if [[ $i -eq 0 || $i -eq 29 || $j -eq 0 || $j -eq 29 ]];then
                echo -n "#"
            elif [[ $i -eq $food_x && $j -eq $food_y ]];then
                echo -n "X"
            elif [[ $i -eq $snake_x && $j -eq $snake_y ]];then
                echo -n "O"
            else 
                echo -n " "
            fi


        done 
        echo ""
    done 
    echo "Score: $score"
}

function move_snake()
{
    while read -sn1 key 
    do
        read -sn1 -t 0.0001 k1 # This grabs all three symbols 
        read -sn1 -t 0.0001 k2 # and puts them together
        read -sn1 -t 0.0001 k3 # so you can case their entire input.

        key+=${k1}${k2}${k3} 
        
        case $key in 
        #up
        $'\e[A'|$'\e0A')
            if [[ snake_x -gt 1 ]];
            then
                ((snake_x=snake_x-1))
            else
                ((snake_x=28))
            fi
        ;;
        #Down
        $'\e[B'|$'\e0B')
            if [[ snake_x -lt 28 ]];
            then
                ((snake_x=snake_x+1))
            else
                ((snake_x=1))
            fi
        ;;
        #Right
        $'\e[C'|$'\e0C')
            if [[ snake_y -lt 28 ]];
            then
                ((snake_y=snake_y+1))
            else
                ((snake_y=1))
            fi
            
        ;;
        #Left
        $'\e[D'|$'\e0D')
            if [[ snake_y -gt 1 ]];
            then
                ((snake_y=snake_y-1))
            else 
                ((snake_y=28))
            fi
        ;;
        q) 
            echo "Developed By Khaled Montaser .. Bye!" 
            exit
        ;;
        esac
        break 
    done

}

function check_eat()
{
    if [[ $snake_x -eq $food_x && $snake_y -eq $food_y ]];then
        food_x=$[ 1+$RANDOM %28 ]
        food_y=$[ 1+$RANDOM %28 ]
        ((score=score+1))
    fi 

}

function check_score()
{
    if [[ $score -eq 5 ]];
    then
        echo ""
        echo "###########################################"
        echo "## You Win !                             ##"
        echo "## Do You Want To Play Again? [y/n]      ##"
        echo "###########################################"
        while read -sn1 ans
        do
            case ${ans,,} in 
            y)
                ((score=0))
                break
            ;;
            n)
                echo "Developed By Khaled Montaser .. Bye!" 
                exit
            ;;
            *)
            ;;
            esac

        done 
    fi 

}


welcome
while true; 
do
    display
    check_score
    move_snake
    check_eat
done 