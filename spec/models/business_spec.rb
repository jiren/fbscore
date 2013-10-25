require 'spec_helper'

describe Business do

  context('#validation') do

    shared_examples_for("mandatory") do |field|
      it "require #{field}" do
        business = build(:business, field => nil)

        expect(business).not_to be_valid
        expect(business).to have(1).error_on(field)
      end
    end

    it_should_behave_like 'mandatory', :name
    it_should_behave_like 'mandatory', :fb_url
    it_should_behave_like 'mandatory', :description
    it_should_behave_like 'mandatory', :user_name
    it_should_behave_like 'mandatory', :email

    shared_examples_for("email format") do |email, valid_email|
      it "must be valid" do
        business = build(:business, email: email )

        if valid_email
          expect(business).to be_valid
        else
          expect(business).not_to be_valid
          expect(business).to have(1).error_on(:email)
        end
      end
    end

    it_should_behave_like 'email format', 'aaa-aa.com', false
    it_should_behave_like 'email format', 'aaa@c', false
    it_should_behave_like 'email format', 'aaa@aa.com', true

    it 'must have valid fb_url formart' do
      business = build(:business, fb_url: 'aaa')

      expect(business).not_to be_valid
      expect(business).to have(1).error_on(:fb_url)
    end

  end

  context('#helpers') do
    it 'add default uri protocal http if not present' do
      fb_url = 'www.facebook.com/viki'
      business = build(:business, fb_url: fb_url)
      business.valid?

      expect(business.fb_url).to eq("http://#{fb_url}")
    end

    it 'fetch business info from facebook' do
      business = create(:business, fb_url: 'http://www.facebook.com/viki', name: 'viki')

      info = business.fetch_fb_info

      expect(info['likes']).not_to be_blank
      expect(info['website']).not_to be_blank
    end
  end

  it 'add record' do
    create(:business)

    expect(Business.count).to eq(1)
  end


end
