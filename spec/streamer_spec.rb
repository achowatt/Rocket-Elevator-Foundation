require 'ElevatorMedia/streamer'

RSpec.describe ElevatorMedia::Streamer, ".getContent" do
    #------------ This is a test for Pokemon API: https://pokeapi.co/
    context "given 'pokemon' as a param" do
        it "returns an HTML image of a pokemon as a string" do
        expect(ElevatorMedia::Streamer.getContent("pokemon")).to be_an_instance_of(String)
        expect(ElevatorMedia::Streamer.getContent("pokemon").start_with?('<img')).to be(true)
        expect(ElevatorMedia::Streamer.getContent("pokemon").end_with?('>')).to be(true)
        end
    end

    #------------ This is a test for Chuck Norris API: https://api.chucknorris.io/
    context "given 'joke' as a param" do
        it "returns a Chuck Norris Joke (text) with <div></div> tags as a string" do
        expect(ElevatorMedia::Streamer.getContent("joke")).to be_an_instance_of(String)
        expect(ElevatorMedia::Streamer.getContent("joke").start_with?('<div class="text-center">')).to be(true)
        expect(ElevatorMedia::Streamer.getContent("joke").end_with?('</div>')).to be(true)
        end
    end

    #-------------This is a test for Weather API: https://openweathermap.org/api
    context "given 'weather' as a param" do
        it "returns temperature, wind and description inside an HTML string" do
            expect(ElevatorMedia::Streamer.getContent("weather")).to be_an_instance_of(String)
            expect(ElevatorMedia::Streamer.getContent("weather").start_with?('<div class="text-center">')).to be(true)
            expect(ElevatorMedia::Streamer.getContent("weather").end_with?('</div>')).to be(true)
        end
    end

end 

