require 'bundler/setup'
require 'hanami/setup'
require 'erb'
require 'active_record'
db_config = YAML::load(ERB.new(File.read('config/database.yml')).result)[ENV['RACK_ENV']]
require_relative '../lib/hanami_activerecord/entities/application_record'
ApplicationRecord.establish_connection(db_config)
require_relative '../lib/hanami_activerecord'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'


  mailer do
    root 'lib/hanami_activerecord/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp, address: ENV['SMTP_HOST'], port: ENV['SMTP_PORT']
    end
  end
end
