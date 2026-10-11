data "aws_ec2_transit_gateway_route_table_propagations" "ec2_transit_gateway_route_table_propagations_lookup" {
  for_each = var.ec2_transit_gateway_route_table_propagations_lookup

  transit_gateway_route_table_id = each.value.transit_gateway_route_table_id
  region                         = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

