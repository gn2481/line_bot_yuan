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
    return unless recevied_text == "@小圓 現在幾點" 
    "現在時間是 #{Time.zone.now.strftime("%l:%M:%S %p")}"
  end

  def recevied_text
    message = params[:events][0][:message]
    message[:text] unless message.nil?
  end
end
