
module.exports = (robot) ->
  robot.hear /.*(good night|bye|nighty night|gute nacht|nacht|nachtchen|gn8|gn9|bis morgen)[^\w]*/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    msg.send msg.random [
      "Gute Nacht #{user}."
      "Nacht #{user}."
      "Schlaf schön #{user}."
      "Schon müde #{user}?"
      "Aber #{user} du gehst doch sonst nicht so früh ins Bett?"
      "Nacht."
      "Nachti."
      "gN8."
      "Kannst du nach so viel Koffein noch schlafen?"
      "Schlafe süß."
      "Träum' süß vom sauren Apfel"
      "So long, and thanks for all the fish."
      "Hau schon ab!"
      "TTYL"
      "C U L8R"
      "Ok, bis dann!"
      "nicht mehr weiter hacken?"
      "Jetzt schon? Es gibt noch so viele Pull Requests die du machen könntest."
      "ciao", "ca", "cya"
      "Tschü!", "Tschausen!"
    ]


