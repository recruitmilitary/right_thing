$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'rubygems'
require "bundler/setup"

require 'rspec'
require 'right_thing'

RSpec.configure do
end
