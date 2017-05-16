
#Commands:
#  hubot test run test.sh
#

CHATWORK_API_URL = 'https://api.chatwork.com/v1'
CHATWORK_TOKEN   = process.env.HUBOT_CHATWORK_TOKEN
CHATWORK_ROOM    = process.env.HUBOT_CHATWORK_ROOMS

# hubot testに反応してsh /path/to/test.shを実行します
module.exports = (robot) ->
  robot.respond /test/, (msg) ->
    @exec = require('child_process').exec

    command = "sh /path/to/test.sh"

    msg.send "#{command}を実行します。"

    @exec command, (error, stdout, stderr) ->
      msg.send error if error?
      msg.send stdout if stdout?
      msg.send stderr if stderr?

    msg.send "実行しました。"
