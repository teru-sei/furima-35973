class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday

    with_options length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}+\z/, message: 'is invalid. Include both letters and numbers' } do
      validates :password
    end

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
      validates :last_name_ka
      validates :first_name_ka
    end
  end

    has_many :items
    has_many :purchases
end