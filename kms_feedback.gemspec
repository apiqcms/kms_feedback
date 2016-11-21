$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/feedback/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_feedback"
  s.version     = Kms::Feedback::VERSION
  s.authors     = ["Alexandr Nigomatulin", "Igor Petrov"]
  s.email       = ["info@webgradus.ru"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "KMS extension for feedback/callback/contact forms"
  s.description = "KMS extension allowing to have feedback/callback/contact forms on your website"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "recaptcha"
  s.add_dependency 'kms', ">= 0.6.0"

  s.add_development_dependency 'combustion', '~> 0.5.4'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'rspec-rails', '~> 3.5.0'
end
