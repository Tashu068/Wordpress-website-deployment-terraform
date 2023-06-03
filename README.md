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
 
# Deploy the RDS on AWS and it should be on private subnet.
$ terraform plan 
$ terraform apply


