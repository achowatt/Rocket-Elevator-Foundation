class QuoteController < ApplicationController
  def index
  end

  def new
    @quote = Quote.new #generate data blank to create new form
  end

   #for creating a quote form submission ticket on zendesk panel
   ZendeskAPI::Ticket.create!(@client, 
    :subject => "#{@quote.Full_name} from #{@quote.Company_name}", 
    :requester => {"name": @quote.Full_name},
    :comment => { :value => 
     "The contact #{@quote.Full_name} from company #{@quote.Company_name} has placed an order for an elevator installation in a #{@quote.Building_Type} building. 
     The building has #{@quote.Nb_floor} floors. The client can be reached at email #{@quote.Email} and at phone number #{@quote.Phone_number}"},
    :type => "question",  
    :priority => "urgent")

  def create
    @quote = Quote.new(quote_params)
    #render json: @quote #test when submit button form
    if @quote.save
      message = "Your quote has been submitted successfully!"
      TwilioTextMessenger.new(message).call
      flash[:notice] = "add new quete successfull "
      redirect_to :index
    else
      flash[:notice] = "add new quete not successfull "
      redirect_to action:"new"
    end
  end

  def edit
  end
  #for get params when click submit form
  
  private
  def quote_params
    #params.require(name model)
    params.require(:quote).permit(:Full_Name,:Phone_Number,:Company_Name,:Email,:Building_Type,:Nb_Appartement,:Nb_Company,:Nb_Business,:Nb_Floor,:Nb_Basement,:Nb_Parking,:Nb_Cage,:Nb_OccupantPerFloor,:Product_Grade,:Nb_Ele_Suggested,:Price_Per_Ele,:Subtotal,:Install_Fee,:Final_Price)
  end
end