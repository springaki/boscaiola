ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'faker'
require 'capybara/poltergeist'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.reload
    DatabaseRewinder.clean_all
  end

  config.before(:each) do
    DatabaseRewinder.start
  end

  config.after do
    DatabaseRewinder.clean
  end

  config.include FactoryGirl::Syntax::Methods
end
