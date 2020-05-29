data "aws_iam_policy_document" "datasource_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      identifiers = [
        "appsync.amazonaws.com",
      ]
      type = "Service"
    }
  }
}

resource "aws_iam_role" "lambda_datasource_role" {
  assume_role_policy = data.aws_iam_policy_document.datasource_assume_role.json
  name               = "${var.role_name_prefix}appsync-${var.name}-datasource"
}

resource "aws_iam_role_policy_attachment" "invoke_lambda" {
  policy_arn = var.invoke_lambda_policy_arn
  role       = aws_iam_role.lambda_datasource_role.name
}

resource "aws_appsync_datasource" "lambda_datasource" {
  api_id      = var.api_id
  description = var.description

  lambda_config {
    function_arn = var.lambda_function_arn
  }

  name             = var.name
  service_role_arn = aws_iam_role.lambda_datasource_role.arn
  type             = "AWS_LAMBDA"
}

