class Application < ApplicationRecord
  validates :cv, :job, :applicant, presence: true
  belongs_to :applicant, class_name: 'User'
  belongs_to :job

  # CV attachment
  has_one_attached :cv
end
