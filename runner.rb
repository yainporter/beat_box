require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

bb = BeatBox.new("beep")
bb.prepend("Boop")
bb.prepend("beep")
bb.prepend("wop beep boop baap beee deep doop daap deee")
bb.append("wop beep boop baap beee")

bb.reset_rate
bb.play
bb.voice = "Samantha"
bb.play
bb.rate = 400
bb.play
bb.reset_voice
bb.play

