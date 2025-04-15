variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "nginx_image" {
  description = "Docker image for Nginx (e.g., your-repo/ecs-nginx:latest)"
  type        = string
  default     = ""
} 