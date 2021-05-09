#Check if aws command is present or not on the linux machine
check=`type -P aws &>/dev/null && echo "Found" || echo "Not Found"`
if [ $check == "Not Found" ]
then
#installation of aws cli on our local linux machine
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
fi

accesskey=`cat /.ec2/iam/credentials/accesskey.txt`
secretkey=`cat /.ec2/iam/credentials/secretkey.txt`
#Assuming region us-east-1
sudo aws configure set  aws_access_key_id $accesskey && aws configure set  aws_secret_access_key $secretkey && aws configure set  region "us-east-1"

sudo aws elb create-load-balancer --load-balancer-name my-load-balancer --listeners "Protocol=HTTP,LoadBalancerPort=80,InstanceProtocol=HTTP,InstancePort=8080" --subnets subnet-84d7d2c9 --security-groups sg-074fbf5febf976b66

sudo aws elb configure-health-check --load-balancer-name my-load-balancer --health-check Target=TCP:8080,Interval=30,UnhealthyThreshold=2,HealthyThreshold=2,Timeout=5

sudo aws autoscaling create-launch-configuration --launch-configuration-name my-launch-config --key-name demokey --security-groups sg-074fbf5febf976b66 --image-id ami-0d5eff06f840b45e9 --instance-type t2.micro --user-data file://my_script.txt

sudo aws autoscaling create-auto-scaling-group --auto-scaling-group-name my-asg --launch-configuration-name my-launch-config --load-balancer-names my-load-balancer --min-size 1 --max-size 1 --tags "ResourceId=my-asg,ResourceType=auto-scaling-group,Key=Name,Value=WebServer,PropagateAtLaunch=true" --vpc-zone-identifier "subnet-84d7d2c9"

sudo aws autoscaling start-instance-refresh --auto-scaling-group-name my-asg --preferences '{"InstanceWarmup": 120, "MinHealthyPercentage": 50}'

