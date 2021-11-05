module aws_reverse_proxy {
  # Available inputs httpsgithub.comfuturiceterraform-utilstreemasteraws_reverse_proxy#inputs
  # Check for updates httpsgithub.comfuturiceterraform-utilscomparev11.0...master
  source = gitsshgit@github.comfuturiceterraform-utils.gitaws_reverse_proxyref=v11.0

  origin_url             = httpexample.com           # note that this is just a dummy value to satisfy CloudFront, it won't ever be used with the override_ variables in place
  site_domain            = ${var.redirect_domain}
  name_prefix            = ${var.name_prefix}
  comment_prefix         = ${var.comment_prefix}
  cloudfront_price_class = ${var.cloudfront_price_class}
  viewer_https_only      = ${var.viewer_https_only}
  lambda_logging_enabled = ${var.lambda_logging_enabled}
  tags                   = ${var.tags}

  add_response_headers = {
    Strict-Transport-Security = ${var.redirect_with_hsts  max-age=31557600; preload  }
    Location                  = ${var.redirect_url}
  }

  override_response_status             = ${var.redirect_permanently  301  302}
  override_response_status_description = ${var.redirect_permanently  Moved Permanently  Found}

  override_response_body = EOF
  !doctype html
  html lang=en
  head
    meta charset=utf-8
    titleRedirectingtitle
  head
  body
    preRedirecting to a href=${var.redirect_url}${var.redirect_url}apre
  body
  EOF
}