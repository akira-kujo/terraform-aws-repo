# local values
# these are variabalised from the names of the variables
locals {
    owners = var.business_division
    environment = var.environment
    # name = "${var.business_division}=${var.environment}"
    name = "${local.owners}-${local.environment}"
    common_tags = {
        owners = local.owners
        environment = local.environment

        tags = local.common_tags
        vpc_tags = local.common_tags
    }
}