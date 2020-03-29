class QuoteController < ApplicationController
  def index
  end

  def new
    @quote = Quote.new #generate data blank to create new form
  end

  def create
    @quote = Quote.new(quote_params)

#for creating a quote form submission ticket on zendesk panel
ZendeskAPI::Ticket.create!(@client, 
  :subject => "#{@quote.Full_Name} from #{@quote.Company_Name}",
  :requester => {"name": @quote.Full_Name},
  :comment => { :value => 
    "The contact #{@quote.Full_Name} from company #{@quote.Company_Name} can be reached at email #{@quote.Email} and at phone number #{@quote.Phone_Number}. The client has requested elevator installation in a #{@quote.Building_Type} building. The total price of the installation is #{@quote.Final_Price}."},
  :type => "task",  
  :priority => "urgent")

    #render json: @quote #test when submit button form
    if @quote.save
      message = "Hi #{@quote.Full_Name}, your quote has been submitted successfully! One of our representatives will be contacting you shortly."
      totest = "#{@quote.Phone_Number}"
      puts ""
      puts ""
      puts "**************************************************  SUBMITTED SUCCESSFULLY !!! ************************************************** ".red 
      puts "**************************************************  SUBMITTED SUCCESSFULLY !!! **************************************************".red
      puts ""
      puts ""
      puts "***** message: #{message} ***** ".green
      puts "***** to: #{@quote.Phone_Number} ***** ".green
      puts ""
      puts ""
      puts "**************************************************  SUBMITTED SUCCESSFULLY !!! ************************************************** ".red 
      puts "**************************************************  SUBMITTED SUCCESSFULLY !!! **************************************************".red
      puts ""
      puts ""
      TwilioTextMessenger.new(message, totest).call
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