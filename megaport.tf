data "megaport_location" "location_1" {
  name = "Equinix SY1"
}

data "megaport_location" "location_2" {
  name = "Global Switch Sydney West"
}

data "megaport_location" "location_3" {
  name = "Equinix SY3"
}

data "megaport_mve_images" "aviatrix" {
  vendor_filter  = "Aviatrix"
  version_filter = "7.2"
}

resource "megaport_mve" "mve_location_1" {
  product_name         = "Aviatrix Secure Edge Demo"
  location_id          = data.megaport_location.location_1.id
  contract_term_months = 1
  diversity_zone       = "blue"

  vendor_config = {
    vendor       = "aviatrix"
    product_size = "SMALL"
    image_id     = data.megaport_mve_images.aviatrix.mve_images.0.id
    cloud_init   = "<cat cloud-init.txt | base64">
  }

    vnics = [
    {
      description = "eth0 - AWS"
    },
    {
      description = "eth1 - LAN"
    },
    {
      description = "eth2 - MGMT"
    },
    {
      description = "eth3 - Azure"
    }
  ]
}

data "megaport_partner" "internet_location_1" {
  connect_type  = "TRANSIT"
  company_name  = "Networks"
  product_name  = "Megaport Internet"
  location_id   = data.megaport_location.location_2.id
}

resource "megaport_vxc" "transit_vxc_syd1" {
  product_name         = data.megaport_location.location_2.name
  rate_limit           = 1000
  contract_term_months = 1
  
  a_end = {
    requested_product_uid = megaport_mve.mve_location_1.product_uid
    vnic_index = 2
  }
  
  b_end = {
    requested_product_uid = data.megaport_partner.internet_location_1.product_uid
  }
  
  b_end_partner_config = {
    partner = "transit"
  }
}

data "megaport_partner" "aws_port_1_syd" {
  connect_type   = "AWSHC"
  company_name   = "AWS"
  product_name   = "Asia Pacific (Sydney) (ap-southeast-2)"
  location_id    = data.megaport_location.location_3.id
  diversity_zone = "blue"
}

resource "megaport_vxc" "aws_vxc_syd_1" {
  product_name         = "AWS VXC - Primary"
  rate_limit           = 50
  contract_term_months = 1

  a_end = {
    requested_product_uid = megaport_mve.mve_location_1.product_uid
    vnic_index            = 0
  }

  b_end = {
    requested_product_uid = data.megaport_partner.aws_port_1_syd.product_uid
  }

  b_end_partner_config = {
    partner = "aws"
    aws_config = {
      name          = "AWS VXC - Primary"
      type          = "private"
      connect_type  = "AWSHC"
      owner_account = var.aws_account_id
    }
  }
}

resource "megaport_vxc" "azure_vxc_syd_1" {
  product_name         = "Azure VXC - Primary"
  rate_limit           = 50
  contract_term_months = 1

  a_end = {
    requested_product_uid = megaport_mve.mve_location_1.product_uid
    vnic_index            = 3
  }

  b_end = {
    inner_vlan = 100
  }

  b_end_partner_config = {
    partner = "azure"
    azure_config = {
      port_choice = "primary"
      service_key = azurerm_express_route_circuit.expressroute_circuit_1.service_key
    }
  }
}
