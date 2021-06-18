class LineBotYuanController < ApplicationController
  protect_from_forgery with: :null_session
  def index 
    
  end

  def webhook
    #回覆
    head :ok
  end
end
