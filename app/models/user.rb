class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: true
  validates :password,           presence: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_ka,       presence: true
  validates :first_name_ka,      presence: true
  validates :birthday,           presence: true

  has_many :items
  has_many :purchases
end
