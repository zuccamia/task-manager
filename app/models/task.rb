class Task < ApplicationRecord
  validates :title, presence: :true

  def completed?
    true if self.completed == true
  end

  # private

  # def set_defaults
  #   self.completed = false
  # end
end
