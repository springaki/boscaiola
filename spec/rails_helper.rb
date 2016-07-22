ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
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

  config.include Devise::TestHelpers, type: :controller
  config.include LoginMacros, type: :feature
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

  Capybara.javascript_driver = :poltergeist

end
