class WishesController < ApplicationController
  def index
    @wish = Wish.new
    @wishes = Wish.order(created_at: :desc).map.with_index do |wish, i|
      color = %w[bg-pink-300 bg-yellow-300 bg-blue-300 bg-green-300 bg-purple-300][i % 5]
      OpenStruct.new(wish: wish, color: color)
    end
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
