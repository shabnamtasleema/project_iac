resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
  count = var.environment == "dev"? 1 : 0
  tags = {
    tag-key = "${var.environment}"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb[0].name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.lb[0].name
  policy = data.aws_iam_policy_document.lb_ro.json
}