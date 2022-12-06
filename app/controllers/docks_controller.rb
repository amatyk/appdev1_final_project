class DocksController < ApplicationController
  def index
    matching_docks = Dock.all

    @list_of_docks = matching_docks.order({ :created_at => :desc })

    render({ :template => "docks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_docks = Dock.where({ :id => the_id })

    @the_dock = matching_docks.at(0)

    render({ :template => "docks/show.html.erb" })
  end

  def create
    the_dock = Dock.new
    the_dock.image = params.fetch("query_image")
    the_dock.address = params.fetch("query_address")
    the_dock.owner = session.fetch(:owner_id)
    the_dock.price = params.fetch("query_price")
    the_dock.dock_renters = params.fetch("query_dock_renters")
    the_dock.comment_docks = params.fetch("query_comment_docks")
    the_dock.description = params.fetch("query_description")

    if the_dock.valid?
      the_dock.save
      redirect_to("/docks", { :notice => "Dock created successfully." })
    else
      redirect_to("/docks", { :alert => the_dock.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dock = Dock.where({ :id => the_id }).at(0)

    the_dock.image = params.fetch("query_image")
    the_dock.address = params.fetch("query_address")
    the_dock.owner = params.fetch("query_owner")
    the_dock.price = params.fetch("query_price")
    the_dock.dock_renters = params.fetch("query_dock_renters")
    the_dock.comment_docks = params.fetch("query_comment_docks")
    the_dock.description = params.fetch("query_description")

    if the_dock.valid?
      the_dock.save
      redirect_to("/docks/#{the_dock.id}", { :notice => "Dock updated successfully."} )
    else
      redirect_to("/docks/#{the_dock.id}", { :alert => the_dock.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dock = Dock.where({ :id => the_id }).at(0)

    the_dock.destroy

    redirect_to("/docks", { :notice => "Dock deleted successfully."} )
  end
end
