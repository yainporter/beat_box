require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

bb = BeatBox.new("beep")
bb.prepend("beep")
bb.prepend("wop beep boop baap deep doop")
bb.pop
bb.append("wop beep boop baap")
bb.pop
bb.insert(4, "dee doo daa")


# bb.play
# bb.voice = "Samantha"
# bb.play
# bb.rate = 400
# bb.play
# bb.reset_voice
# bb.play
# bb.reset_rate
puts bb.to_string
