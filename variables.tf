variable "cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
}

variable "task_family" {
  description = "Family of the Task Definition"
  type        = string
}

variable "network_mode" {
  description = "Network mode for the Task Definition"
  type        = string
  default     = "awsvpc"
}

variable "task_cpu" {
  description = "The amount of CPU used by the task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "The amount of memory used by the task"
  type        = string
  default     = "512"
}

variable "container_definitions" {
  description = "The container definitions for the task"
  type        = list(any)
}

variable "service_name" {
  description = "Name of the ECS Service"
  type        = string
}

variable "service_desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "List of subnets in which tasks can be run"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups to associate with the tasks"
  type        = list(string)
}
