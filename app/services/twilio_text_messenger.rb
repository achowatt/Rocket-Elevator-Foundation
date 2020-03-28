class TwilioTextMessenger
    attr_reader :message
  
    def initialize(message, totest)
      @message = message
      @totest = totest
    end
  
    def call
      client = Twilio::REST::Client.new
      client.messages.create({
        from: ENV['TWILIO_PHONE_NUMBER'],
        #to: '+15145037764',
        to: @totest,
        body: message
      })
    end
  end

 
