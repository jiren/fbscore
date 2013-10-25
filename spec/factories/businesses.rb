# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    name        { Faker::Internet.domain_word  }
    website     { "http://www.#{name}.com/"}
    fb_url      { "http://www.facebook.com/#{name}" }
    likes       { rand(100000) +  rand(20000)}
    description { Faker::Lorem.words.join(' ') }
    user_name   { Faker::Name.name }
    email       { Faker::Internet.email}

    factory :business_viki do
       fb_url 'http://www.facebook.com/viki'
       name 'viki'
    end

  end

end
