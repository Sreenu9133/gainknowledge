class CrudNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.create_notification.subject
  #
  def create_notification(object)
    @object = object

    mail to: 'admin123@gmail.com', subject: "A new entry for #{object.class} has been created"
  end

  def update_notification
  end

  def delete_notification
  end
end
