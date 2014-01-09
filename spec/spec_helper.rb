require 'simplecov'

SimpleCov.profiles.define 'gem' do
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/vendor/'

  add_group 'Libraries', '/lib/'
end

SimpleCov.start 'gem'

require 'bundler/setup'
require 'vcloud/core'
require 'support/stub_fog_interface.rb'


SimpleCov.at_exit do
  SimpleCov.result.format!
  # do not change the coverage percentage, instead add more unit tests to fix coverage failures.
  if SimpleCov.result.covered_percent < 68
    print "ERROR::BAD_COVERAGE\n"
    print "Coverage is less than acceptable limit(70%). Please add more tests to improve the coverage"
    exit(1)
  end
end