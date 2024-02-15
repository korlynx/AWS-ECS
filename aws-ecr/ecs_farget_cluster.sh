
#subnet_id=${}
#security_group_id=${}
# 
# ccreate a container cluster
aws ecs create-cluster --cluster-name fargate-cluster

#task definition for a particular container
aws ecs register-task-definition --cli-input-json file://$HOME/task.json

#decribe your task definistions
aws ecs list-task-definitions

# create a service or run a task
aws ecs create-service --cluster fargate-cluster --service-name my-app --task-definition application-task:1 --desired-count 1 --launch-type "FARGATE" --network-configuration "awsvpcConfiguration={subnets=[subnet-id],securityGroups=[sg-id],assignPublicIp=ENABLED}"

# list Services for your cluster, you should see the two services created
aws ecs list-services --cluster fargate-cluster

#Describe running services in the ECS cluster
aws ecs describe-services --cluster fargate-cluster --services fargate-service

# List the ARN of tasks created
aws ecs list-tasks --cluster fargate-cluster --service fargate-service