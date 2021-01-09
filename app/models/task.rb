class Task < ApplicationRecord
  validates :title, presence: :true
  after_initialize :set_defaults

  def completed?
    true if self.completed == true
  end

  private

  def set_defaults
    self.completed = false if self.new_record?
  end
end
