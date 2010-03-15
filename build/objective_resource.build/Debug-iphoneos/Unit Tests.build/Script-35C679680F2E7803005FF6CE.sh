#!/bin/sh
cd sample_rails_app
kill `cat tmp/pids/mongrel.pid`
rake db:migrate
rake db:test:prepare
rake db:populate RAILS_ENV=test
./script/server -e test -p 36313 -d
