# budget-cloudformation

Implement Stack Cloud Formation from the Shell for AWS Budget Services

## Requirements

Install jq:

`echo y | sudo yum install jq`
or
`echo y | sudo apt install jq`
  
  
## Examples of usage

`chmod a+x deploy_cf_budget.sh`

`./deploy_cf_budget.sh -e <ENVIRONMENT> -n <STACK_NAME> -a <AMOUNT>`
  
  
 Optional parameters
1.  ENVIRONMENT: Name of Environment to work on (Disable)
2.  STACK_NAME: Name of the CloudFormation stack
3.  AMOUNT>: Amount budget
  
 
