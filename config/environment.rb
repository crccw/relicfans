# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load config file
RF_CONFIG = YAML.load_file(Rails.root.join('config','relicfans.yml'))[Rails.env]

# Initialize the Rails application.
Rails.application.initialize!
