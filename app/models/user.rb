class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :password,           presence: true, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :birthday,           presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :last_name_ka
    validates :first_name_ka
  end

  has_many :items
  has_many :purchases
end
