class Todo < ActiveRecord::Base
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2 }
  validates :due_date, presence: true

  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} #{due_date.to_fs(:long)}"
  end

  def self.overdue
    where("due_date < ? ", Date.today)
  end

  def self.due_today
    where("due_date = ? ", Date.today)
  end

  def self.due_later
    where("due_date > ? ", Date.today)
  end

  def self.completed
    where(completed: true)
  end

  def self.not_completed
    where(completed: false)
  end
end