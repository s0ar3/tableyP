#!/usr/bin/awk -f

BEGIN {
    if (ARGC < 2) {
        printf "\n\033[1;31m%s\033[0m\n", "ERROR - No file to process was given."
        exit;
    }
}

function find_highest_salary(input, salary, type) {

n=asort(salary,sort_salary);
   
   size=0;
   for (i in sort_salary) {
       size ++;
   }

   for (i in salary) {
       if (salary[i] == sort_salary[size]) {
           for (j in input) {
               if (i == j) {
                   printf "\n\033[1m *%s %s\033[0m",type,"with the highest salary: -> ";
                   printf "\033[1;31m%s %d\033[0m\n",input[j],salary[j];
               }
           } 
       }
   }
}   

$5 ~ /F/ { girls[FNR]=$1" "$2; salaries_girls[FNR]=$7; }
$5 ~ /M/ { boys[FNR]=$1" "$2; salaries_boys[FNR]=$7; }

END {
    find_highest_salary(girls,salaries_girls,"Girl")
    find_highest_salary(boys,salaries_boys,"Boy")
    printf "\n";
}