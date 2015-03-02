class Transaction < ActiveRecord::Base
  validates_presence_of :date, :amount

  def type
    self.amount > 0 ? 'income' : 'expense'
  end
end
