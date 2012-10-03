Fog.credentials_path = Rails.root.join('config/fog_credentials.yml')

fog_directory = Rails.env == 'production' ? 'new-context' : 'new-context-dev'

CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_credentials = { :provider => 'AWS' }
  config.fog_directory = fog_directory

end
