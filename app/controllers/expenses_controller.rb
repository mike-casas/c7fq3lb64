class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:category_id].present? &&  params[:concept].present?
      @expenses = Expense.where("category_id= ? AND concept LIKE ? AND user_id= ?", params[:category_id],"%#{params[:concept]}%", current_user)
    else
      if params[:category_id].present?
        @expenses = Expense.where("category_id=? AND user_id= ?", params[:category_id], current_user)
      else
        if params[:concept].present?
          @expenses = Expense.where("concept LIKE ? AND user_id= ?","%#{params[:concept]}%", current_user)
          else
            @expenses = Expense.order("date DESC").where("user_id=?", current_user)
        end
      end
    end
  end
end
