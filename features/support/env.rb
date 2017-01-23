require 'capybara'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'faker'
require 'logger'
require 'rspec'
require 'rspec/wait'
require 'waitutil'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.autogravity.com"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

RSpec.configure do |config|
  config.wait_timeout = 60
end

World(RSpec::Wait)
