# local values
# these are variabalised from the names of the variables
locals {
    owners = var.business_division
    environment = var.environment
    # name = "${var.business_division}=${var.environment}"
    name = "${local.owners}-${local.environment}" //SAP-dev
    common_tags = {
        owners = local.owners // SAP from 2-generic-variables
        environment = local.environment // dev

        tags = local.common_tags
        vpc_tags = local.common_tags // values will be from locals/common_tags in local-values
    }
}