require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

# bb = BeatBox.new("beep")
# bb.prepend("Boop")
# bb.prepend("beep")
# bb.prepend("wop beep boop baap beee deep doop daap deee")
# bb.append("wop beep boop baap beee")

# bb.play

# list = LinkedList.new
# list.append("bee boop bap doop dee")
# list.check_sounds("beep bop")

valid_beats = LinkedList.new
valid_beats.append("tee dee deep bop boop la na wop weep wap wup wip deep daah dee da daa dop dip dup dep bip bap baap baa baah bup buup tip tap top lee lah luh lap lip lop hee haw hip hop beep")

puts valid_beats
puts valid_beats

# say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
# data_array = ["beep", "boop", "baap", "beee"]
