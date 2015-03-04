class Transaction < ActiveRecord::Base
  acts_as_taggable

  validates_presence_of :date, :amount

  def type
    self.amount > 0 ? 'income' : 'expense'
  end
end
