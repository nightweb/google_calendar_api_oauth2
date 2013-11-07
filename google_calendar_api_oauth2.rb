Gem::Specification.new do |s|
  s.name        = 'google_calendar_api_oauth2'
  s.version     = '0.0.1'
  s.summary     = "Work with Google Calendar using GData 3.0 + OAuth 2.0 and two method auth"
  s.description = "Work with Google Calendar using GData 3.0 + OAuth 2.0 and two method auth"
  s.authors     = ['Maksim Koritskiy','Parker Young']
  s.email       = 'max@koritskiy.ru'
  s.homepage    = 'http://www.github.com/nightweb/google_calendar_api_oauth2'
  s.required_rubygems_version = '>= 1.3.6'
  s.files        = s.files = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.add_dependency 'google-api-client'
end