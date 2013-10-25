module FbApi
  class Client
    include HTTParty
    base_uri 'https://graph.facebook.com'
    format :json

    class << self

      def info(business_name)
        self.get("/#{business_name}")
      end

    end

  end
end
