require "lita"

module Lita
  module Handlers
    class EyInfo < Handler

      route(/ey envs/i, :list_envs, restrict_to: :ey_admins, command: true, help: {
        "ey envs" => "Display list of all applications and environments."
      })

      route(/ey (\w*) (\w*) servers/i, :list_servers, restrict_to: :ey_admins, command: true, help: {
        "ey <app> <env> servers" => "Display list of all servers for an application environment."
      })

      route(/ey (\w*) (\w*) logs/i, :show_logs, restrict_to: :ey_admins, command: true, help: {
        "ey <app> <env> logs" => "Retrieve the latest logs for an application environment."
      })

      route(/ey (\w*) (\w*) status/i, :show_status, restrict_to: :ey_admins, command: true, help: {
        "ey <app> <env> status" => "Show the deployment status of the application environment."
      })

      def self.default_config(config)
        config.api_token = ""
      end

      def self.namespace
        "ey"
      end

      def list_envs(response)
        response.reply "I've sent you the apps and environments list privately... shhhh..." unless response.message.source.private_message?
        response.reply_privately `bundle exec ey environments --all --api-token=#{config.api_token}`
      end

      def list_servers(response)
        app = response.matches[0][0]
        env = response.matches[0][1]
        response.reply "I've sent you the servers list privately... shhhh..." unless response.message.source.private_message?
        response.reply_privately `bundle exec ey servers --app=#{app} --environment=#{env} --api-token=#{config.api_token}`
      end

      def show_logs(response)
        app = response.matches[0][0]
        env = response.matches[0][1]
        response.reply "I've sent you the logs privately... shhhh..." unless response.message.source.private_message?
        response.reply_privately `bundle exec ey logs --app=#{app} --environment=#{env} --api-token=#{config.api_token}`
      end

      def show_status(response)
        app = response.matches[0][0]
        env = response.matches[0][1]
        response.reply "I've sent you the status info privately... shhhh..." unless response.message.source.private_message?
        response.reply_privately `bundle exec ey status --app=#{app} --environment=#{env} --api-token=#{config.api_token}`
      end

    end

    Lita.register_handler(EyInfo)
  end
end