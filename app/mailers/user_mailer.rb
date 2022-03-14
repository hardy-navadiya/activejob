class UserMailer < ApplicationMailer
	def send_email(article)
  	# @user = user
   #  mail to: @user.email, from: 'hardynavadiya.tech@gmail.com'
    @article = article
    mail(to: User.pluck(:email), subject: 'Simple Demo to showcase Active Job', from:'hardynavadiya.tech@gmail.com')
  end
end
