require 'line/bot'
class LineBotYuanController < ApplicationController
  protect_from_forgery with: :null_session
  def index 
    
  end

  def webhook
    client ||= Line::Bot::Client.new { |config|
      config.channel_id = ENV["YUAN_CHANNEL_ID"]
      config.channel_secret = ENV["YUAN_CHANNEL_SECRET"]
      config.channel_token = ENV["YUAN_CHANNEL_TOKEN"]
    }

    reply_token = params['events'][0]['replyToken']

    message = {
      type: 'text',
      text: '好哦～好哦～'
    }
  
    response = client.reply_message(reply_token, message)

    "OK"
  end
end
