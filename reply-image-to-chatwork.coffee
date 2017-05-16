# Description:
#   Return image preview, When hear specific word
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

CHATWORK_IMAGE_TAG = "[preview id=xxxxxx ht=xxx]"

module.exports = (robot) ->
  # 特定の文言に反応してスタンプを送ります（スタンプ画像は事前に1度はってpreview idを入手すること）
  robot.hear /反応する言葉/i, (msg) ->
    @exec = require('child_process').exec

    msg.reply CHATWORK_IMAGE_TAG
