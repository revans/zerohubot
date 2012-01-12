# Returns a random Pun
#
# hubot pun me

#list of fallbacks

tryAnotherPun = [
    "I used to enjoy kabuki theatre, but now I prefer noh drama.",
    "Priests make sure they use the correct syn-tax.",
    "It's hard to wear your heart on your sleeve if all you own is tanktops.",
    "Gas companies cannot fuel all of the people all of the time.",
    "Do hotel managers get board with their jobs?",
    "Salt water puns are a bunch abalone.",
    "What do people buy coffee with? Starbucks.",
    "The proctologist reassured the patient that his condition could be rectified.",
    "I don't recommend dating bridge builders, they have truss issues.",
    "After my ear operation I feel sound.",
    "Bum Bum Bum, Another Pun Bites the Dust"
]
    
module.exports = (robot) ->
  robot.respond /(say a )?(bad)?pun( me)?$/i , (msg) ->
    punOfTheDay msg, (url) ->
      msg.send url
    
#grab a msg from badpun

punOfTheDay = (msg, cb) ->
  msg.http('http://www.badpuns.com/jokes.php?section=oneline&pos=random')
  .get() (err, res, body) ->
        
        response = body.match(/<div class='joke_body_text'>(.*?)<\/div>/)
        
        if !response
            
            rand = Math.floor(Math.random() * 11);
            
            response = tryAnotherPun[rand]
        else
            response = response?[1] .replace(/<BR>/g, '')
    
        cb response 



