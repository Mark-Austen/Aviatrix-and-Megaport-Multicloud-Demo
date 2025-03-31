output "aws_instance" {
  value = aws_instance.gatus_instance
}

output "azure_instance" {
  value     = azurerm_linux_virtual_machine.gatus_instance
  sensitive = true
}
