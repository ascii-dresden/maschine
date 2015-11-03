
module.exports = (robot) ->
  robot.hear /.*(good morning|morjen|guten morgen|morgen maschine)[^\w]*/i, (msg) ->
    user = msg.message.user.name.toLowerCase()
    d = new Date()
    console.log d
    if d.getHours() < 9
      msg.send msg.random [
        ":angry: :angry: Es ist vor um 9! Lass mich Pennen, das ascii hat noch gar nicht auf!"
        ":sleeping: Hallo? Ich schlafe noch!"
        ":tired_face: Ich will aber noch nicht aufstehen."
      ]
    else if d.getDay() == 1
      msg.send msg.random [
        "Och nöö! Es ist Montag :astonished:"
        "Das Wochenende ist schon vorbei?"
        "Montag? Ich hasse Montag."
        ":ascii: Ach ja, Montag ist immer so schön ruhig hier im ascii."
        ":ascii: Glückwunsch, dein nächster Kaffee geht auf mich"
      ]
    else
      msg.send msg.random [
        ":yum: Guten Morgen #{user}."
        ":stuck_out_tongue_winking_eye:Morgen #{user}."
        ":stuck_out_tongue_closed_eyes:Guten Morgen #{user}, gut geschlafen?."
        ":kissing_cat: Noch müde #{user}?"
        ":blush: Du bist aber früh auf #{user}, so kenn ich dich ja gar nicht?"
        ":coffee: Mojn."
        "Morgeeen :coffee:"
        "Good Morning Sunshin. :stuck_out_tongue_winking_eye:"
        ":stuck_out_tongue_closed_eyes: Konntest du nach so viel Koffein noch schlafen?"
        "Süß geträumt?  :blush:"
        ":kissing_cat: Gut geschlafen?"
        "Jetzt schon? Ich will noch nicht raus :stuck_out_tongue_winking_eye:"
        ":yum: Oh, ist es schon Morgen? Kacke, die Nacht war so schnell vorbei."
      ]


