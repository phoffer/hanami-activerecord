require 'rake'
# require 'hanami/rake_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs    << 'spec'
  t.warning = false
end

task default: :test
task spec: :test

require 'active_record_migrations'
ActiveRecordMigrations.configure do |c|
  c.schema_format = :sql # default is :ruby
  c.yaml_config = 'config/database.yml'
end

ActiveRecordMigrations.load_tasks
