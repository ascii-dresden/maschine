# Description:
#   Complains toward annoying chatters.
#

max_annoy = 4
module.exports = (robot) ->

  robot.hear /.*/, (msg) ->
    user = msg.message.user.name.toLowerCase()
    robot.current_spammer ?= {name: "noone", count: 0}
    if robot.current_spammer.name == user
      robot.current_spammer.count += 1
      console.log robot.current_spammer
    else
      robot.current_spammer = {name: user, count: 0}

    if robot.current_spammer.count >= max_annoy + 3
      robot.current_spammer = {name: "noone", count: 0}

    if robot.current_spammer.count > 4
      msg.send msg.random [
        "#{user}! du nervst!!"
        "#{user} redest du mit dir selbst?"
        "#{user} spam hier nicht so rum!"
        "#{user}!"
        "Bitte #{user}!"
        "#{user}! das ist hier nicht zum Spielen gedacht!"
        "#{user} bitte reiß dich zusammen."
      ]
