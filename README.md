# budget-cloudformation


Implement Stack Cloud Formation from the Shell for AWS Budget Services



# Requirements

Install jq:


  echo y | sudo yum install jq
  
  
# Examples of usage


chmod a+x deploy_cf_budget.sh

./deploy_cf_budget.sh -e <ENVIRONMENT> -n <STACK_NAME> -a <AMOUNT>
  
  
# Optional parameters
<ENVIRONMENT>  : Name of Environment to work on (Disable)
<STACK_NAME>   : Name of the CloudFormation stack
<AMOUNT>       : Amount budget
  
  

