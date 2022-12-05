class ApplicationController < ActionController::Base
  before_action(:load_current_renter)
  
  # Uncomment line 5 in this file and line 3 in RenterAuthenticationController if you want to force renters to sign in before any other actions.
  # before_action(:force_renter_sign_in)
  
  def load_current_renter
    the_id = session[:renter_id]
    
    @current_renter = Renter.where({ :id => the_id }).first
  end
  
  def force_renter_sign_in
    if @current_renter == nil
      redirect_to("/renter_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_owner)
  
  # Uncomment line 5 in this file and line 3 in OwnerAuthenticationController if you want to force owners to sign in before any other actions.
  # before_action(:force_owner_sign_in)
  
  def load_current_owner
    the_id = session[:owner_id]
    
    @current_owner = Owner.where({ :id => the_id }).first
  end
  
  def force_owner_sign_in
    if @current_owner == nil
      redirect_to("/owner_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def renters

    render({ :template => "renters/index.html.erb" })
  end


end
