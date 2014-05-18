require "simplecov"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]
SimpleCov.start { add_filter "/spec/" }

require "lita-ey-info"
require "lita/rspec"
