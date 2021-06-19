class ItemsController < ApplicationController
  before_action :find_item, only: %i[edit update destroy]
    def index
      # 之後做分頁
      @items = Item.all
    end

    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(items_params)

      if @item.save
        flash[:notice] = "成功"
        redirect_to root_path
      else
        flash[:alert] = "新增失敗"
        render :new
      end
    end
      
    def edit; end

    def update
      if @item.update(items_params)
        flash[:notice] = "更新成功"
        redirect_to root_path
      else
        flash[:alert] = "更新失敗"
        render :edit
      end
    end

    def destroy
    end

    private

    def find_item
      @item = Item.find(params[:id])
    end

    def items_params
      params.require(:item).permit(:kind, :name, :attribution, :image_link, :rare, :description, :tag)
    end
    
end
