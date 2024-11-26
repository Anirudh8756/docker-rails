#!/bin/sh
set -e

#For development check if the gems as installed, if not
#then install them
if ! [bundle check]; then
    bundle install
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid 

#Run the command
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production rake db:migrate
/usr/local/bin/bundle exec rails s -e production -p 3000 -b '0.0.0.0'
# exec "$@"