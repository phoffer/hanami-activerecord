# Hanami with ActiveRecord

This is how to use ActiveRecord with Hanami. While this is not advised, you may find yourself in a situation in which you need AR. For me, this was needing to use PostGIS, which I had trouble configuring for Hanami-model.

## Setup

It is pretty simple to ActiveRecord working with Hanami.

1. Create application
1. Change configuration
1. Setup db

Generate the app as you normally would. This example uses Postgres, but it shouldn't matter.

All the changes necessary (including new files) are in commit [20684f4](https://github.com/phoffer/hanami-activerecord/commit/20684f41883df7857158ad38df709c052742a1fe). A sample test was added in [6bdd1d4](https://github.com/phoffer/hanami-activerecord/commit/6bdd1d4d8dffd4fcff51f7bffcc184954ec76503). 

Slightly modified steps from Hanami's [Bring Your Own ORM guide](http://hanamirb.org/guides/models/use-your-own-orm/):

* Edit your `Gemfile`, remove `hanami-model`, add the gem(s) of your ORM and run `bundle install`.
  - I just changed `hanami-model` to `activerecord`.
* Remove `lib/` directory (eg. `rm -rf lib`).
  - *I did not remove the lib directory, as I will want to use it. I will also keep the `entities` directory, and put my AR models there.*
* Edit `config/environment.rb`, then remove `require_relative '../lib/bookshelf`' and `model` block in `Hanami.configure`
  *First make both suggested changes.
  - Add `require 'active_record` to the environment file, and also the code to load ActiveRecord (see [config/environment.rb](https://github.com/phoffer/hanami-activerecord/blob/master/config/environment.rb))
* Edit `Rakefile` and remove `require 'hanami/rake_tasks'`.
  - Additionally, added code at bottom to add ActiveRecord rake tasks.

I also added a few files, which are listed below.

## New files to create

* config/database.yml
* db/seeds.rb
* entities/application_record.rb
* entities/user.rb

## Commands to run

```
rk db:create
rk db:new_migration name=CreateUsers options="email:string"
rk db:migrate RACK_ENV=test
rk db:migrate
rk db:seed
```
