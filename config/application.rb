require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LineBotYuan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    Rails.application.config.i18n.default_locale = :"zh-TW"
    Rails.application.config.i18n.locale = :"zh-TW"  
    Rails.application.config.time_zone = "Taipei"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
