class Application < ApplicationRecord
  belongs_to :applicant, class_name: 'User'
  belongs_to :job

  # CV attachment
  has_one_attached :cv

  validates :cv, presence: true
end
