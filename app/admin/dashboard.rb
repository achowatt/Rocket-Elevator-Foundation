

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1
  content title: proc { I18n.t("active_admin.dashboard") } do 
  
    columns do
      column do
        panel "Watson" do
          div do
            welcome = "Welcome #{current_employee.first_name.capitalize} #{current_employee.last_name.capitalize}" 
            msg1 = "There are currently #{Elevator.count} elevators,  deployed in the #{Building.count} buildings of your #{Customer.count} customers." 
            msg2 = "Currently, #{Elevator.where.not(status:"active").count} elevators are in Intervention."
            msg3 = "You currently have #{Quote.count} quotes awaiting processing."
            msg4 = "You currently have #{Lead.count} leads in your contact requests."
            msg5 = "#{Battery.count} Batteries are deployed across #{Address.distinct.count(:city)} cities."
            br
            h1 welcome
            br
            h3 msg1     
            br
            h3 msg2     
            br
            h3 msg3
            br
            h3 msg4     
            br
            h3 msg5
          end
        end
      end

      column do
        panel "Geolocation" do
          div do
            br
            text_node %{<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3133.7047703786026!2d-73.56930918423099!3d45.45941077910087!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4cc91067ae856153%3A0x5ba73b190d3e61d2!2s4468%20Wellington%20St%2C%20Verdun%2C%20QC%20H4G%202G4!5e1!3m2!1ses!2sca!4v1580323335394!5m2!1ses!2sca"
            width="425" height="450" scrolling="no" frameborder="15">
    </iframe>}.html_safe
          end
        end
      end      

      column do
        panel "Anna Chowattanakul - David Hunter - Ukeme Ekpenyong - Younes Bekkali orge Chavarriaga" do
          div do
            br
            text_node %{<iframe src="https://www.dropbox.com/s/rdw10q1ed7nwxhh/team_dashboard.jpg?raw=1"
            width="430" height="430" scrolling="yes" frameborder="15">
    </iframe>}.html_safe
          end
        end
      end
      
    end 
  
    columns do
      column do
        panel "At Rocket Elevators, we are committed with the security off all of our customers, employees." do
          div do
            br
            text_node %{<iframe src="https://www.arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6"
            width="1400" height="650" scrolling="no" frameborder="15">
    </iframe>}.html_safe
          end
        end
      end
    end
   end 
end