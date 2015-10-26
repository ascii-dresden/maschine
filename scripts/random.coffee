# Description:
#   Ein paar weitere kleine Antworten von maschine
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot random <min> <max> - Frag' hubot nach einer Zufallszahl zwischen <min> und <max> (nutzt random.org)
#
# Author:
#   kiliankoe


module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user == donny
      msg.send msg.random walter_quotes

  robot.hear /maschine ist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    if adj.indexOf("die tür") == -1 and adj.indexOf("die tuer") == -1
      msg.reply "Deine Mudda ist #{adj}!"

  robot.hear /maschine,? du bist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    msg.reply "Deine Mudda ist #{adj}!"

  robot.hear /maschine scheißt auf (.*)/i, (msg) ->
    term = msg.match[1]
    msg.reply "Deine Mudda scheißt auf #{term}!"

  robot.respond /random (\d*) (\d*)/i, (msg) ->
    min = msg.match[1]
    max = msg.match[2]
    robot.http("https://www.random.org/integers/?num=1&min=#{min}&max=#{max}&format=plain&col=1&base=10")
      .get() (err, res, body) ->
        msg.send(body.trim())

randomRange = (min, max) ->
  Math.floor(Math.random() * (max - min) + min)

donny = "slackbot"
walter_quotes = [
  "Shut the fuck up, #{donny}.",
  "#{donny}, you're out of your element!",
  "#{donny}, shut the f—",
  "That's exiti-- Shut the fuck up, #{donny}!"
]
