require "faraday"
require "faraday_middleware"
require "recursive-open-struct"
require "carve/version"
require "carve/document"
require "carve/event"

module Carve
  extend self

  def request=(request)
    @request = request
  end

  def request
    @request || setup_request!
  end

  def secret_api_key=(secret_api_key)
    @secret_api_key = secret_api_key
    setup_request!

    @secret_api_key
  end

  def secret_api_key
    return @secret_api_key if @secret_api_key
    ENV['CARVE_SECRET_API_KEY'] || "missing_secret_api_key"
  end

  def api_version=(api_version)
    @api_version = api_version
    setup_request!

    @api_version
  end

  def api_version
    return @api_version if @api_version
    0
  end

  def _root_url=(_root_url)
    @_root_url = _root_url
  end

  def _root_url
    return @_root_url if @_root_url
    "https://carve.herokuapp.com"
  end

  def api_endpoint
    [_root_url, "/api/v", api_version].join
  end

  private

  def setup_request!
    options = {
      headers:  {'Accept' => "application/json"},
      ssl:      {:verify => false},
      url:      Carve.api_endpoint
    }

    Carve.request = ::Faraday::Connection.new(options) do |builder|
      builder.use     ::Faraday::Request::UrlEncoded
      builder.use     ::FaradayMiddleware::ParseJson
      builder.adapter ::Faraday.default_adapter
    end

    Carve.request.basic_auth(Carve.secret_api_key, '')

    Carve.request
  end
end
