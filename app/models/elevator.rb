require 'send_sms/sms'

class Elevator < ApplicationRecord
    belongs_to :column
    before_update :twilio_send_sms

    def twilio_send_sms
        if self.status_changed? and self.status.downcase == "intervention"
            puts 7.chr
            puts ""
            puts ""
            puts "**************************************************  INTERVENTION DETECTED !!! ************************************************** ".red 
            puts "**************************************************  INTERVENTION DETECTED !!! **************************************************".red
            puts "***** tech_phone: #{self.column.battery.building.tech_phone} ***** ".green
            puts "***** tech_full_name: #{self.column.battery.building.tech_full_name} ***** ".green 
            puts "***** id: #{self.id} ***** ".green
            puts "***** serial_number: #{self.serial_number} ***** ".green
            puts "***** number_n_street: #{self.column.battery.building.address.number_n_street} ***** ".green 
            puts "***** city: #{self.column.battery.building.address.city} ***** ".green
            puts "***** admin_full_name: #{self.column.battery.building.admin_full_name} ***** ".green
            puts "***** admin_full_name: #{self.column.battery.building.admin_phone} ***** ".green
            puts "**************************************************  INTERVENTION DETECTED !!! **************************************************".red
            puts "**************************************************  INTERVENTION DETECTED !!! **************************************************".red
            puts ""
            puts ""
            account_sid = ENV['TWILIO_ACCOUNT_SID']
            auth_token = ENV["TWILIO_AUTH_TOKEN"]
            @client = Twilio::REST::Client.new account_sid, auth_token 
            @client.api.account.messages.create(
            from: ENV['TWILIO_PHONE_NUMBER'],
            to: self.column.battery.building.tech_phone,
            body: "Hi #{self.column.battery.building.tech_full_name}, the elevator: #{self.id} with Serial Number: #{self.serial_number}, located at #{self.column.battery.building.address.number_n_street}, #{self.column.battery.building.address.city} require intervention. Please contact the administrator #{self.column.battery.building.admin_full_name} on the phone #{self.column.battery.building.admin_phone}.")
        end
    end
end
         