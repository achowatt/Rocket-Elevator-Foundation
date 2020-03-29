# ROCKET ELEVATORS API

For Testing Locally:

1. Git Clone this repo.
2. The files database.yml, application.yml, ibm-credentials.env must be requested for security reasons. (Contact our team leader Ukeme).
3. Copy the files database.yml adnd application.yml in the folder config. 
   database.yml must have this info:
   
   <<: *default
  username: USERNAME FOR CODEBOXX DATABASE
  password: PASSWORD FOR CODEBOXX DATABASE
  host: codeboxx.cq6zrczewpu2.us-east-1.rds.amazonaws.com
  database: UkemeEkpenyong
  
4. Copy the file ibm-credentials.env in the root folder.
5. Execute: bundle update
6. Execute: rake db:create
7. Execute: rake db:migrate
8. Exceute: rake db: seed

Testing Api's: 

1. Go to the Path where you clone the repo (cd NAME_OF_YOUR_FOLDER/)
2. Be sure that mysql server is running (sudo service mysql status), response must be [OK]
3. Run the server for the app: rails server
4. Go to your web browser to: http://localhost:3000/admin
3. Enter a valid email and password for the admin panel. (you can see it in the seed.rb the username and password)
4. Now you are in the admin panel, you are aviable to see the dashboard, and you can access to the options on the top.


1. Twilio: (Jorge Chavarriaga)

1. Go to the Elevators tab
2. Choose an elevator to edit 
3. Change the status to intervention
4. Update Elevator
5. You will see the following message in your browser: "Elevator was successfully updated."
6. If you go to your console, you will see a message with all the information that was sent to the technician registered in the database.
7. An SMS is immediately sent to the phone number of the technician registered in the database (in this case all buildings have Patrick Thibault's cell number).

2.Slack: (David Hunter)

1. Go to the Elevators tab
2. Choose an elevator to edit 
3. Change the status to active or inactive
4. Update Elevator
5. You will see the following message template sent in the slack channel: "Elevator 1002 with Serial Number 9305206536082 status has been changed from active to inactive"

3. Watson: (Jorge Chavarriaga / Ukeme Ekpenyong / David Hunter)
1. In the admin panel in the dashboard you can see all the information requerid for watson (text to speech)
...


4. Google Maps API: (Younes Bekkali)
- To test Google Maps API: go admin panel in http://www.kembasy.com/admin/dashboard  then click on the button customers geolocation in the dashboard. 
- This youtube video shows the test localy: https://youtu.be/vZZW9lDEZIk. 
  change line 244 the config/initializers/active_admin.rb. to : 
    menu.add label: "Customers geolocalisation", url: "http://localhost:3000/geolocation/google", html_options: { target: :blank }

5. Zendesk api  (Ukeme Ekpenyong)
For testing (to view received tickets on zendesk dashboard). 

6. SendGrid API: (Anna Chowattanakul)
1) Simply go to the home page (index), scroll down to the bottom and fill out the "Contact Form".
2) Make sure to type in the correct e-mai and all the required fields, and press submit.
3) Once you have submitted, you should recieve a welcome email from Rocket Elevators.

7. DropBox API:(Anna Chowattanakul)
1) Go admin panel in http://www.kembasy.com/admin/dashboard
2) Go to Customers panel - create a new customer
3) If the new customer's information (especially e-mai), matches the lead's information, DropBox will automatically create 
a file for that specific customer and the attachment file from the lead's database will be stored on their DropBox file instead. The DropBox file will be the customer's name.
