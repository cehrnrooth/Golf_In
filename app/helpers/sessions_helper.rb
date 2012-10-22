module SessionsHelper
  
  def sign_in(player)
     cookies.permanent[:linkedin_id] = player.linkedin_id
     self.current_player = player
   end
  
  def current_player=(player)
   @current_player = player
 end
 
 def current_player
   @current_player ||= Player.find_by_linkedin_id(cookies[:linkedin_id])
 end
 
 def current_player?(player)
    player == current_player
 end
 
 def has_profile?
   !Player.find_by_linkedin_id(cookies[:linkedin_id]).nil?
 end
   
 def sign_out
   self.current_player = nil
   session[:atoken] = nil
   cookies.delete(:linkedin_id)
 end
 
 def redirect_back_or(default)
   redirect_to(session[:return_to] || default)
   session.delete(:return_to)
 end

 def store_location
   session[:return_to] = request.url
 end
 
end