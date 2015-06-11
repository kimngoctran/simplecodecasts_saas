class ContactMailer < ActionMailer::base
  default to: 'ngoc.frcnam@gmail.com'
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    email(from: email, subject: 'Contact From Message')
  end
end