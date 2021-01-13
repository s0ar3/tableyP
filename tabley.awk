#!/usr/bin/awk -f

function arr_length(given_arr,i,size) {
    for (i in given_arr) {
        size ++
    }
    return size;
}

BEGIN {
    if (ARGC < 2) {
        printf "\n\033[1;31m%s\033[0m\n", "ERROR - No file to process was given."
        exit;
    }
}

function find_highest_salary(input, salary, type) {

    n=asort(salary,sort_salary);

    size=arr_length(sort_salary,1,0);

    for (i in input) {
       if (match(input[i],sort_salary[size])) {
           printf "\n\033[1m%s %s\033[1;31m%s\033[0m\n", type,"with the highest salary -> ", input[i];
       }
   }
}   

$5 ~ /F/ { girls[FNR]=$1" "$2" "$7; salaries_girls[FNR]=$7; }
$5 ~ /M/ { boys[FNR]=$1" "$2" "$7; salaries_boys[FNR]=$7; }

END {
    find_highest_salary(girls,salaries_girls,"Girl");
    find_highest_salary(boys,salaries_boys,"Boy");
    printf "\n";
}