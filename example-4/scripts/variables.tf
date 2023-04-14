# Sets global variables for this Terraform project.
variable app_name {
    default = "flixtube"
}

variable name_register {
    default = "flixtubebanco"
}

variable location {
  default = "South Central US"
}

variable admin_username {
  default = "linux_admin"
}

variable app_version { # Can't be called version! That's a reserved word.
}

variable client_id {
  default = "a71b0b05-3164-429d-9507-e6cffb2a7b16"
}

variable client_secret {
  default = "Dob8Q~X7NslvMAxQKoACCtcKAprP7Ks17XIpsdnE"
}
