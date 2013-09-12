require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  #attr_accessor :first_name, :last_name, :gender, :birthday

  def name
    return "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1) 
  end

  def dob_check
    age >= 3
  end


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  validates :birthday, :presence => true, :if => :dob_check
  
  validates :phone_number, presence:  true,
                            format:   { with: VALID_PHONE_REGEX }




end
