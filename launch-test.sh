#Name or path to the binary
binary=aoc-2022

day_arg(){
  # set here how you format the day argument
  # Example:
  #echo "--day=$1"
  echo $1

}

part_arg(){
  # set here how you format the exerice part argument
  # Example:
  # if [ $1 -eq 1 ]; then
  #   echo "--puzzle-part=one"
  # elif [ $1 -eq 2 ];then
  #   echo "--puzzle-part=two"
  # fi;
  echo $1
}

input_arg(){
  # set here how you format the input argument
  # Example:
  # echo "--file $1"
  echo "--input $1"
}

if [ $# -eq 0 ];then
  find inputs/ -type f -exec ./launch-test.sh {} \; | column -t -s\| | sort
else
  path=$(realpath $1)
  file=$(basename $1)

  day_part=$(echo $file | cut -d. -f 1)
  day=$(echo $day_part | cut -d- -f 1)
  part=$(echo $day_part | cut -d- -f 2)
  type_=$(echo $file | cut -d. -f 2)
  details=$(echo $file | cut -d. -f 3)


  day=$(day_arg "$day")
  part=$(part_arg $part)
  input=$(input_arg $path)
  out=$($binary $day $part $input 2>&1)
  out=$(echo $out | sed -e "s/Backtrace.*//")
  echo $(basename $path) \| $out

fi;
