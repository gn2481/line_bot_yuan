require 'line/bot'
class LineBotYuanController < ApplicationController
  protect_from_forgery with: :null_session
  def index; end

  def webhook
    # 關鍵字回覆
    reply_text = keyword_reply(recevied_text)

    # TODO: 主動發送訊息
    response = reply_to_line(reply_text)

    head :ok
  end

  private

  def line
    # line_bot 初始化
    @line ||= Line::Bot::Client.new { |config|
      config.channel_id = ENV["YUAN_CHANNEL_ID"]
      config.channel_secret = ENV["YUAN_CHANNEL_SECRET"]
      config.channel_token = ENV["YUAN_CHANNEL_TOKEN"]
    }
  end

  # 發送訊息到 line
  def reply_to_line(reply_text)
    reply_token = params[:events][0][:replyToken]

    message = {
      type: 'text',
      text: reply_text
    }

    line.reply_message(reply_token, message)
  end

  def keyword_reply(recevied_text)
    return "webhook 已開啟" if recevied_text == "@小圓 webhook" 
    return unless recevied_text == "@小圓 抽" 
    "今天的你適合～\n #{lottery_string}"
  end

  def recevied_text
    message = params[:events][0][:message]
    message[:text] unless message.nil?
  end

  def item_name(kind)
    begin
      item_name = case kind
                when "back"
                  Item.back.sample.name
                when "cape"
                  Item.cape.sample.name
                when "hair"
                  Item.hair.sample.name
                when "face"
                  Item.face.sample.name
                when "clothes"
                  Item.clothes.sample.name
                when "choker"
                  Item.choker.sample.name
                when "headwear"
                  Item.headwear.sample.name
                end
    rescue NoMethodError => e
      "供你自由搭配唷"
    end
  end
# 衣服 面具 頭髮頭飾披風背飾項鍊
  def lottery_string
    "衣服： #{item_name("clothes")} \n 面具：#{item_name("face")} \n 頭髮：#{item_name("hair")} \n 頭飾：#{item_name("headwear")} \n 披風：#{item_name("cape")} \n 背飾： #{item_name("back")} \n 項鍊：#{item_name("choker")}"
  end
end
