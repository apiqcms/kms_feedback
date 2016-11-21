require "recaptcha/rails"
module Kms
  module Feedback
    class Engine < ::Rails::Engine
      engine_name 'kms_feedback'
      isolate_namespace Kms::Feedback
      # config.autoload_paths += Dir["#{config.root}/lib/**/"]
      config.assets.paths += Dir["#{config.root}/vendor/assets/bower_components"]

      config.to_prepare do
        Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
          require_dependency(c)
        end
      end
    end
  end
end
