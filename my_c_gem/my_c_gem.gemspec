Gem::Specification.new do |spec|
	spec.name          = "my_c_gem"
	spec.version       = '1.0.0' 
	spec.authors       = ["yamshing"]
	spec.email         = ["yamshing@..."]

	spec.summary       = %q{My first C gem}
	spec.description   = %q{This does nothing}
	spec.homepage      = ""
	spec.license       = "MIT"

	spec.files         = [] 
	spec.files         = %w[
	ext/my_c_gem/extconf.rb
	ext/my_c_gem/my_c_gem.c
	]
	spec.require_paths = ["lib"]
	spec.extensions = %w[ext/my_c_gem/extconf.rb]

	spec.add_development_dependency "bundler", "~> 1.10"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "minitest"
end
