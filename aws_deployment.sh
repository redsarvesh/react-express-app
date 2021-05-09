sudo aws autoscaling start-instance-refresh --auto-scaling-group-name my-asg --preferences '{"InstanceWarmup": 120, "MinHealthyPercentage": 50}'

