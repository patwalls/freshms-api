require 'twilio-ruby'

class SendMessage
  # ACCOUNT_SID = 'PN5e9eebe9ae39e03925fba5278ed11031'
  ACCOUNT_SID = 'ACf5be4b90940aa6da27f5d4409cbff8d3'
  AUTH_TOKEN = '2dc66e0443c4a042c304aeacd0e6671b'
  TWILIO_NUMBER = '+17182606725'

  attr_reader :phone, :message_body, :client

  def initialize(message)
    @phone = message.user.phone
    @message_body = message.body
    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  end

  def call
    send_sms
  end

  private

  def send_sms
    client.account.messages.create(
    	from: TWILIO_NUMBER,
    	to: phone,
    	body: message_body
    )
  end
end
