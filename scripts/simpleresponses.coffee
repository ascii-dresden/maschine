# Description:
#   Einfache trigger-response Interaktionen
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
#
# Author:
#   kiliankoe



simpleresponses = [
  [
    /wat is wacken\?/i,
    "Dat ist Wacken. Einmal im Jahr kommen hier alle bösen schwarzen Männer aus Mittelerde her, um ma richtig die Sau rauszulassen."
  ]
]

simplelistens = [
  [/jehova/i, "http://i.imgur.com/01PMBGj.gif"],
  [/sparta/i, "http://i.imgur.com/AacKWRt.gif"],
  [/grumpy/i, "http://truestorieswithgill.com/wp-content/uploads/2013/09/20130915-190532.jpg"],
  [/madness/i, "Madness you say? THIS. IS. PATRI... MATTHIAS!"],
  [/^nein$/i, "Doch!"]
]


module.exports = (robot) ->

 simplelistens.forEach (resp_tuple) ->
   [trigger, answer] = resp_tuple
   robot.hear trigger, (msg) ->
     msg.send answer

  simpleresponses.forEach (resp_tuple) ->
    [trigger, answer] = resp_tuple
    robot.respond trigger, (msg) ->
      msg.send answer
