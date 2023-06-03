# Make sure you have terraform and docker installed in your ec2 instance

# Wordpress-website-deployment-terraform
Create a Terraform script to deploy a VM. The VM should be in public subnet.
#please follow main.tf
# Run following commands
$ terraform init
$ terraform plan
$ terraform validate
$ terraform apply

# In the same VM Create a Dockerfile to deploy Apache webserver + PHP + Wordpress. Use COPY, ARG, RUN, ENTRYPOINT, CMD, WORKDIR in Dockerfile.
for code follow dockerfile
# Run these commands 
$ Docker build
$ docker run

use sudo if permission deneid

# Build the docker image, tag the image and push the docker image to Docker Hub and run the container.
 $ docker login
 $ docker push your-dockerhub-username/my-apache-image:tag
 
# Deploy the RDS on AWS and it should be on private subnet. main.tf for code
$ terraform plan 
$ terraform apply

# Connect your Wordpress container with RDS database follow docker compose for code
#run the following command after creating the docker-compose

$ docker-compose up -d
$ docker run -d -p 80:80 --name my-wordpress-container my-wordpress-image




