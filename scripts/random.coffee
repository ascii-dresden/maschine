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

max_smokecount = 5
smokealert = (robot,msg)->
      robot.smokecounter = if robot.smokecounter? then robot.smokecounter+1 else 0
      console.log "smoke alert state #{(robot.smokecounter%max_smokecount) + 1}/#{max_smokecount}"
      if robot.smokecounter % max_smokecount == 0
        msg.reply msg.random [
          "Raucher sterben früher."
          "Rauchen kann tödlich sein."
          "Rauchen führt zur Verstopfung der Arterien und verursacht Herzinfarkte und Schlaganfälle."
          "Rauchen verursacht tödlichen Lungenkrebs."
          "Rauchen in der Schwangerschaft schadet Ihrem Kind."
          "Schützen Sie Kinder – lassen Sie sie nicht Ihren Tabakrauch einatmen!"
          "Ihr Arzt oder Apotheker kann Ihnen dabei helfen, das Rauchen aufzugeben."
          "Rauchen macht sehr schnell abhängig: Fangen Sie gar nicht erst an!"
          "Wer das Rauchen aufgibt, verringert das Risiko tödlicher Herz- und Lungenerkrankungen."
          "Rauchen kann zu einem langsamen und schmerzhaften Tod führen."
          "Hier finden Sie Hilfe, wenn Sie das Rauchen aufgeben möchten: Bundeszentrale für gesundheitliche Aufklärung (BZgA) Tel.: 01805-313131, www.rauchfrei-info.de."
          "Rauchen kann zu Durchblutungsstörungen führen und verursacht Impotenz."
          "Rauchen lässt Ihre Haut altern."
          "Rauchen kann die Spermatozoen schädigen und schränkt die Fruchtbarkeit ein."
          "Rauch enthält Benzol, Nitrosamine, Formaldehyd und Blausäure."
          "Rauchen fügt Ihnen und den Menschen in Ihrer Umgebung erheblichen Schaden zu."
        ]

module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    user = msg.message.user.name.toLowerCase()
    if user == donny and Math.random() < .3
      msg.send msg.random walter_quotes
    smokeys = /(rauchen|rauch|cigar|zigar|kippe|fl.mme|fluppe|tabak|tabac|glimmst.ngel|glimst.ngel|lungenbr.tchen)/i
    if msg.messageRoom == "rauchen" or msg.message.text.match(smokeys)
      smokealert(robot,msg)

  robot.hear /(hi|hey|hallo|hey there|hello|guten tag|whats up| what's up) cafina/i, (msg) ->
    msg.reply "Woher weißt du meinen Namen? *Das hat dir der Teufel gesagt!!*"

  robot.hear /(hi|hey|hallo|hey there|hello|guten tag|whats up| what's up) maschine/i, (msg) ->
    greeting = msg.match[1]
    user = msg.message.user.name
    msg.send msg.random [
      "hey there", "hey there", "hey there"
      "war das #{user}?"
      "hallöle", "ja?"
      "na", "was?", "was denn?", "ja, #{user}"
      "ich glaub #{user} mag mich"
      "#{user}, #{greeting}"
      "#{user}, kann ich dir helfen?"
      "#{user}, Kaffee?"
      "#{greeting} #{user}"
    ]

  robot.hear /danke (kaffee)*maschine/i, (msg) ->
    user = msg.message.user.name
    msg.send msg.random [ "Bitte #{user}", "Gerne #{user}", "Kein Ding", "Kein Ding #{user}" ]

  robot.hear /.*hoffe.*/i, (msg) ->
    user = msg.message.user.name
    msg.send "das hoffe ich auch #{user}"

  robot.hear /maschine ist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    if adj.indexOf("die tür") == -1 and adj.indexOf("die tuer") == -1
      msg.reply "Du bist #{adj}!"

  robot.hear /maschine du bist (.*)/i, (msg) ->
    adj = msg.match[1].toLowerCase()
    msg.reply msg.random [ "Meinst du? \"#{adj}\" ist ein ganz schön harter Ausdruck!", "Selber #{adj}!", "#{adj} sein gar nicht so schlimm!", "#{adj}? Aber du bist noch #{adj}er", "Kannst du bitte aufhören solche Sachen über mich zu verbreiten", "Das sag ich Hendrik!", "Das sag ich Kilian!" ]

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
  "Ich glaube #{donny} hasst mich!",
  "#{donny} sei still!",
  "Es reicht #{donny}!"
]
