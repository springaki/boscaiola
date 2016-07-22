ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'faker'

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

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

end
