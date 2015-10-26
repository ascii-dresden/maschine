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

  robot.hear /(hi|hey|hallo|hey there|hello|guten tag|whats up| what's up) maschine/i, (msg) ->
    greeting = msg.match[1]
    user = msg.message.user.name
    msg.send msg.random [
      "hey there", "hey there", "hey there"
      "war das #{user}?"
      "hallöle", "ja"
      "na", "was?", "was denn?", "ja, #{user}"
      "ich glaub #{user} mag mich"
      "#{user}, #{greeting}"
      "#{user}, kann ich dir helfen?"
      "#{user}, Kaffee?"
      "#{greeting} #{user}"
    ]

  robot.hear /maschine ist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    if adj.indexOf("die tür") == -1 and adj.indexOf("die tuer") == -1
      msg.reply "Du bist #{adj}!"

  robot.hear /maschine,? du bist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    msg.reply "Meinst du? \"#{adj}\" ist ein ganz schön harter Ausdruck!"

  robot.hear /maschine scheißt auf (.*)/i, (msg) ->
    term = msg.match[1]
    msg.reply "japp, #{term} ist mir Wurst!"

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
  "Du bist gar kein richtiger Bot, #{donny}.",
  "Ich glaube #{donny}, hasst mich!",
  "#{donny}, ",
  "That's exiti-- Shut the fuck up, #{donny}!"
]
