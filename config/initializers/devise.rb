# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  if Rails.env.development? || Rails.env.test?
    config.secret_key = '04671846f794e5df0e032abb7d3d3876016f1cf0a1ced726429b2807c798de67f08035cc45e953eca23e08661a7f8030f4bcaec91ef184d89f4c721b5925d36b'
  else
    config.secret_key = ENV['DEVISE_SECRET_KEY'] || ENV["SECRET_KEY_BASE"]
  end

  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  config.router_name = :faalis
  #
  # When using omniauth, Devise cannot automatically set Omniauth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
