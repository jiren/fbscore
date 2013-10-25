desc 'This task will update business brand facbook score data'
task :update_fbscores => :environment do

  Business.all.find_in_batches(batch_size: 100) do |businesses|
     businesses.each { |business| business.update_fb_info }
  end

end

