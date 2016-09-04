class TextWorker
  attr_reader :unsent_messages
  def initialize
    @unsent_messages = Message.unsent
  end

  def call
    unsent_messages.each do |message|
      send_message(message)
      mark_message_as_sent(message)
    end
  end

  private

  def send_message(message)
    SendMessage.new(message).call
  end

  def mark_message_as_sent(message)
    message.update_attributes(sent: true)
  end
end
