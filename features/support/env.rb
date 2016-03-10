require 'selenium-webdriver'
require 'capybara/cucumber'
require 'rspec/expectations'
#require 'site_prism'
require 'capybara/poltergeist'
require 'appium_capybara'

DEVICE_ID = ENV['ADB_DEVICE_ARG']
APPIUM_PORT = ENV['APPIUM_PORT']
def appium_caps
  {
    'MY_DEVICE'=> { platformName: "android", deviceName: "#{DEVICE_ID}", browserName: "chrome" }
  }
end


Capybara.register_driver :appium do |app|
  caps = appium_caps.fetch('MY_DEVICE')
  desired_caps = caps
  url = "http://127.0.0.1:'#{APPIUM_PORT}'/wd/hub/" # Url to your running appium server
  appium_lib_options = { server_url: url }
  all_options = { appium_lib:  appium_lib_options, caps: desired_caps }
  Appium::Capybara::Driver.new app, all_options
end

Capybara.default_driver = :appium
