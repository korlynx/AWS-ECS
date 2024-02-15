# clean up

# Delete the services
#aws ecs delete-service --cluster fargate-cluster --service fargate-service --force
aws ecs delete-service --cluster fargate-cluster --service my-app --force
# delete the cluster
aws ecs delete-cluster --cluster fargate-cluster