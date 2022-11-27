output "EC2_PUBLIC_IP" {
  value = aws_instance.agile_analog.public_ip
}

output "dynamodb_arn" {
  value = aws_dynamodb_table.basic-dynamodb-table.arn
}

output "user_arn" {
  value = aws_iam_user.newemp.*.arn
}