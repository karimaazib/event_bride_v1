class EventsController < ApplicationController
	
  def index #rechercher les bases de fichier & seed
    @list_events = Event.all
  end

  def create
  end

  def show
    @event_searched = Event.find(params[:id])
  end

  def new 
    @event = Event.new
end
 def create
    @event = Event.new('title' => params[:event_title], 'location' => params[:event_location], 'description' => params[:event_description], 'start_date' => params[:event_date], 'price' => params[:event_price].to_i, 'duration' => params[:event_duration].to_i)
    @event.admin = current_user
    
    if @event.save
      redirect_to events_path, notice: "L'événement #{@event.title} a bien été créé ! Bien joué petit génie !"
    else
      redirect_to new_event_path, alert: "Certaines informations sont incorrectes : la description doit faire au moins 20 caractères et la date doit être dans le futur. "
    end
  end
  
end

