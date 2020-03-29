class LeadsController < ApplicationController
  require 'sendgrid-ruby'
  require 'colorize'
  include SendGrid

  def index
  end

  def new
    @lead = Lead.new #generate data blank to create new form
  end

  def create  
    @lead = Lead.new(lead_params)
    @lead.attached_file = lead_params['attached_file']
    #@lead.attached_file = lead_params['attached_file'].read

    #Create ticket on Zendesk from Contact Form
    ZendeskAPI::Ticket.create!(@client, 
      :subject => "#{@lead.full_name} from #{@lead.company_name}",
      :requester => {"name": @lead.full_name}, 
      :comment => { :value => 
       "The contact #{@lead.full_name} from company #{@lead.company_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone}. #{@lead.department} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators. 
        #{@lead.project_desc}
        Attached Message: #{@lead.attached_file}
        The Contact uploaded an attachment"},
      :type => "question",  
      :priority => "urgent")
    

    #render json: @lead #test when submit button form
    if @lead.save
      flash[:notice] = "We received your request!"
      redirect_to :index
    
    #code for sending email after someone else fills out the contact form --this is a comment
       data = JSON.parse(%Q[{
         "personalizations": [
           {
             "to": [
               {
                 "email": "#{@lead.email}"
               }
             ],
             "dynamic_template_data":{
               "full_name":"#{@lead.full_name}",
               "project_name":"#{@lead.project_name}"
             },
             "subject": "Greetings from Team Rocket!"
           }
         ],
         "from": {
           "email": "test@example.com"
         },
         "template_id":"d-880ee0610e084a45896e8ad45336829e"
       }])
       sg = SendGrid::API.new(api_key: ENV["SENDGRID_API"])
       response = sg.client.mail._("send").post(request_body: data)
      
    else
      flash[:notice] = "Request not succesfull."
      redirect_to action:"new"
    end
  end

  def edit
  end

  private
  def lead_params
    #params.require(name model)
    params.require(:lead).permit(:full_name,:company_name,:email,:phone,:project_name,:project_desc,:department,:message,:attached_file)
  end

end
