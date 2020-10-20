#!/bin/bash

#getops
nflag=false
aflag=false
eflag=false


DIRNAME=$(dirname "$0")

echo "Directory: $DIRNAME"

usage () { echo "
    -h -- Opens up this help message
    -n -- Name of the CloudFormation stack
    -a -- Amount budget
    -e -- Name of Environment to work on
"; }

options=':n:a:e:h'

while getopts $options option
do
    case "$option" in
        n  ) nflag=true; STACK_NAME=$OPTARG;;
        a  ) aflag=true; AMOUNT=$OPTARG;;
        e  ) eflag=true; ENV=$OPTARG;;
        h  ) usage; exit;;
        \? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
        :  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        *  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac
done

# Fuerza el nombre del stack
if ! $nflag
then
    STACK_NAME="budget"
fi

#echo "Stack name: $STACK_NAME"
#echo "Enviroment: $ENV"
#echo "Amount: $AMOUNT"

echo "Checking if stack exists ..."
if ! aws cloudformation describe-stacks  --stack-name $STACK_NAME; then
  echo -e "Stack does not exist, creating ..."

  # Deploy stack cf
  aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --parameters file://$DIRNAME/parameters.json \
    --template-body file://$DIRNAME/cf-budget.yaml \
    --tags file://$DIRNAME/tags.json \
    --capabilities "CAPABILITY_NAMED_IAM" "CAPABILITY_AUTO_EXPAND" 
fi
