# Rack::WWWme

## About
Rack::WWWme is an easy way to automatically redirect root domain requests to use www, using Rack.

## Why?
Rack::WWWme was created to solve a very simple problem. At Klubensapps we needed an in-house solution to redirect root domain requests to www. Thus we hacked together Rack::WWWme as an extremely simplistic solution. After we were done, we threw it up on Heroku with a couple line rackup file and everything magically worked. We've open-sourced Rack::WWWme, along with our rackup file (see "Usage" below), so that other cloud-friendly developers would finally have an easy way to redirect root domain requests to use www.

## Usage
Using Rack::WWWme is simple! Just include `gem 'rack-wwwme', :git => 'git://github.com/klubensapps/rack-wwwme.git'` in your Gemfile. Then add the following line the your `config.ru` file *after any run statements*:

	use Rack::WWWme

That's it! Enjoy the freedom of root domain to www redirection!

**Our Experience:** We've deployed Rack::WWWme to Heroku using the following rackup file, a Gemfile, and Heroku's custom domain functionality. Basically all we did was deploy an app containing the following rackup file (and a Gemfile, of course) to Heroku and then add the respective root domains to Heroku's that we wanted to redirect to use www.

*Our config.ru file*:

	# Require Rack::WWWme
	require 'rack/wwwme'
	
	# Run failsafe response in case WWWme fails
	run lambda { |env| [200, { 'Content-Type' => 'text/plain' }, ['Error: Server failed to redirect user. Please try typing "www." infront of the URL.'] ] }

	# Run WWWme
	use Rack::WWWme

## Contributing
Feel free to fork and submit pull requests on Rack::WWWme, we'd love to see how you would expand on what we've built!
