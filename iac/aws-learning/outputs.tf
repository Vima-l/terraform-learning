output "bucket_name"{
  value = aws_s3_bucket.my_first_bucket.bucket
}

output "bucket_arn"{
  value= aws_s3_bucket.my_first_bucket.arn
}

output "bucket_region"{
  value= aws_s3_bucket.my_first_bucket.bucket_region
}

output "bucket_domain"{
  value = aws_s3_bucket.my_first_bucket.bucket_domain_name
}

output "my_vpc_arn"{
  value=aws_vpc.my_first_vpc.arn
}

output "my_vpc_id"{
  value = aws_vpc.my_first_vpc.id
}

output "my_pb_subnet_arn"{
  value = aws_subnet.public_subnet_1.arn
}

output "my_pb_subnet_id"{
  value = aws_subnet.public_subnet_1.id
}

output "my_pb_subnet_vpc_id" {
  value = aws_subnet.public_subnet_1.vpc_id
}

output "my_pr_subnet_arn"{
  value = aws_subnet.private_subnet_1.arn
}

output "my_pr_subnet_id"{
  value = aws_subnet.private_subnet_1.id
}

output "my_pr_subnet_vpc_id" {
  value = aws_subnet.private_subnet_1.vpc_id
}

output "my_igw_arn" {
  value = aws_internet_gateway.igw.arn
}

output "my_igw_id" {
  value = aws_internet_gateway.igw.id
}

output "my_pb_sg_arn"{
  value = aws_security_group.public_sg.arn
}

output "id"{
  value = aws_security_group.public_sg.id
}

output "my_public_sg_vpc_id" {
  value = aws_security_group.public_sg.vpc_id
}

