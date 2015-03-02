class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order(:date).reverse
    @new_transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params.require(:transaction).permit(:date, :amount, :comment))
    if @transaction.save
    else
      render js: "alert('Check data')";
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end
end
