# Description:
#   Message to Chatwork at crontab
#
# Dependencies:
#   None
#
# Configurations:
#   HUBOT_CHATWORK_ROOMS
#   HUBOT_CHATWORK_TOKEN
#
# Commands:
#
CHATWORK_API_URL = 'https://api.chatwork.com/v1'
CHATWORK_TOKEN   = process.env.HUBOT_CHATWORK_TOKEN
CHATWORK_ROOM    = process.env.HUBOT_CHATWORK_ROOMS

cronJob = require('cron').CronJob

module.exports = (robot) ->
  # 定時ダッシュ通知
  new cronJob('0 19 * * 1-5', () =>
    message = getMessage()
    sendMessage message
  ).start()

  # メッセージをchatwork窓に送ります
  sendMessage = (message) ->
    message = "[info]" + message + "[/info]"

    robot.http("#{CHATWORK_API_URL}/rooms/#{CHATWORK_ROOM}/messages")
      .headers
        'Content-Type': 'application/x-www-form-urlencoded'
        'X-ChatWorkToken': CHATWORK_TOKEN
      .post('body=' + message) (err, r, body) ->
        robot.logger.error "Chatwork error:#{err}, body:#{body}" if err?

  # 定時ダッシュ用メッセージをランダムに取得します
  getMessage = () ->
    messages = [
      '定時になりました。今日は用事がありますのでお先に失礼します。',
      '定時になりました。さて、飲みにいこうかな。',
      '定時になりました。まだ仕事しているの？',
    ]

    random_key = Math.floor Math.random() * (messages.length)
    return messages[random_key]
