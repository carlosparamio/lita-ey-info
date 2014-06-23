require "spec_helper"

describe Lita::Handlers::EyInfo, lita_handler: true do
  it { routes_command("ey envs").to(:list_envs) }
  it { routes_command("ey info").to(:list_envs) }
  it { routes_command("ey servers appname envname").to(:list_servers) }
  it { routes_command("ey logs appname envname").to(:show_logs) }
  it { routes_command("ey status appname envname").to(:show_status) }
end
