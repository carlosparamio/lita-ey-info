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
```

## Usage

```
You: @Lita ey envs
You: @Lita ey <app_name> <env_name> servers
You: @Lita ey <app_name> <env_name> logs
You: @Lita ey <app_name> <env_name> status
```

## See also

[lita-ey-deploy](http://github.com/carlosparamio/lita-ey-deploy)

## License

[MIT](http://opensource.org/licenses/MIT)