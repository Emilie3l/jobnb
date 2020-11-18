class Job < ApplicationRecord
  # pay must be an integer greater than or equal to 0
  validates :pay, presence: true,
                  numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0 }
  # title, description and start_date are required
  validates :title, :description, presence: true
  # start_date and deadline are required
  validates :start_date, :deadline, presence: true
  # start_date cannot be in the past
  # dealine must be greater that start_date
  validate :start_date_cannot_be_in_the_past,
           :deadline_must_be_greater_that_start_date

  belongs_to :employer, class_name: "User"
  has_many :applications
  has_many :applicants, through: :applications

  # Banner photo Attachment
  has_one_attached :banner_photo

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def deadline_must_be_greater_that_start_date
    if start_date >= deadline
      errors.add(:deadline, "must be greater that start date")
    end
  end
end
