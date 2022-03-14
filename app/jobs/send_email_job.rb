class SendEmailJob < ApplicationJob
  queue_as :low_priority
  self.queue_name_prefix = nil

  def perform(article)
    UserMailer.send_email(article).deliver_now
  end
end
