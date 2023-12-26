resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "task_def" {
  family                   = var.task_family
  network_mode             = var.network_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode(var.container_definitions)
}

resource "aws_ecs_service" "service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.task_def.arn
  desired_count   = var.service_desired_count

  network_configuration {
    subnets = var.subnets
    security_groups = var.security_groups
  }
}
