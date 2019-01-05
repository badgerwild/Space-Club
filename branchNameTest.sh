##!/bin/bash

function branchName(){
#get the branch name
BRANCH_NAME=$(git symbolic-ref --short HEAD)

#trims down the branch to the number
TRIMMED=$(echo $BRANCH_NAME | sed -e 's/[^0-9][^0-9]*\([0-9][0-9]*\).*/\1/g'

#this evaluates to make sure that the extracted section is a number. This checks
#works if the brabch is named correctly
if [[ $TRIMMED =~ [\$0-9] ]];then
    echo "Brach name is in correct format"
fi
else
  echo "branch name is not named properly, please see wiki for formating"
  exit 1
fi
}
