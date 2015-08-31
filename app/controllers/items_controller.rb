class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = current_user
    @items = @user.items

    if @item.save
      flash[:notice] = "to-do item created!"
      redirect_to @user
    else
      flash[:error] = "error saving item, try again!"
      redirect_to @user
    end
  end

  def destroy
  @user = User.find(params[:user_id])
  @item = @user.items.find(params[:id])

    if @item.destroy
      flash.now[:notice] = "item was removed"
      redirect_to [@user]
    else
      flash.now[:error] = "item was not removed"
      redirect_to [@user]
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
