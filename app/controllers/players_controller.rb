class PlayersController < ApplicationController
  
  before_filter :profile_owner, :only => [:edit, :update]
  before_filter :api_call, :only => [:create, :update, :test]
  
  def index
  end

  
  def new
    @player = Player.new
    @profile = session[:player]
    @company = session[:company].map {|company| company[0] }
    @courses = Course.all.map {|course| [course.name, course.id] }    
  end
  
  def create
    
    profile = session[:player]
        
    @player = Player.new(params[:player])
    
    @player.linkedin_id = profile.id
    @player.first_name = profile.first_name
    @player.last_name = profile.last_name
    @player.picture_url = profile.picture_url
    @player.public_linkedin_link = profile.public_profile_url
    @player.company_id = session[:company].assoc(params[:player][:company])[1] 
    
    if @player.save
      sign_in @player
      flash.now[:success] = 'Your profile was successfully created!'
      redirect_to current_player
    else
      flash.now[:error] = 'Your profile could not be created. Did you fill out all of the fields?'
      @profile = session[:player]
      @company = session[:company].map {|company| company[0] }
      @courses = Course.all.map {|course| [course.name, course.id] }
      render 'new'
    end
  end
  
  def show
    @player = Player.find(params[:id])
  end
  
  def edit        
    @profile = session[:player]
    @company = session[:company].map {|company| company[0] }
    @courses = Course.all.map {|course| [course.name, course.id] }
  end
  
  def update
    profile = session[:player]
    
    @player.picture_url = profile.picture_url
    @player.company_id = session[:company].assoc(params[:player][:company])[1] 
    
    if @player.update_attributes(params[:player])    
      flash.now[:success] = 'Your profile was successfully updated!'
      redirect_to current_player
    else
      flash.now[:error] = 'Your profile could not be updated. Did you fill out all of the fields?'
      @profile = session[:player]
      @company = session[:company].map {|company| company[0] }
      @courses = Course.all.map {|course| [course.name, course.id] }
      render 'edit'
    end
  end
  
  def test
  end
  
  protected 
    
    def api_call
      @client = LinkedIn::Client.new(keys[:api_key], keys[:secret_key])
      @client.authorize_from_access(session[:atoken], session[:asecret])
    end
  
  private
  
    def profile_owner
      @player = Player.find(params[:id])
      redirect_to(root_path) unless current_player?(@player)
    end

end
