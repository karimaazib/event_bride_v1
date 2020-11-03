class UsersController < ApplicationController
    before_action :authenticate_current_user
  
    def show
      @event = Event.find(params[:id])
      puts @event
    end
  
    private
  
    def authenticate_current_user
      unless current_user == User.find(params[:id])
        redirect_to events_path, alert: "Vous ne pouvez pas accéder à cette page"
      end
    end
  end