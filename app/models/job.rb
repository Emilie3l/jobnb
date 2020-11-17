class Job < ApplicationRecord
  belongs_to :employer, class_name: "User"
end
