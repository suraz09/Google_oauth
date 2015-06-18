OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '193450744333-ui6gtp7nrl3pq981d7uo71qeemga9to7.apps.googleusercontent.com', 'rlloWaV8JVsL9KFcZQw03mSS',{
  :access_type => 'offline',
  prompt: 'consent'
  }
end
