output "nginx_endpoint" {
  description = "DNS name of the load balancer"
  value       = aws_lb.main.dns_name
}

output "cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.main.id
} 