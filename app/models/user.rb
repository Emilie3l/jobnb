class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone_number, presence: true

  has_many :owned_jobs, foreign_key: :employer_id, class_name: "Job", dependent: :destroy
  has_many :applications, foreign_key: :applicant_id
  has_many :jobs, through: :applications

  # Profile photo attachment
  has_one_attached :profile_photo
end
