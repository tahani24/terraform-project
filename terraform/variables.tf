variable "subscription_id" {
  description = "your subscription id"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources into"
  type        = string
}

variable "resource_group_name" {
  description = "The Azure resources group name"
  type        = string
}

variable "image_id" {
  description = "your image id"
  type        = string
}

variable "streamlit_port" {
  description = "The port number used by the Streamlit app"
  type        = number
}

variable "postgres_server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "postgres_admin_username" {
  description = "The admin username for PostgreSQL"
  type        = string
}

variable "postgres_admin_password" {
  description = "The admin password for PostgreSQL"
  type        = string
  sensitive   = true
}

variable "postgres_db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Storage Account (must be globally unique)"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container"
  type        = string
}
