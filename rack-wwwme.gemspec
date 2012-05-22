Gem::Specification.new do |s|
  s.name        = "rack-wwwme"
  s.version     = '0.0.1'
  s.authors     = ["Robert Klubenspies"]
  s.email       = ["robert@klubensapps.com"]
  s.homepage    = "http://github.com/klubensapps/rack-wwwme"
  s.summary     = "An easy way to automatically redirect root domain requests to use www, using Rack"
  s.description = "An easy way to automatically redirect root domain requests to use www, using Rack"
  
  s.add_dependency 'rack', '>= 0.9.1'
 
  s.files       = ["lib/rack/wwwme.rb"]
end
