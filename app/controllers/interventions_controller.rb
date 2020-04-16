class InterventionsController < InheritedResources::Base

  # def logged_in?
  #   !current_user.nil?
  # end
  # def intervention
  #   redirect_to ‘/index’ unless logged_in?
  # end
  
  def index
  end

  def new
    @intervention = Intervention.new #generate data blank to create new form
  end

  def get_buildings_for_customer
    puts "get_buildings_for_customer"
    puts params
    @buildings = Customer.find(params[:customer_id]).buildings
    render json: @buildings
  end

  def get_batteries_for_building
    puts "get_batteries_for_building"
    puts params
    @batteries = Building.find(params[:building_id]).batteries
    render json: @batteries
  end 

  def get_columns_for_battery
    puts "get_columns_for_battery"
    puts params
    @columns = Battery.find(params[:battery_id]).columns
    render json: @columns
  end 

  def get_elevators_for_column
    puts "get_elevators_for_column"
    puts params
    @elevators = Column.find(params[:column_id]).elevators
    render json: @elevators
  end 

  def create
    @intervention = Intervention.new(intervention_params)
    if verify_recaptcha(model: @intervention) && @intervention.save
      puts params
      flash[:notice] = "add new intervention was successful "
      redirect_to :index
      
      #Create ticket on Zendesk from Intervention Form
      @intervention.author = current_employee.id
      @CompanyName = Customer.find(intervention_params[:customer_id]).company_name
      @FirstName = Employee.find(intervention_params[:employee_id]).first_name
      @LastName = Employee.find(intervention_params[:employee_id]).last_name
      @authorFirstName = current_employee.first_name
      @authorLastName = current_employee.last_name

      ZendeskAPI::Ticket.create!(@client, 
      :subject => "Customer : #{@CompanyName} requested an intervention!",
      :requester => {"name": @CompanyName}, 
      :comment => { :value => 
          "#{@authorFirstName} #{@authorLastName} created a ticket request for this company: #{@CompanyName} \n 
          Building :  #{@intervention.building_id} \n 
          Battery :  #{@intervention.battery_id} \n
          Column : #{@intervention.column_id} \n
          Elevator : #{@intervention.elevator_id} \n
          Employee : #{@FirstName} #{@LastName} \n 
          Report :  #{@intervention.report}."
      },
      :type => "problem",
      :priority => "urgent")

    else
      flash[:notice] = "add new intervention was not successful "
      redirect_to action:"new"
    end
  end


  private
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date, :end_date, :result, :report, :status)
    end

end
