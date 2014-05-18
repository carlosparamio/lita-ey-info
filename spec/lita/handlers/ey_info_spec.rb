require "spec_helper"

describe Lita::Handlers::EyInfo, lita_handler: true do
  it { routes_command("ey envs").to(:list_envs) }
  it { routes_command("ey appname envname servers").to(:list_servers) }
  it { routes_command("ey appname envname logs").to(:show_logs) }
  it { routes_command("ey appname envname status").to(:show_status) }
end
