module Mailer
  require 'mandrill'

  DEFAULT_FROM_ADDRESS='contact@pledgebench.com'
  ANALYTICS_EMAIL_RECIPIENT='aaronjrandall@gmail.com'

  def self.send_analytics_email(subject, body)
    return if Rails.env.development?

    m = Mandrill::API.new ENV['MANDRILL_API_KEY']
    message = {  
     :subject => subject,  
     :from_name => 'Pledgebench',
     :text => body,  
     :to => [  
       {  
         :email=> ANALYTICS_EMAIL_RECIPIENT,
         :name=> "Pledgebench"
       }  
     ],  
     :text => body,  
     :from_email => DEFAULT_FROM_ADDRESS
    }  

    m.messages.send message  
  end
end
