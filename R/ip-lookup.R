#' Perform "standard" IP lookup
#'
#' @md
#' @param ip IP address to lookup
#' @param fields When `NULL` all fields that the `ipstack_api_key` has access to
#'        will be returned. Otherwise, specify a character vector of field names
#'        according to the [API reference](https://ipstack.com/documentation#fields).
#' @param hostname By default, the `ipstack` API does not return information about
#'        the hostname the given IP address resolves to. In order to include the
#'        hostname object in your API result set this to `TRUE`.
#' @param security Customers subscribed to the "Professional Plus Plan" may access
#'        the `ipstack` API's Security Module, which can be used to assess risks
#'        and threats originating from certain IP addresses before any harm can be
#'        done to a website or web application. In order to use this feature set
#'        this parameter to `TRUE`. NOTE: requests will fail if this parameter is
#'        set to `TRUE` and your plan does not have authority to access security
#'        information.
#' @param language Defaults to `en` (English). But can be [any, valid 2-letter
#'        language spec supported by the API](https://ipstack.com/documentation#language).
#' @param ssl if your plan supports making calls via `https` vs plaintet `http` set
#'        this to `TRUE`
#' @param ipstack_api_key if not placed in the `IPSTACK_API_KEY` environment
#'        variable, place it here. Otherwise, API requests fail
#' @return `list`
#' @references <https://ipstack.com/documentation>
#' @export
#' @examples \dontrun{
#' ip_lookup("155.52.187.7")
#' }
ip_lookup <- function(ip, fields = NULL,
                      hostname = FALSE,
                      security = FALSE,
                      language = "en",
                      ssl = FALSE,
                      ipstack_api_key = Sys.getenv("IPSTACK_API_KEY")) {

  scheme <- if (ssl) "https" else "http"

  httr::GET(
    url = sprintf("%s://api.ipstack.com/%s", scheme, ip),
    httr::user_agent("ipstack R pkg https://gitlab.com/hrbrmstr/ipstack"),
    query = list(
      fields = paste0(trimws(fields), collapse=","),
      hostname = as.integer(hostname),
      security = as.integer(security),
      language = language,
      access_key = ipstack_api_key
    )
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encode = "UTF-8")

  jsonlite::fromJSON(out)

}
