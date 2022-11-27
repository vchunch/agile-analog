resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "ElectronicSubsystem"
  billing_mode   = "PROVISIONED"
  read_capacity  = 100
  write_capacity = 100
  hash_key       = "UserId"
  range_key      = "ItemTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "ItemTitle"
    type = "S"
  }

}