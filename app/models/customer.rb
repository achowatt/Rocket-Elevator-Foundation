class Customer < ApplicationRecord
    belongs_to :address
<<<<<<< HEAD
    #belongs_to :user, optional: true
    has_many :buildings
    #after_create :upload_lead_files #<---comment this code before seed, uncomment to get dropbox to work
    def upload_lead_files
        dropbox_client = DropboxApi::Client.new(ENV["DROPBOX_API_TOKEN"])
        lead = Lead.find_by_email(self.contact_email)
        puts '#############################'
        puts lead.email
        puts 'upload_lead_files is working'
        puts '#############################'
        if lead.email == self.contact_email
            puts 'Found email of the same name!!!'
            #creates client folder in dropbox
                #new_client_folder = self.name_company_contact
            dropbox_client.create_folder("/#{self.name_company_contact}")
            puts "Folder created for #{self.name_company_contact}!!!"
            puts "#############################"
            #find lead attached_file and put it in drop box
            dropbox_client.upload("/#{self.name_company_contact}/#{lead.attached_file}", lead.attached_file)
            #check if the upload to dropbox is successful...
            puts "successfully uploaded!"
            #destroy lead attachment file
        else 
            puts "Customer is not found in the Leads Table"
        end
    end
end
=======
    # belongs_to :users
    has_many :buildings
end
>>>>>>> 44b995c2feacddc45d2fc99c2790978c653ecb34
