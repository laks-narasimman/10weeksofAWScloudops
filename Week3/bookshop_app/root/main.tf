#creating VPC
module "vpc" {
    source = "../modules/VPC"
    project_name = var.project_name
    region           = var.region
    VPC_CIDR         = var.VPC_CIDR
    PUB_SUB_1_A_CIDR = var.PUB_SUB_1_A_CIDR
    PUB_SUB_2_B_CIDR = var.PUB_SUB_2_B_CIDR
    PRI_SUB_3_A_CIDR = var.PRI_SUB_3_A_CIDR
    PRI_SUB_4_B_CIDR = var.PRI_SUB_4_B_CIDR
    PRI_SUB_5_A_CIDR = var.PRI_SUB_5_A_CIDR
    PRI_SUB_6_B_CIDR = var.PRI_SUB_6_B_CIDR
}
#create security group
module "SG" {
  source = "../modules/SG"
  vpc_id = aws.vpc.vpc_id
  my_ip  = var.my_ip
}
