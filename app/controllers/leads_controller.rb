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
      flash[:notice] = "We received your request! "
      redirect_to :index

      from = Email.new(email: 'test@example.com')
      to = Email.new(email: @lead.email)
      subject = 'Team Rocket Says Hi!'
      content = Content.new(type: 'text/plain', 
        value: 'Greetings, ' + @lead.full_name + '!

        We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project, ' + @lead.project_name + '.
        
        A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.
               
        We’ll talk soon,
                
        The Rocket Team'
      )

      mail = Mail.new(from, subject, to, content)
      
      sg = SendGrid::API.new(api_key:'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')
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers

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