require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Gator3
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'UTC'
    config.encoding = 'utf-8'
    config.filter_parameters += [:password, :password_confirmation]
    # config.api_only = false

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :en

    config.autoload_paths += %W(
      #{Rails.root}/app/services/
      #{Rails.root}/lib/modules
      #{Rails.root}/lib/
    )

    config.eager_load_paths += %W(
      #{Rails.root}/app/services/
      #{Rails.root}/lib/modules/
      #{Rails.root}/lib/
    )

    config.active_record.raise_in_transactional_callbacks = true
  end
end
