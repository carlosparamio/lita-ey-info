require "lita"

module Lita
  module Handlers
    class EyInfo < Handler

      route(/ey envs/i, :list_envs, restrict_to: :ey_admins, command: true, help: {
        "ey envs" => "Display list of all applications and environments."
      })

      route(/ey (\w*) servers/i, :list_servers, restrict_to: :ey_admins, command: true, help: {
        "ey <env> servers" => "Display list of all servers for an application environment."
      })

      route(/ey (\w*) logs/i, :show_logs, restrict_to: :ey_admins, command: true, help: {
        "ey <env> logs" => "Retrieve the latest logs for an application environment."
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
        response.reply retrieving_msg
        response.reply_privately `bundle exec ey environments --all --api-token=#{config.api_token}`
        response.reply private_msg unless response.message.source.private_message?
      end

      def list_servers(response)
        env = response.matches[0][0]
        response.reply retrieving_msg
        response.reply_privately `bundle exec ey servers --environment=#{env} --api-token=#{config.api_token}`
        response.reply private_msg unless response.message.source.private_message?
      end

      def show_logs(response)
        env = response.matches[0][0]
        response.reply retrieving_msg
        response.reply_privately `bundle exec ey logs --environment=#{env} --api-token=#{config.api_token}`
        response.reply private_msg unless response.message.source.private_message?
      end

      def show_status(response)
        app = response.matches[0][0]
        env = response.matches[0][1]
        response.reply retrieving_msg
        response.reply_privately `bundle exec ey status --app=#{app} --environment=#{env} --api-token=#{config.api_token}`
        response.reply private_msg unless response.message.source.private_message?
      end

      def retrieving_msg
        "Retrieving info..."
      end

      def private_msg
        "I've sent you the servers list privately... shhhh..."
      end

    end

    Lita.register_handler(EyInfo)
  end
end