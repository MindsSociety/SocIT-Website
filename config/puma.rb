rails_env = 'production'
environment rails_env

pidfile "#{Dir.pwd}/tmp/pids/puma.pid"
state_path "#{Dir.pwd}/tmp/pids/puma.pid.state"

# Change workers to match CPU core count
workers 8
threads 0, 16

bind "unix://#{Dir.pwd}/tmp/sockets/puma.sock"

activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{Dir.pwd}/config/database.yml")[rails_env])
end

