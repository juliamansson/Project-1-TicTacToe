class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :moves
  has_many :x_matches, class_name: 'Match', foreign_key: :user_x_id
  has_many :o_matches, class_name: 'Match', foreign_key: :user_o_id
  has_many :wins, class_name: 'Match', foreign_key: :winner

  mount_uploader :user_image, UserImageUploader

  def matches
    x_matches + o_matches
  end

  def user 
    user_x_id + user_o_id
  end

  def name
    "#{first_name}  #{last_name}"
  end

end
