desc "generate a systemd service to start pumactl"

task generate_systemd_unit: :environment do
  unless Pathname.new('bin/pumactl').exist?
    unless system 'bundle binstubs puma --path ./bin'
      puts 'Please run `bundle binstubs puma --path ./bin` before running this rake task'
    end
  end

  file_name = Rails.root.join("#{Rails.application.class.parent_name.downcase}.service")
  File.open file_name, "w" do |f|
    
    f.puts %Q{[Unit]
Description=#{Rails.application.class.parent_name}
After=network.target

[Service]
Type=simple
WorkingDirectory=#{Rails.root}
ExecStart=#{Rails.root}/bin/pumactl start
ExecReload=#{Rails.root}/bin/pumactl restart
ExecStop=#{Rails.root}/bin/pumactl stop
#{"EnvironmentFile=#{Dir.pwd if Pathname.new('.env').exist? }/.env"}
Restart=always

[Install]
WantedBy=multi-user.target}
  end
end

