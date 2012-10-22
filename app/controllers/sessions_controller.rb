class SessionsController < ApplicationController
  
  skip_before_filter :sign_in?, :only => [:login, :create, :destroy]
  
  def login
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new(keys[:api_key], keys[:secret_key])
    request_token = client.request_token(
      {:oauth_callback => "http://#{request.host_with_port}/auth/callback"},  :scope => "r_fullprofile r_network"
    )
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url
  end
  
  def create
    client = LinkedIn::Client.new(keys[:api_key], keys[:secret_key])
    if params[:oauth_problem]
      redirect_to root_path
    else
      if session[:atoken].nil?
        pin = params[:oauth_verifier]
        atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
        session[:atoken] = atoken
        session[:asecret] = asecret
      else
        client.authorize_from_access(session[:atoken], session[:asecret])
      end
      
      player = Player.find_by_linkedin_id(client.profile(:fields => %w(id)).id)
      if player.nil?
        #
      else
        sign_in player
      end
      
      session[:player] = client.profile(:fields => %w(first-name last-name id picture-url location public-profile-url))
      session[:company] = (client.profile(:fields => %w(positions)).positions.all.map {|position| [position.company.name, position.company.id, position.company.industry]}).uniq
      
      session[:connections] = client.profile(:fields => %w(connections))
      #session[:connections] = client.profile(:fields => %w(connections)).connections.all.map {|profile| [profile.id, profile.picture_url]}
      
      redirect_back_or root_path
    end    
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end