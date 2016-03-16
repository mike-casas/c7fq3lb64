class ExpensesController < ApplicationController
  def index
    if params[:category_id].present? &&  params[:concept].present?
      @expenses = Expense.where("category_id= ? AND concept LIKE ?", params[:category_id],"%#{params[:concept]}%")
    else
      if params[:category_id].present?
        @expenses = Expense.where("category_id= ?", params[:category_id])
      else
        if params[:concept].present?
          @expenses = Expense.where("concept LIKE ?","%#{params[:concept]}%")
          else
            @expenses = Expense.order("date DESC")
        end
      end
    end
  end
end
