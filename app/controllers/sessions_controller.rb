class SessionsController < ApplicationController

  # skip_before_filter :verify_authenticity_token
  def create user = User.from_omniauth(env["omniauth.auth"])
    session[:refresh_token] = env["omniauth.auth"].credentials.refresh_token
    options = {
      body: {
        client_id: '193450744333-ui6gtp7nrl3pq981d7uo71qeemga9to7.apps.googleusercontent.com',
        client_secret: 'rlloWaV8JVsL9KFcZQw03mSS',
        refresh_token: session[:refresh_token],
        grant_type: 'refresh_token'
      },
      headers: {
      'Content-Type' => 'application/x-www-form-urlencoded'
      }
    }
    response =@response = HTTParty.post('https://accounts.google.com/o/oauth2/token', options)
    session[:user_id] = user.id
    redirect_to root_path

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
