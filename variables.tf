// Megaport - AWS variables

variable "megaport_aws_port_location_1_name" {
  description = "AWS Direct Connect Hosted VIF port name"
  default     = "Asia Pacific (Sydney) (ap-southeast-2)"
}

variable "megaport_aws_port_location_1_diversity_zone" {
  description = "AWS Direct Connect Port 1 Diversity Zone"
  default     = "blue"
}

variable "megaport_aws_vxc_1_name" {
  description = "Megaport AWS VXC name"
  default     = "AWS Hosted Connection VXC SYD - Primary"
}

variable "megaport_aws_vxc_1_bandwidth" {
  description = "Megaport AWS VXC bandwidth"
  default     = 50
}

variable "megaport_aws_vxc_1_term" {
  description = "Megaport AWS VXC term"
  default     = 1
}

variable "megaport_aws_vxc_1_local_address" {
  description = "Megaport AWS VXC local address"
  default     = "192.168.100.1"
}

variable "megaport_aws_vxc_1_remote_address" {
  description = "Megaport AWS VXC local address"
  default     = "192.168.100.2"
}

variable "megaport_aws_vxc_1_bgp_password" {
  description = "Megaport AWS VXC BGP password"
  default     = "password"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = "<account id>"
}

// Megaport - Azure variables

variable "megaport_expressroute_vxc_1_name" {
  description = "Megaport ExpressRoute VXC name"
  default     = "Azure VXC SYD - Primary"
}

variable "megaport_expressroute_bandwidth" {
  description = "Megaport ExpressRoute VXC bandwidth"
  default     = 50
}

variable "megaport_expressroute_vxc_1_term" {
  description = "Megaport Azure VXC term"
  default     = 1
}

variable "aws_region_1" {
  default = "ap-southeast-2"
}

variable "aws_vpc_transit_1_name" {
  default = "avx-demo-vpc-syd-transit-1"
}

variable "aws_vpc_transit_1_cidr" {
  default = "10.1.0.0/16"
}

variable "aws_vpc_transit_1_subnet_1" {
  default = "10.1.1.0/24"
}

variable "aws_vpc_transi_1_subnet_1_name" {
  default = "avx-demo-vpc-syd-transit-1-subnet-1"
}

variable "aws_vpc_transit_1_route_table_1_name" {
  default = "avx-demo-vpc-syd-transit-1-route-table-1"
}

variable "aws_vpc_spoke_1_name" {
  default = "avx-demo-vpc-syd-spoke-1"
}

variable "aws_vpc_spoke_1_cidr" {
  default = "10.2.0.0/16"
}

variable "aws_vpc_spoke_1_subnet_1" {
  default = "10.2.1.0/24"
}

variable "aws_vpc_spoke_1_subnet_1_name" {
  default = "avx-demo-vpc-syd-spoke-1-subnet-1"
}

variable "aws_vpc_spoke_1_route_table_1_name" {
  default = "avx-demo-vpc-syd-spoke-1-route-table-1"
}

variable "aws_vpn_gateway_vpc_transit_1_name" {
  default = "avx-demo-vgw-syd-transit-1"
}

variable "aws_internet_gateway_vpc_transit_1_name" {
  default = "avx-demo-internet-gateway-vpc-transit-1"
}

variable "aws_internet_gateway_vpc_spoke_1_name" {
  default = "avx-demo-internet-gateway-vpc-spoke-1"
}

variable "aws_dx_gateway_1_name" {
  default = "avx-demo-dgw-1"
}

variable "aws_dx_gateway_1_asn" {
  default = "64512"
}

variable "aws_dx_vif_1_name" {
  default = "avx-demo-vif-syd-private-1"
}

variable "aws_dx_vif_customer_address" {
  default = "192.168.100.1/30"
}

variable "aws_dx_vif_amazon_address" {
  default = "192.168.100.2/30"
}

variable "aws_instance_1_name" {
  default = "avx-demo-aws-gatus-instance"
}

variable "inbound_tcp" {
  type        = map(list(string))
  description = "Inbound tcp ports for gatus instances"
  default = {
    80 = ["0.0.0.0/0"]
    22 = ["0.0.0.0/0"]
  }
}

variable "aws_owner_tag" {
  default = "MA"
}

// Azure variables

variable "azure_resource_group_name_1" {
  default = "avx-demo-rg-syd"
}

variable "azure_region_1" {
  default = "Australia East"
}

variable "azure_virtual_network_transit_1_name" {
  default = "avx-demo-vnet-syd-transit-1"
}

variable "azure_virtual_network_transit_1_cidr" {
  default = ["10.32.0.0/16"]
}

variable "azure_virtual_network_transit_1_subnet_1_name" {
  default = "avx-demo-vnet-syd-transit-1-subnet-1"
}

variable "azure_virtual_network_transit_1_subnet_1" {
  default = ["10.32.1.0/24"]
}

variable "azure_virtual_network_transit_1_gateway_subnet" {
  default = ["10.32.255.0/24"]
}

variable "azure_virtual_network_spoke_1_name" {
  default = "avx-demo-vnet-syd-spoke-1"
}

variable "azure_virtual_network_spoke_1_cidr" {
  default = ["10.33.0.0/16"]
}

variable "azure_virtual_network_spoke_1_subnet_1_name" {
  default = "avx-demo-vnet-syd-spoke-1-subnet-1"
}

variable "azure_virtual_network_spoke_1_subnet_1" {
  default = ["10.33.1.0/24"]
}

variable "azure_expressroute_circuit_1_name" {
  default = "avx-demo-expressroute-syd-1"
}

variable "azure_expressroute_circuit_1_peering_location" {
  default = "Sydney"
}

variable "azure_expressroute_circuit_1_bandwidth" {
  default = 50
}

variable "azure_expressroute_circuit_1_tier" {
  default = "Standard"
}

variable "azure_expressroute_circuit_1_family" {
  default = "MeteredData"
}

variable "azure_expressroute_circuit_1_vlan" {
  default = 100
}

variable "azure_expressroute_circuit_1_primary_subnet" {
  default = "192.168.100.0/30"
}

variable "azure_expressroute_circuit_1_secondary_subnet" {
  default = "192.168.101.0/30"
}

variable "azure_expressroute_circuit_1_bgp_password" {
  default = "password"
}

variable "azure_expressroute_gw_1_public_ip_name" {
  default = "avx-demo-er-gw-syd-1-public-ip"
}

variable "azure_expressroute_gw_1_name" {
  default = "avx-demo-er-gw-syd-1"
}

variable "azure_er_gateway_sku" {
  default = "Standard"
}

variable "azure_virtual_network_gateway_connection_1_name" {
  default = "avx-demo-er-connection-syd-1"
}

variable "azure_instance_1_name" {
  default = "avx-demo-azure-gatus-instance"
}


// Generic

variable "instance_password" {
  default = "Password_1!"
}

variable "instance_sizes" {
  type        = map(string)
  description = "Instance sizes for each cloud provider"
  default = {
    aws   = "t3.micro"
    azure = "Standard_B1ms"
  }
}

variable "gatus_interval" {
  type        = string
  description = "Interval for gatus polling (in seconds)"
  default     = "5"
}

variable "gatus_private_ips" {
  type        = map(string)
  description = "Private ips for the gatus instances"
  default = {
    aws   = "10.2.1.40"
    azure = "10.33.1.40"
  }
}
