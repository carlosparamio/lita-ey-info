# lita-ey-info

[![Build Status](https://travis-ci.org/carlosparamio/lita-ey-info.png?branch=master)](https://travis-ci.org/carlosparamio/lita-ey-info)
[![Code Climate](https://codeclimate.com/github/carlosparamio/lita-ey-info.png)](https://codeclimate.com/github/carlosparamio/lita-ey-info)
[![Coverage Status](https://coveralls.io/repos/carlosparamio/lita-ey-info/badge.png)](https://coveralls.io/r/carlosparamio/lita-ey-info)

**lita-ey-info** is a handler for [Lita](http://lita.io/) that displays EngineYard info.

## Installation

Add lita-ey-info to your Lita instance's Gemfile:

``` ruby
gem "lita-ey-info"
```

Don't forget to include your EngineYard API key on the lita_config.rb file:

``` ruby
  config.handlers.ey.api_token = "YOUR_EY_API_TOKEN"
  config.handlers.ey.apps = {
    "my_app_name_for_lita" => {
      "ey_name" => "my_app_name_at_ey",
      "envs" => {
        "test" => {
          ey_name: "my_app_testing",
          auth_group: "devs",
          default_branch: "develop"
        },
        "stage" => {
          ey_name: "my_app_staging",
          auth_group: "testers",
          default_branch: "stage"
        },
        "production" => {
          ey_name: "my_app_production",
          auth_group: "devops",
          default_branch: "master"
        }
      }
    }
  }
```

## Usage

```
You: @Lita ey envs
You: @Lita ey servers <app> <env>
You: @Lita ey logs <app> <env>
You: @Lita ey status <app> <env>
```

## See also

[lita-ey-deploy](http://github.com/carlosparamio/lita-ey-deploy)

## License

[MIT](http://opensource.org/licenses/MIT)
