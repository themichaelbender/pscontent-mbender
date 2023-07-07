/*
 ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ 
     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     
     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌▐░▌          ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     
     ▐░▌     ▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌▐░▌          ▐░░░░░░░░░░░▌     ▐░▌     
     ▐░▌     ▐░█▀▀▀▀█░█▀▀ ▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌▐░▌          ▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     
     ▐░▌     ▐░▌     ▐░▌  ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     
 ▄▄▄▄█░█▄▄▄▄ ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌     ▐░▌     
▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌     ▐░▌     
 ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀       ▀      
*/

################################################Global Settings and Variables#############################################
###Standard PS AWS Setup REQUIRED TO USE US-WEST-2
variable "region" {
  default = "us-west-2"
 
}
 
provider "aws" {
  region = var.region
  # REMOVE THIS KEY BEFORE UPLOADING TO PS AUTHOR PLATFORM
  #access_key = ""
  #secret_key = ""
}
 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

###############################################################################################

### Requires the Random Provider- creats a random string thank can server a variety of ues, s3 buckets and passwords alike.
resource "random_string" "version" {
  length  = 8
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "random_string" "user_name" {
  length  = 4
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "random_string" "password" {
  length = 16
  special = true
  min_upper = 1
  min_numeric = 1
  min_special = 1
  override_special = "!"
}

##################################################################START PKI KEY CONFIGURATION##########################################
resource "tls_private_key" "pki" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}

output "private_key_pem" {
  value  = tls_private_key.pki.private_key_pem
  sensitive = true
}

resource "local_file" "pki" {
    content     = tls_private_key.pki.private_key_pem
    filename = "$HOME/.ssh/lab-key"
    file_permission = "0600"
}

resource "aws_key_pair" "terrakey" {
  key_name   = "lab-key"
  public_key = tls_private_key.pki.public_key_openssh
}

##################################################################END PKI KEY CONFIGURATION##########################################
#
#
#
##################################################################Networking Configurations##########################################
#
# Variable used in the creation of the `lab_vpc_internet_access` resource
variable "cidr_block" {
  default = "0.0.0.0/0"
}

# Custom VPC shows the use of tags to name resources
# Instance Tenancy set to `default` is not to be confused with the concept of a Default VPC
###NETWORKING----> add subnets here within vpc scope
resource "aws_vpc" "lab_vpc" {
  cidr_block       = "172.31.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy = "default"

  tags = {
    Name = "Lab VPC"
  }
}
#external security groupingfor vpc global scope
#Currently allowing all ssh in to any device...all ec2 instances are using the generated keypair.

resource "aws_security_group" "ssh_console" {
  name   = "ssh_console"
  vpc_id = aws_vpc.lab_vpc.id
#lock down to egress only to internal subnets generated in this lab! ~add to automation.
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.31.245.222/32"]
  }
  

# For Tudor Cluster & internal guac option

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.245.223/32","52.42.34.111/32","35.162.190.211/32","52.36.220.5/32","99.69.210.192/32"]
  }

}

resource "aws_security_group" "rdp_console" {
  name   = "rdp_console"
  vpc_id = aws_vpc.lab_vpc.id
#lock down to egress only to internal subnets generated in this lab! ~add to automation.

egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.31.0.0/16"]
  }

ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.31.0.0/16"]
  }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.31.245.222/32"]
  }

    ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["172.31.245.223/32","52.42.34.111/32","35.162.190.211/32","52.36.220.5/32","99.69.210.192/32"]
  }

}


resource "aws_security_group" "proxy" {
  name   = "proxy_rules"
  vpc_id = aws_vpc.lab_vpc.id

#lock down to egress only to internal subnets generated in this lab! ~add to automation.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# Custom Internet Gateway - not created as part of the initialization of a VPC

resource "aws_internet_gateway" "lab_vpc_gateway" {
  vpc_id = aws_vpc.lab_vpc.id
}

# Create a Route in the Main Routing Table - no need to create a Custom Routing Table
# Use `main_route_table_id` to pull the ID of the main routing table

resource "aws_route" "lab_vpc_internet_access" {
  route_table_id         = aws_vpc.lab_vpc.main_route_table_id
  destination_cidr_block = var.cidr_block
  gateway_id             = aws_internet_gateway.lab_vpc_gateway.id
}

#proxy subnet
resource "aws_subnet" "subnet_proxy" {

  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "172.31.245.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

}

# Add a consoles subnet unless specifically required otherwise.  172.31.37-47.0


# VPC Subnet B - endpoint subnet  172.31.24.0/24
resource "aws_subnet" "subnet_consoles" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "172.31.24.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
}

# VPC Subnet B - endpoint subnet  172.31.64-74.0/24
resource "aws_subnet" "subnet_enva" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "172.31.37.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
}

#Console Subnet. Where the user engages on console or directly to the EC2. Separated from other resources intentionally.
resource "aws_subnet" "subnet_envb" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = "172.31.64.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"
}

###############################################################SSM IAM ROLE STUFF############################################################################################################


