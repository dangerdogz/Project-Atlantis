class Project < ActiveRecord::Base
  validates :name, :brief, presence: true
end
