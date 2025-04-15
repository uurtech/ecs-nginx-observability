# AWS ECS Nginx Deployment with Terraform

This project provides Terraform configuration to deploy a sample Nginx application on AWS ECS (Elastic Container Service) with a publicly accessible Application Load Balancer.

## Architecture

- AWS ECS Cluster with Fargate launch type
- Application Load Balancer with public access
- Custom Nginx container with a sample webpage
- VPC with public subnets, internet gateway and security groups

## Prerequisites

- AWS Account
- AWS CLI configured with appropriate credentials
- Terraform installed (v1.0+)
- Docker (for building and pushing the custom Nginx image)

## Directory Structure

```
.
├── main.tf                 # Main Terraform configuration
├── variables.tf            # Project variables
├── modules/
│   ├── vpc/                # VPC module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ecs/                # ECS module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── nginx/                  # Nginx custom image
    ├── Dockerfile
    └── index.html
```

## Deployment Steps

1. **Build and Push the Nginx Docker Image**

   ```bash
   cd nginx
   docker build -t your-repo/ecs-nginx:latest .
   docker push your-repo/ecs-nginx:latest
   ```

   > Note: Update the image name in `modules/ecs/main.tf` to match your repository.

2. **Initialize Terraform**

   ```bash
   terraform init
   ```

3. **Plan the Deployment**

   ```bash
   terraform plan
   ```

4. **Apply the Configuration**

   ```bash
   terraform apply
   ```

5. **Access the Application**

   After the deployment is complete, Terraform will output the load balancer DNS name. Use this to access your Nginx application:
   
   ```
   http://<load-balancer-dns-name>
   ```

## Clean Up

To destroy all resources created by Terraform:

```bash
terraform destroy
```

## Customization

- Modify `variables.tf` to change the AWS region, instance types, or other configuration options
- Update `nginx/index.html` to customize the web page content
- Adjust task CPU/memory in `modules/ecs/variables.tf` to scale the application 