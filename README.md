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


Twilio: (Jorge Chavarriaga)
1. Go to the Elevators tab
2. Choose an elevator to edit 
3. Change the status to intervention
4. Update Elevator
5. You will see the following message in your browser: "Elevator was successfully updated."
6. If you go to your console, you will see a message with all the information that was sent to the technician registered in the database.
7. An SMS is immediately sent to the phone number of the technician registered in the database (in this case all buildings have Patrick Thibault's cell number).

Slack: (David Hunter)
1. Go to the Elevators tab
2. Choose an elevator to edit 
3. Change the status to active or inactive
4. Update Elevator
5. You will see the following message template sent in the slack channel: "Elevator 1002 with Serial Number 9305206536082 status has been changed from active to inactive"

Watson: (Jorge Chavarriaga / Ukeme Ekpenyog / David Hunter)
1. In the admin panel in the dashboard you can see all the information requerid for watson (text to speech)
...


Google Maps API:
- To test Google Maps API: go admin panel in http://www.kembasy.com/admin/dashboard  then click on the button customers geolocation in the dashboard. 
- This youtube video shows the test localy: https://youtu.be/vZZW9lDEZIk. 

Zendesk api 
for testing (to view received tickets on zendesk dashboard)
url: www.zendesk.com
username: rocketelevator.zendesk.com
pwd: rocketelevators
zendesk email: kembasy@yahoo.com

Guys complete your api test here!



