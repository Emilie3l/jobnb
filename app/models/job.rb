class Job < ApplicationRecord
  validates :pay, presence: true, numericality: true
  
  validates :title, :description, :start_date, :deadline, presence: true
  belongs_to :employer, class_name: "User"
end
