class OwnerAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force owners to sign in before any other actions.
  # skip_before_action(:force_owner_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "owner_authentication/sign_in.html.erb" })
  end

  def create_cookie
    owner = Owner.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if owner != nil
      are_they_legit = owner.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/owner_sign_in", { :alert => "Incorrect password." })
      else
        session[:owner_id] = owner.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/owner_sign_in", { :alert => "No owner with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "owner_authentication/sign_up.html.erb" })
  end

  def create
    @owner = Owner.new
    @owner.email = params.fetch("query_email")
    @owner.password = params.fetch("query_password")
    @owner.password_confirmation = params.fetch("query_password_confirmation")
    @owner.owner_username = params.fetch("query_owner_username")

    save_status = @owner.save

    if save_status == true
      session[:owner_id] = @owner.id
   
      redirect_to("/", { :notice => "Owner account created successfully."})
    else
      redirect_to("/owner_sign_up", { :alert => @owner.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile_form
    render({ :template => "owner_authentication/edit_profile.html.erb" })
  end

  def update
    @owner = @current_owner
    @owner.email = params.fetch("query_email")
    @owner.password = params.fetch("query_password")
    @owner.password_confirmation = params.fetch("query_password_confirmation")
    @owner.owner_username = params.fetch("query_owner_username")
    
    if @owner.valid?
      @owner.save

      redirect_to("/", { :notice => "Owner account updated successfully."})
    else
      render({ :template => "owner_authentication/edit_profile_with_errors.html.erb" , :alert => @owner.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_owner.destroy
    reset_session
    
    redirect_to("/", { :notice => "Owner account cancelled" })
  end
 
end
