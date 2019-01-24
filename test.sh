#!/bin/bash

# Include any branches for which you wish to disable this script
#if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop staging test)
#fi
# Get the current branch name and check if it is excluded
BRANCH_NAME=$(git symbolic-ref --short HEAD)
#BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")

# Trims down the branch name to only include the issue number.
TRIMMED=$(echo $BRANCH_NAME | sed -e 's/[^0-9][^0-9]*\([0-9][0-9]*\).*/\1/g' )

if [[ $BRANCH_NAME == $BRANCHES_TO_SKIP  ]];then
	exit 0
fi
#checks to make sure trimmed is a number, if not it exits and tells user to check wiki
if [[ $TRIMMED =~ [\$0-9] ]];then
# If it isn't excluded, preprend the trimmed branch identifier to the given message
  if [ -n "$BRANCH_NAME" ]  && [[ ! $BRANCH_EXCLUDED -eq 1 ]]; then
    sed -i.bak -e "1s/^/[#$TRIMMED] /" $1
fi
 else
    echo "branch name is not named properly, please see wiki for formating"
    exit 1
fi
