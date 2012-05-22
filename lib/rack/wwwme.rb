require 'rack'

module Rack
  class WWWme
    def initialize(app)
      @app = app
    end
  
    def call(env)
      # Thanks to https://github.com/atmos/rack-redirect for inspiring the code used here
    
      # Grab the domain name user is looking for
      uri = env['SERVER_NAME']
    
      # Extract the TLD, address, and subdomain the user is looking for
      uri_components = uri.split(".")
      uri_tld, uri_address, uri_subdomain = uri_components.pop, uri_components.pop, uri_components.pop
      
      # Is the user looking for the root domain?
      if uri_subdomain == nil
        # If so build a redirect to www URI w/ path and query params
        redirect  = "#{env['rack.url_scheme']}://www.#{uri_address}.#{uri_tld}"
        redirect << "#{env['PATH_INFO']}"
        redirect << "?#{env['QUERY_STRING']}" unless env['QUERY_STRING'].empty?
        
        # And intiate said redirect
        [301, {'Location' => redirect}, ["Redirecting you to #{redirect}"]]
      end
    end
  end
end