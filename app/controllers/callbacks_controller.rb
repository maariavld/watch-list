class CallbacksController < Devise::OmniAuthCallbacksController
  def github
    @user =  User.from_omniauth(request.env["omniauth.auth"])
    signin_and_redirect @user
  end
end
