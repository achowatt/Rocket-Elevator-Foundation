**Week 14** by ANNA CHOWATTANAKUL

My website: www.annachowattanakul.ca


**WEEK 11 QUALITY** by ANNA CHOWATTANAKUL
-----------------------------------------
To start:
1) clone the rails app
2) spec file folder 4 test files:
    - streamer_spec.rb
    - user_login_spec.rb
    - user_logout_spec.rb
    - new_user_spec.rb
    
    Run the following command to test all those features:
    - bundle exec rspec ./spec/streamer_spec.rb --format documentation
    - bundle exec rspec ./spec/user_logout_spec.rb --format documentation
    - bundle exec rspec ./spec/user_login_spec.rb --format documentation
    - bundle exec rspec ./spec/new_user_spec.rb --format documentation
    
3) The code for streamer can be found inside Lib/ElevatorMedia/Streamer.rb
4) See streamer code inside view at: localhost:3000/pokemon (shows weather, joke, and pokemon)

That's all! Have a great week :)


**WEEK 9 CONSOLIDATION** by ANNA CHOWATTANAKUL
----------------------------------------------
To start: 

1) Go to annachowattanakul.ca
2) Click log in on the home page

For admin login: 
1) click Login
2) choose employee Login
3) user: coach's email , password: 123456
3) Access the Intervention Request page
4) Fill out the form
5) Check Zendesk account

ZENDESK ACCOUNT

6) Check out my RESTFUL API app :)

Here are the commands for the RESTFUL API on AZURE:
https://annachowattanakulapi.azurewebsites.net/

GET REQUESTS**
1. To see all the interventions
https://annachowattanakulapi.azurewebsites.net/api/intervention/all

2. To get an intervention by id
https://annachowattanakulapi.azurewebsites.net/api/intervention/2

3. Returns all fields of all Service Request records that do not have a start date and are in "Pending" status.
https://annachowattanakulapi.azurewebsites.net/api/intervention/pending


PUT REQUESTS**
4. Change value of any parameters
https://annachowattanakulapi.azurewebsites.net/api/intervention/2

5. Change the status of the intervention request to "InProgress" and add a start date and time (Timestamp).
https://annachowattanakulapi.azurewebsites.net/api/intervention/2/inProgress

6. Change the status of the request for action to "Completed" and add an end date and time (Timestamp).
https://annachowattanakulapi.azurewebsites.net/api/intervention/2/completed

Check out my repo for REST_API for more info:
https://github.com/achowatt/REST_API_ROCKET_ELEVATORS

-----------------------------------------------------

For Testing Locally:

1. Git Clone this repo.
2. The files database.yml, application.yml, ibm-credentials.env must be requested for security reasons. (Contact our team leader Ukeme).
3. Copy the files database.yml adnd application.yml in the folder config. 
   database.yml
4. Copy the file ibm-credentials.env in the root folder.
5. Execute: bundle update
6. Execute: rake db:create
7. Execute: rake db:migrate
8. Exceute: rake db: seed



# ROCKET ELEVATORS API (Week 8)
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
