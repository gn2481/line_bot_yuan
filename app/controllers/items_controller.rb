class ItemsController < ApplicationController
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
  
    def update
    end
  
    def edit
    end
  
    def destroy
    end

    private

    def find_items
      @items = items.find(params[:id])
    end

    def items_params
      params.require(:item).permit(:kind, :name, :attribution, :image_link, :rare, :description, :tag)
    end
    
end
