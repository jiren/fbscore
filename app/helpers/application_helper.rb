module ApplicationHelper

  def active?(controller, action)
   'active' if params[:controller] == controller && Array(action).include?(params[:action])
  end

end
