class RenterAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force renters to sign in before any other actions.
  # skip_before_action(:force_renter_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "renter_authentication/sign_in.html.erb" })
  end

  def create_cookie
    renter = Renter.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if renter != nil
      are_they_legit = renter.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/renter_sign_in", { :alert => "Incorrect password." })
      else
        session[:renter_id] = renter.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/renter_sign_in", { :alert => "No renter with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "renter_authentication/sign_up.html.erb" })
  end

  def create
    @renter = Renter.new
    @renter.email = params.fetch("query_email")
    @renter.password = params.fetch("query_password")
    @renter.password_confirmation = params.fetch("query_password_confirmation")
    @renter.renter_username = params.fetch("query_renter_username")

    save_status = @renter.save

    if save_status == true
      session[:renter_id] = @renter.id
   
      redirect_to("/", { :notice => "Renter account created successfully."})
    else
      redirect_to("/renter_sign_up", { :alert => @renter.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "renter_authentication/edit_profile.html.erb" })
  end

  def update
    @renter = @current_renter
    @renter.email = params.fetch("query_email")
    @renter.password = params.fetch("query_password")
    @renter.password_confirmation = params.fetch("query_password_confirmation")
    @renter.renter_username = params.fetch("query_renter_username")
    
    if @renter.valid?
      @renter.save

      redirect_to("/", { :notice => "Renter account updated successfully."})
    else
      render({ :template => "renter_authentication/edit_profile_with_errors.html.erb" , :alert => @renter.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_renter.destroy
    reset_session
    
    redirect_to("/", { :notice => "Renter account cancelled" })
  end
 
end
