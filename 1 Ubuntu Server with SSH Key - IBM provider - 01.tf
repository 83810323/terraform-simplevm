#################################
#				#
#   mi servidor ubuntu		#
#				#
#  para Cloud Schematics	#
#				#
#################################
#
# IBM Cloud Provider →  https://ibm-bluemix.github.io/tf-ibm-docs/
#
# variables in variables.tf
# values for variables in terraform.tfvars 
#
	provider "ibm" {
		softlayer_username = "${var.username}"
		softlayer_api_key  = "${var.api_key}"
}
#
	resource "ibm_compute_ssh_key" "ssh_key_fernando_ibm" {
		name       = "ssh_key_fernando_ibm"
		notes      = "clave pública de Fernando Arribas Uguet creada con provider ibm"
		public_key = "${var.public_key}"
}
#
	resource "ibm_compute_vm_instance" "ubuntu_chiquitito" {
		hostname				= "${var.hostname}"
		os_reference_code		= "UBUNTU_16_64"
        	domain				= "arcadia.ibm.com"
        	datacenter			= "PAR01"
        	network_speed			= 100
        	hourly_billing			= true
          private_network_only	= false
		cores				= 2
        	memory				= 4096
        	disks				= ["25","10","20"]
		user_metadata			= "{\"value\":\"newvalue\"}"
		dedicated_acct_host_only	= true
		local_disk			= false
		ssh_keys				=["${ibm_compute_ssh_key.ssh_key_fernando_ibm.id}"]
#		provisioner "local-exec" {command = "apt-get update > /tmp/ubuntu_update.txt" on_failure = "continue"}
#		provisioner "local-exec" {command = "apt-get -y install xosview xsysinfo >> /tmp/ubuntu_update.txt" on_failure = "continue"}
}
#
##############################################################################
# Variables
##############################################################################
variable username {
  description = "Softlayer username"
}
variable api_key {
  description = "Softlayer API Key"
}
variable public_key {
  description = "Public SSH key"
}
variable hostname {
  description = "hostname"
}
##############################################################################
# Outputs
##############################################################################
output "ip" {
  value = "${ibm_compute_vm_instance.ubuntu_chiquitito.id.ipv4_address}"
}
##############################################################################
# A complete list of the OS reference codes available (use your API key as the password to log in):
#
# https://api.softlayer.com/rest/v3/SoftLayer_Virtual_Guest_Block_Device_Template_Group/getVhdImportSoftwareDescriptions.json?objectMask=referenceCode
#
#		os_reference_code			= "CENTOS_6_32"
#		os_reference_code			= "CENTOS_6_64"
#		os_reference_code			= "CENTOS_7_64"
#		os_reference_code			= "DEBIAN_8_32"
#		os_reference_code			= "DEBIAN_8_64"
#		os_reference_code			= "REDHAT_6_32"
#		os_reference_code			= "REDHAT_6_64"
#		os_reference_code			= "REDHAT_7_64"
#		os_reference_code			= "UBUNTU_10_32"
#		os_reference_code			= "UBUNTU_10_64"
#		os_reference_code			= "UBUNTU_12_32"
#		os_reference_code			= "UBUNTU_12_64"
#		os_reference_code			= "UBUNTU_14_32"
#		os_reference_code			= "UBUNTU_14_64"
#		os_reference_code			= "UBUNTU_16_64"
#		os_reference_code			= "WIN_2003-STD-SP2-5_32"
#		os_reference_code			= "WIN_2003-STD-SP2-5_64"
#		os_reference_code			= "WIN_2008-STD-R2-SP1_64"
#		os_reference_code			= "WIN_2012-STD_64"
#		os_reference_code			= "WIN_2016-STD_64"
##########################
#					#
#    Data Centers		#
#					#
#	SoftLayer			#
#					#
#					#
##########################
##		AMS01 - Amsterdam
##		AMS03 - Amsterdam
##		CHE01 - Chennai
##		DAL01 - Dallas
##		DAL05 - Dallas
##		DAL06 - Dallas
##		DAL09 - Dallas
##		DAL10 - Dallas
##		DAL12 - Dallas
##		DAL13 - Dallas
##		FRA02 - Frankfurt
##		HKG02 - Hong Kong
##		HOU02 - Houston
##		LON02 - London
##		LON04 - London
##		MEL01 - Melbourne
##		MEX01 - Queretaro
##		MIL01 - Milan
##		MON01 - Montreal
##		OSL01 - Oslo
##		PAR01 - Paris
##		SAO01 - Sao Paulo
##		SEA01 - Seattle
##		SEO01 - Seoul
##		SJC01 - San Jose
##		SJC03 - San Jose
##		SJC04 - San Jose
##		SNG01 - Singapore
##		SYD01 - Sydney
##		SYD04 - Sydney
##		TOK02 - Tokyo
##		TOR01 - Toronto
##		WDC01 - Washington, DC
##		WDC04 - Washington, DC
##		WDC06 - Washington, DC
##		WDC07 - Washington, DC 
