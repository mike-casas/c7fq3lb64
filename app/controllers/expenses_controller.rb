class ExpensesController < ApplicationController
  def index
    if params[:category_id] != "" ||  params[:concept]!=""
      @expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%")
    else
      @expenses = Expense.order("date DESC")
    end
  end
end
