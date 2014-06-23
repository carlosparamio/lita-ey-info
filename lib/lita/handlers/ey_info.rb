module Lita
  module Handlers
    class EyInfo < EyBase

      route(/ey (envs|info)/i, :list_envs, restrict_to: :ey_admins, command: true, help: {
        "ey envs / ey info" => "Display list of all applications and environments."
      })

      route(/ey servers (\w*) (\w*)/i, :list_servers, command: true, help: {
        "ey servers <app> <env>" => "Display list of all servers for an application environment."
      })

      route(/ey logs (\w*) (\w*)/i, :show_logs, command: true, help: {
        "ey logs <app> <env>" => "Retrieve the latest logs for an application environment."
      })

      route(/ey status (\w*) (\w*)/i, :show_status, command: true, help: {
        "ey status <app> <env>" => "Show the deployment status of the application environment."
      })

      def list_envs(response)
        response.reply retrieving_msg
        response.reply_privately `bundle exec ey environments --all --api-token=#{config.api_token}`
        response.reply private_msg unless response.message.source.private_message?
      end

      def list_servers(response)
        app = response.matches[0][0]
        env = response.matches[0][1]

        do_if_can_access(response, app, env) do
          response.reply retrieving_msg
          response.reply_privately `bundle exec ey servers --environment=#{ey_env(app, env)} --api-token=#{config.api_token}`
          response.reply private_msg unless response.message.source.private_message?
        end
      end

      def show_logs(response)
        app = response.matches[0][0]
        env = response.matches[0][1]

        do_if_can_access(response, app, env) do
          response.reply retrieving_msg
          response.reply_privately `bundle exec ey logs --environment=#{ey_env(app, env)} --api-token=#{config.api_token}`
          response.reply private_msg unless response.message.source.private_message?
        end
      end

      def show_status(response)
        app = response.matches[0][0]
        env = response.matches[0][1]

        do_if_can_access(response, app, env) do
          response.reply retrieving_msg
          response.reply_privately `bundle exec ey status --app=#{ey_app(app)} --environment=#{ey_env(app, env)} --api-token=#{config.api_token}`
          response.reply private_msg unless response.message.source.private_message?
        end
      end

    private

      def retrieving_msg
        "Retrieving info..."
      end

      def private_msg
        "I've sent you the info privately... shhhh..."
      end

    end

    Lita.register_handler(EyInfo)
  end
end
