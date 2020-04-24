require 'json'

module ElevatorMedia
    class Streamer
        def self.getContent(param)
                #pokemon API -- Elevator::Streamer.getContent('pokemon')
                if param == "pokemon" 
                    id = rand(800) #randomize the ID number to get a different pokemon everytime to page loads
                    uri = URI("https://pokeapi.co/api/v2/pokemon-form/#{id}/")
                    response = Net::HTTP.get(uri)
                    obj = JSON.parse(response)['sprites']['front_default']
                    puts "this is the picture url: #{obj}" #shows an url of the image of pokemon
                    content = %Q[<img src="#{obj}" alt = "random pokemon" style="width:300px; height:300px">]
                    return content #returns an html image of a random pokemon
                
                #joke API -- Elevator::Streamer.getContent('joke')
                elsif param == "joke"
                    uri = URI("https://api.chucknorris.io/jokes/random")
                    response = Net::HTTP.get(uri)
                    obj = JSON.parse(response)['value']
                    puts "this is the joke url: #{obj}"  #shows an url of Chuck Norris' joke
                    content = %Q[<div class="text-center"><p>Here's a joke:</p><p>#{obj}</p></div>]
                    return content #returns an html of a random joke
                
                #weather API -- Elevator::Streamer.getContent('weather')
                elsif param == "weather"  #gets toronto weather
                    uri = URI('https://api.openweathermap.org/data/2.5/weather?q=toronto&appid=1ed70474cd650d1d691933fc05212256')
                    response = Net::HTTP.get(uri)
                    description = JSON.parse(response)['weather'][0]['description']
                    temperature = JSON.parse(response)['main']['temp']
                    feel = JSON.parse(response)['main']['feels_like']
                    wind = JSON.parse(response)['wind']['speed']
                    puts "Toronto's weather has #{description}. The temperature is #{temperature} kelvins but it feels like #{feel} kelvins. The wind speed is #{wind}m/s."
                    content = %Q[<div class="text-center"> Toronto's weather has #{description}. The temperature is #{temperature} kelvins but it feels like #{feel} kelvins. The wind speed is #{wind} m/s.</div>]
                    return content #returns an html text of weather + description
                end
        end
    end
end
