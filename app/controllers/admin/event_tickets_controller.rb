class Admin::EventTicketsController < ApplicationController
  before_action :find_event


  def index
    @tickets = @event.tickets
  end

  def new
    @ticket = @event.tickets.new
  end

  def create
    @ticket = @event.tickets.new(ticket_params)
    if @ticket.save
      redirect_to admin_event_tickets_path(@event)
    else
      render "new"
    end
  end

  protected

  def find_event
    @event = Event.find_by_friendly_id!(params[:event_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description, :price)
  end
end
