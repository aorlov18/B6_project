variable "yandex_folder_id" {                                                               
  type    = string                                                                          
  default = "b1g2d41pq9qq6kcdtgoj"                                                                           
}
variable "yandex_cloud_id" {                                                               
  type    = string                                                                          
  default = "b1goral11t4lro8uppkv" 
}

#variable "ssh_credentials" {
#  description = "Credentials for connect to instances"
#  type        = object({
#    user        = string
#    private_key = string
#    pub_key     = string
#  })
#  default     = {
#    user        = "user"
#    private_key = "~/.ssh/id_rsa"
#    pub_key     = "~/.ssh/id_rsa.pub"
#  }
#}