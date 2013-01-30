# hubot greeting.
#
# (rock|spock|paper|lizard|scissors) - say hi to your butler

# Description:
#   Play 'rock paper scissors lizard spock with Hubot'
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_MSTRANSLATE_APIKEY
#
# Commands:
#   <rock|paper|scissors|lizard|spock> - Choose which move to play
#
# Author:
#   danhigham

beats =
  'scissors' : 
    'paper' : 'scissors cut paper'
    'lizard' : 'scissors decapitate lizard'
  'paper' : 
    'rock' : 'paper covers rock'
    'spock' : 'paper disproves Spock'
  'rock' : 
    'lizard' : 'rock crushes lizard'
    'scissors' : 'rock blunts scissors'
  'lizard' : 
    'spock' : 'lizard poisons spock'
    'paper' : 'lizard eats paper'
  'spock' : 
    'rock' : 'Spock vaporizes rock'
    'scissors' : 'Spock melts scissors'

rspls = (msg, user_choice) ->
  choices = ['scissors','paper','rock','lizard','spock']
  i = Math.floor(Math.random() * 5)
  choice = choices[i]

  beaten = beats[user_choice]

  if beaten[choice]? # user wins
    result = beats[user_choice][choice]
  else # hubot wins
    result = beats[choice][user_choice]

  result = "Draw!" if not result

  msg.send "Hubot chooses #{choice}"
  msg.send result

module.exports = (robot) ->
  robot.respond /(rock|spock|paper|lizard|scissors)/i, (msg) ->
    user_choice = msg.match[1].toLowerCase()
    rspls(msg, user_choice)
