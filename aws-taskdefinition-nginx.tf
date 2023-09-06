resource "aws_ecs_task_definition" "taskdefinition-nginx" {
  family = "am-nginx"
  container_definitions = jsonencode([
    {
      name      = "webserver"
      image     = "docker.io/nginx"
      cpu       = 50
      memory    = 200
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}
