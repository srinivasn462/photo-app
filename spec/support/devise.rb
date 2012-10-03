Rspec.configure do |config|
  config.extend ControllerMacros, :type => :controller
  config.include Devise::TestHelpers, :type => :controller
end
