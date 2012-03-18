class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_authorization_check
    def facebook
        # You need to implement the method below in your model
        @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user
        else
          session["devise.facebook_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        # You need to implement the method below in your model
        @user = User.find_for_google_oauth(request.env["omniauth.auth"], current_user)

        if @user.persisted?
          sign_in_and_redirect @user
        else
          session["devise.google_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
    end
end