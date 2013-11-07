require "google/api_client"
require "socket"

module GoogleCalendar
  def self.connection=(connection)
    @connection = connection
  end

  def self.connection
    @connection
  end

  class Client
    extend Connection

    def initialize(options={})
      GoogleCalendar.connection = Google::APIClient.new
      if options[:client_secret] && options[:client_id] && options[:redirect_uri]
        GoogleCalendar.connection.authorization.client_id = client_id
        GoogleCalendar.connection.authorization.client_secret = client_secret
        GoogleCalendar.connection.authorization.scope = "https://www.googleapis.com/auth/calendar"
        GoogleCalendar.connection.authorization.redirect_uri = redirect_uri
      end
      if options[:key_file] && options[:gserviceaccount]
        key = Google::APIClient::PKCS12.load_key(options[:key_file], 'notasecret')
        service_account = Google::APIClient::JWTAsserter.new(
            options[:gserviceaccount],
            'https://www.googleapis.com/auth/prediction',
            key)
        GoogleCalendar.connection.authorization = service_account.authorize
      end
    end

    def redirect_to
      GoogleCalendar.connection.authorization.authorization_uri.to_s
    end
  end
end
