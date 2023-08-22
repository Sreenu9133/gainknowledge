class SendWelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Lets send the email"
    UserNotificationMailer.create_notification(booking).deliver_now
  end
end