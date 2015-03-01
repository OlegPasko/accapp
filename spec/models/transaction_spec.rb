require 'spec_helper'

describe 'Transaction' do

  let(:transaction_with_no_amount) { Transaction.create() }
  let(:transaction_with_no_category) { Transaction.create(amount: 100) }
  let(:salary_transaction) { Transaction.create(amount: -100) }

  it 'should always have amount' do
    transaction_with_no_amount.should_not be_valid
  end
  it 'should have income and expense types'
  it 'should be income type when positive amount'
  it 'should be expense type when negative amount'
  it 'should returns categories on call' do
    salary_transaction.should respond_to(:categories)
  end
  it 'should returns scoped transactions with_category'

end