require_relative 'lib/bar_search/version'

Gem::Specification.new do |spec|
  spec.name          = "bar_search"
  spec.version       = BarSearch::VERSION
  spec.authors       = ["lexisandoval"]
  spec.email         = ["lexi.sandoval9@gmail.com"]

  spec.summary       = %q{Bar Search}
  spec.description   = %q{Search for bars in Chicago!}
  spec.homepage      = "https://github.com/lexisandoval/bar_search"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lexisandoval/bar_search"
  spec.metadata["changelog_uri"] = "https://github.com/lexisandoval/bar_search/commits/main"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

end
