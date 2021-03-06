root_dir = File.expand_path("#{File.dirname(__FILE__)}/..").sub(/^#{Dir.getwd}/, '.')
$:.unshift "#{root_dir}/lib"
$:.unshift "#{root_dir}/test"

require 'rubygems'
require 'spec'
require 'dm-core'
require 'models'

# connect to test db
DataMapper.setup(:default, "sqlite3::memory:")
DataMapper.auto_migrate!
