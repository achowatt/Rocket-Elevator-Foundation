class LeadsController < ApplicationController
  require 'sendgrid-ruby'
  include SendGrid

  def index
  end

  def new
    @lead = Lead.new #generate data blank to create new form
  end

  def create  
    @lead = Lead.new(lead_params)
    
    #render json: @lead #test when submit button form
    if @lead.save
      flash[:notice] = "We received your request!"
      redirect_to :index

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
  #for get params when click submit form
  
  private
  def lead_params
    #params.require(name model)
    params.require(:lead).permit(:full_name,:company_name,:email,:phone,:project_name,:project_desc,:department,:message,:attached_file)
  end
end