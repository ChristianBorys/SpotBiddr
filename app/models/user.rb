class User < ActiveRecord::Base
  authenticates_with_sorcery!


  validates :password, presence: true 
  validates :email, presence: true, uniqueness: true
 

end

