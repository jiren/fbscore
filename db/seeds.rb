# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  {
    name: "ViKi",
    fb_url: "https://www.facebook.com/Viki",
    description: "Online entertainment"
  },
  {
    name: "Garena", 
    fb_url: "https://www.facebook.com/GarenaSingapore",
    description: 'Games'
  }
].each do |business| 
  business = Business.create({
    name: business[:name], 
    description: business[:description], 
    fb_url: business[:fb_url],
    website: nil,
    user_name: 'jiren',
    email: 'jiren@gmail.com'
  })
  business.update_fb_info
end