/*
     ___      .___  ___.  __   __     _______.
    /   \     |   \/   | |  | (_ )   /       |
   /  ^  \    |  \  /  | |  |  |/   |   (----`
  /  /_\  \   |  |\/|  | |  |        \   \    
 /  _____  \  |  |  |  | |  |    .----)   |   
/__/     \__\ |__|  |__| |__|    |_______/ 

*/
##############################################################EC2 Endpoint Configurations#####################################################################################################
#######################finding CURRENT AMI's for supported operating systems, does not hurt anything to leave in #############################################################################
##############################################################################################################################################################################################

data "aws_ami" "u20" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}


#Windows!
data "aws_ami" "w19" {
     most_recent = true     
filter {
       name   = "name"
       values = ["Windows_Server-2019-English-Full-Base-*"]  
  }     
filter {
       name   = "virtualization-type"
       values = ["hvm"]  
  }     
owners = ["801119661308"] # Canonical
}

/*
  ___ _               _    _      _   _     ___ ___ ___ 
 | _ \ |_  _ _ _ __ _| |__(_)__ _| |_| |_  | __/ __|_  )
 |  _/ | || | '_/ _` | (_-< / _` | ' \  _| | _| (__ / / 
 |_| |_|\_,_|_| \__,_|_/__/_\__, |_||_\__| |___\___/___|
                            |___/
*/                            
###############################Define EC2 INstances##################################################################################
#Include templates and then create matching template files#
#console box script
###### All template files mapped with required variables################
/*
##########SAME FOR EVERY LAB############################################################################
  ___ ___  _____      ___   ___ ___    ___ ___  _____  ____   __
 | __/ _ \| _ \ \    / /_\ | _ \   \  | _ \ _ \/ _ \ \/ /\ \ / /
 | _| (_) |   /\ \/\/ / _ \|   / |) | |  _/   / (_) >  <  \ V / 
 |_| \___/|_|_\ \_/\_/_/ \_\_|_\___/  |_| |_|_\\___/_/\_\  |_|
*/
###############PROXY TEMPLATE && PROXY EC2 #############################################################
data "template_file" "forward-proxy" {
  template = file("forward-proxy.sh")
}

# proxy boxy with tinyproxy
resource "aws_instance" "forward-proxy" {
  ami                         = data.aws_ami.u20.id
  associate_public_ip_address = true
  disable_api_termination     = false
  ebs_optimized               = false
  get_password_data           = false
  hibernation                 = false
  instance_type               = "t2.micro"
  private_ip                  = "172.31.245.222"
  ipv6_address_count          = 0
  ipv6_addresses              = []
  monitoring                  = false
  subnet_id                   = aws_subnet.subnet_proxy.id
  key_name                    = aws_key_pair.terrakey.key_name
  vpc_security_group_ids      = [aws_security_group.proxy.id]
  tags = {
    Name = "forward-proxy"
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"
  }
  user_data = data.template_file.forward-proxy.rendered
  timeouts {}
}




#########################################################################################
###############CONSOLES##################################################################

#####################################################################################################
/*
 __      _____ _  _     ___ ___  ___      ___ ___  _  _ ___  ___  _    ___ 
 \ \    / /_ _| \| |___| _ \   \| _ \___ / __/ _ \| \| / __|/ _ \| |  | __|
  \ \/\/ / | || .` |___|   / |) |  _/___| (_| (_) | .` \__ \ (_) | |__| _| 
   \_/\_/ |___|_|\_|   |_|_\___/|_|      \___\___/|_|\_|___/\___/|____|___|
*/
######################RDP Windows####################################################################

##### Windows 2019 RDP ################################################################################################
#creating EC2 instance resource Client01
data "template_file" "win-rdp-console" {
    template = file("win-rdp-console")
    vars = {
      win_rdp_password = "${random_string.password.result}"
      guac_auth_password = "${random_string.version.result}"
    }
}

##### Windows 2019 RDP ################################################################################################
#creating EC2 instance resource Client01

resource "aws_instance" "win-rdp-console" {
  ami                         = data.aws_ami.w19.id
  associate_public_ip_address = true
  disable_api_termination     = false
  ebs_optimized               = false
  get_password_data           = true
  hibernation                 = false
  instance_type               = "t2.medium"
  ipv6_address_count          = 0
  ipv6_addresses              = []
  private_ip                  = "172.31.24.5"
  monitoring                  = false
  subnet_id                   = aws_subnet.subnet_consoles.id #subnet is allowed rdp inbound and to access other devices.
  key_name                    = aws_key_pair.terrakey.key_name
  vpc_security_group_ids      = [aws_security_group.rdp_console.id]
  user_data                   = data.template_file.win-rdp-console.rendered
  #iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  tags = {
    Name = "Client01"
    Protocol = "rdp"
    Username = "administrator"
    Password = "${random_string.password.result}"
    Security = "nla"
    Ignore-Cert = "true"
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens = "required"
  }

  timeouts {}

}

###########################################################################################################################

#######################################################


############################################## win rdp outputs and files#################################################################################



#####################EOL WIN 1


output "exec_time" {
  value = timestamp()
}

#EOL
