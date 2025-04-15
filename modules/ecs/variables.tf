variable "project_name" {
  description = "Name of the project for tagging resources"
  type        = string
  default     = "ecs-nginx"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory for the ECS task in MiB"
  type        = number
  default     = 512
}

variable "service_desired_count" {
  description = "Number of instances of the ECS service to run"
  type        = number
  default     = 1
}

variable "nginx_image" {
  description = "Docker image for Nginx (e.g., your-repo/ecs-nginx:latest)"
  type        = string
  default     = ""
} 