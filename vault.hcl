#/etc/vault.d/vault.hcl

storage "raft" {
  path       = "opt/vault/data"
  node_id    = "node-a-ap-southeast-1"
  retry_join = {
    auto_join = "provider=aws region=ap-southeast-1 tah_key=vault tag_value=ap-southeast-1"
  }
}
seal "awskms" {
  region = "ap-southeast-1"
  kms_key_id = "arn:aws:kms:ap-southeast-1:"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  cluster_address = "0.0.0.0:8200"
  tls_dsable = 1
}
api_addr = "http://10.0.1.37:8200"
cluster_addr = "http://10.1.1.37:8201"
cluster_name = "vault-nasir"
ui = true
log_level = "INFO"
