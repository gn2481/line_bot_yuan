class ItemsController < ApplicationController
  
    def index
      @items = Item.all
    end
  
    def show
    end

    def new
      @items = items.new
    end
    
  
    def create
      @items = items.new(items_params)
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
      
    end
    
end
