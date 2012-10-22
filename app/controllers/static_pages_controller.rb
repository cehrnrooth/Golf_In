class StaticPagesController < ApplicationController
  def home
    if session[:atoken].nil?
    else
      @players = Player.all
      @courses = Course.all
    end
  end
  
  def about
  end
  
end
