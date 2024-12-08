
#!/bin/bash


# Initialize variables
score=0
direction=right


# Set the initial position of the snake
snake_x=10
snake_y=10


# Set the initial position of the food
food_x=20
food_y=20


# Display the game board
function display_board {
  clear
  for ((i=0;i<30;i++)); do
    for ((j=0;j<30;j++)); do
      if [[ $i -eq 0 || $i -eq 29 || $j -eq 0 || $j -eq 29 ]]; then
        echo -n "#"
      elif [[ $i -eq $snake_x && $j -eq $snake_y ]]; then
        echo -n "O"
      elif [[ $i -eq $food_x && $j -eq $food_y ]]; then
        echo -n "X"
      else
        echo -n " "
      fi
    done
    echo
  done
  echo "Score: $score"
}


# Move the snake in the specified direction
function move_snake {
  case $direction in
    right)
      snake_y=$((snake_y+1))
      ;;
    left)
      snake_y=$((snake_y-1))
      ;;
    up)
      snake_x=$((snake_x-1))
      ;;
    down)
      snake_x=$((snake_x+1))
      ;;
  esac
}


# Check if the snake has collided with the wall or itself
function check_collision {
  if [[ $snake_x -lt 1 || $snake_x -gt 28 || $snake_y -lt 1 || $snake_y -gt 28 ]]; then
    game_over
  fi
}


# Check if the snake has eaten the food
function check_food {
  if [[ $snake_x -eq $food_x && $snake_y -eq $food_y ]]; then
    score=$((score+1))
    food_x=$((RANDOM % 28 + 1))
    food_y=$((RANDOM % 28 + 1))
  fi
}


# Display the "game over" message and exit
function game_over {
  clear
  echo "Game Over!"
  echo "Your score was $score"
  echo "Happy New Year 2023!"
  exit
}


# Main game loop
while true; do
  display_board
  read -sn1 input
  case $input in
    w)
      direction=up
      ;;
    a)
      direction=left
      ;;
    s)
      direction=down
      ;;
    d)
      direction=right
      ;;
  esac
  move_snake
  check_collision
  check_food
  sleep 0.1
done

        