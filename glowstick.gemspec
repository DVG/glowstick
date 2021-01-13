$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "glowstick/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "glowstick"
  spec.version     = Glowstick::VERSION
  spec.authors     = ["Bradley Temple"]
  spec.email       = ["bradley.temple@gmail.com"]
  spec.homepage    = "https://github.com/DVG/glowstick"
  spec.summary     = "Sync ActiveRecord Objects Across Installations With Ease"
  spec.description = "Sync ActiveRecord Objects Across Installations With Ease"
  spec.license     = "MIT"


  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"

  spec.add_development_dependency "sqlite3"
end
