class WatsonController < ApplicationController
    require "json"
    require "ibm_watson/authenticators"
    require "ibm_watson/text_to_speech_v1"
    include IBMWatson

    def welcome
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
        apikey: 'T3ClwOVS0mtDG-YO2GPZviH_WrfhvvcNSyeYHGvX_DYt'
        )
        text_to_speech = TextToSpeechV1.new(
        authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/"
     
    
        File.open("app/assets/audios/watson-audio.wav", "w+") do |audio_file|
            response = text_to_speech.synthesize(
              text: "Hi George, Welcome to Rocket Elevators"
              accept: "audio/wav",
              voice: "en-US_AllisonVoice"
            )
            audio_file.write(response.result)
            redirect_back(fallback_location:"/")
        end
    end
end