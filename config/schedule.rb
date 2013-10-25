# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# set :output, "/path/to/my/cron_log.log"
#

every :day, at: '11:59pm' do
  rake "update_fbscores"
end
