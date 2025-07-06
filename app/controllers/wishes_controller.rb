class WishesController < ApplicationController
  def index
    @wish = Wish.new
    @wishes = Wish.order(created_at: :desc)
  end

  def create
    @wish = Wish.new(wish_params)
    if @wish.save
      redirect_to root_path, notice: "願いごとを投稿しました"
    else
      @wishes = Wish.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:name, :message)
  end
end
