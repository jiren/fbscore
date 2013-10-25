class BusinessesController < ApplicationController

  def index
    @businesses = Business.order('likes DESC').limit(30)
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params) 

    respond_to do |format|
      if @business.save
        info = @business.fetch_fb_info
         
        if info
          @business.update_attributes(likes: info['likes'], website: info['website'])
          format.html { redirect_to businesses_path, notice: "Business '#{@business.name}' was successfully added." }
        else
          format.html { redirect_to businesses_path, notice: "Error while fetching data from facebook for '#{@business.name}'." }
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :fb_url, :description, :user_name, :email)
  end

end
