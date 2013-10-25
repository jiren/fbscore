require 'spec_helper'

describe BusinessesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'

      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'

      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    before(:each) { stub_viki_info_request }
    after(:each) { WebMock.allow_net_connect!}

    it "returns http success" do
      post 'create', { business: attributes_for(:business_viki) }

      expect(response).to redirect_to(businesses_url)
      expect(Business.count).to eq(1)
    end

    it 'render new page if invalid info posted' do
      stub_viki_info_request

      post 'create', { business: attributes_for(:business_viki, name: nil) }

      expect(response).to render_template(:new)
      expect(Business.count).to eq(0)
    end


  end

end
