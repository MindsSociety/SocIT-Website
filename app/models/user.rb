class User < ActiveRecord::Base
  def enable_email
    update(email_opt_in: true)
  end

  def disable_email
    update(email_opt_in: false)
  end
end
