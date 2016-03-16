class ExpensesController < ApplicationController
  def index
    if params[:category_id] != "" &&  params[:concept]!=""
      @expenses = Expense.where("category_id= ? AND concept LIKE ?", params[:category_id],"%#{params[:concept]}%")
    else
      @expenses = Expense.order("date DESC")
    end
  end
end
