class TransactionsController < ApplicationController
  def index
    @transactions = if params[:tagged].present?
      Transaction.tagged_with(params[:tagged]).order(:date).reverse
    else
      Transaction.order(:date).reverse
    end
    @new_transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params.require(:transaction).permit(:date, :amount, :comment, :tag_list))
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
