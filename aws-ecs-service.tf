resource "aws_ecs_service" "ecs-service.nginx" {
  name            = "service-nginx"
  cluster         = module.ecs_cluster.cluster_arn
  task_definition = aws_ecs_task_definition.taskdefinition-nginx.arn
  desired_count   = 3
  # iam_role        = aws_iam_role.foo.arn
  # depends_on      = [aws_iam_role_policy.foo]
}
