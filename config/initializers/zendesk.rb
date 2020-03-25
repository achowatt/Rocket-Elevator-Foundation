require 'zendesk_api'
def initialize

@client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://rocketelevator.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = ENV["ZENDESK_API_USERNAME"]

  # Choose one of the following depending on your authentication choice
  config.token = ENV["ZENDESK_API_TOKEN"]
  #config.password = "rocketelevators"

  # OAuth Authentication
  #config.access_token = "your OAuth access token"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Raise error when hitting the rate limit.
  # This is ignored and always set to false when `retry` is enabled.
  # Disabled by default.
  config.raise_error_when_rate_limited = false

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end

#def create_ticket(full_name, company_name, email, phone_number, department, project_name, project_desc, message)
    #ticket = ZendeskAPI::Ticket.new(@client, :id => 1)
      #ZendeskAPI::Ticket.create!(@client, :subject => " '#{full_name}' from #{company_name}", 
      #:comment => { :value => "
      #Comment: The contact '#{full_name}' from company '#{company_name}'can be reached at email  '#{email}' and at 
      #phone number #{phone_number}. #{department} has a project named #{project_name} which would require contribution from Rocket 
      #Elevators. 
      #{project_desc}
      #Attached Message: #{message}
      #The Contact uploaded an attachment
     # " },  
     # :priority => "urgent")
end