$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tkh_menus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tkh_menus"
  s.version     = TkhMenus::VERSION
  s.authors     = ["Swami Atma"]
  s.email       = ["swami@TenThousandHours.eu"]
  s.homepage    = "https://github.com/allesklar/tkh_menus"
  s.summary     = "Menu engine for the TKH CMS."
  s.description = "A Rails engine that generates menus dynamically.."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency 'stringex'
  s.add_dependency "simple_form"
  s.add_dependency 'globalize'

  s.add_development_dependency "sqlite3"
end
