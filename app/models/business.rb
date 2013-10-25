class Business < ActiveRecord::Base

  EMAIL_REGX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ 

  validates :description, :user_name, :email, presence: true
  validates :name, :fb_url, presence: true, uniqueness: true
  validates :fb_url, format: { with: URI::regexp, message: 'invalid format.' }, allow_blank: true
  validates :email, format: { with: EMAIL_REGX, message: 'invalid format.' }, allow_blank: true

  before_validation do |business|
    business.fb_url = business.add_uri_protocol(business.fb_url)
  end

  def fetch_fb_info
    FbApi::Client.info(self.fb_url.split('/').last)
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace
    false
  end

  def website_url
    url = website.split(',').first
    add_uri_protocol(url)
  end

  def add_uri_protocol(url)
    if url && url[/\..*/]
      url = "http://#{url}" unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
    end

    url
  end

  def update_fb_info
    info = fetch_fb_info

    if info
      self.update_attributes(likes: info['likes'], website: info['website'])
    end
  end

end
