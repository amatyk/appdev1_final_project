Rails.application.routes.draw do


  # Routes for the Renter account:

  get("/renters", { :controller => "application", :action => "renters" })

  # SIGN UP FORM
  get("/renter_sign_up", { :controller => "renter_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_renter", { :controller => "renter_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_renter_profile", { :controller => "renter_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_renter", { :controller => "renter_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_renter_account", { :controller => "renter_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/renter_sign_in", { :controller => "renter_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/renter_verify_credentials", { :controller => "renter_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/renter_sign_out", { :controller => "renter_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Owner account:

  # SIGN UP FORM
  get("/owner_sign_up", { :controller => "owner_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_owner", { :controller => "owner_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_owner_profile", { :controller => "owner_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_owner", { :controller => "owner_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_owner_account", { :controller => "owner_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/owner_sign_in", { :controller => "owner_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/owner_verify_credentials", { :controller => "owner_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/owner_sign_out", { :controller => "owner_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Dock resource:

  # CREATE
  post("/insert_dock", { :controller => "docks", :action => "create" })
          
  # READ
  get("/", { :controller => "docks", :action => "index" })

  get("/docks", { :controller => "docks", :action => "index" })
  
  get("/docks/:path_id", { :controller => "docks", :action => "show" })
  
  # UPDATE
  
  post("/modify_dock/:path_id", { :controller => "docks", :action => "update" })
  
  # DELETE
  get("/delete_dock/:path_id", { :controller => "docks", :action => "destroy" })

  #------------------------------

end
