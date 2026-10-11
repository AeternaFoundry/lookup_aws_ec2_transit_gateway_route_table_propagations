variable "ec2_transit_gateway_route_table_propagations_lookup" {
  description = <<EOT
Map of ec2_transit_gateway_route_table_propagations_lookup, attributes below
Required:
    - transit_gateway_route_table_id
Optional:
    - region
    - filter (block):
        - name (required)
        - values (required)
EOT

  type = map(object({
    transit_gateway_route_table_id = string
    region                         = optional(string)
    filter = optional(list(object({
      name   = string
      values = set(string)
    })))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

