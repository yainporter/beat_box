require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

bb = BeatBox.new
# bb.append("Boop")
bb.append("beep")
bb.append("wop beep boop baap beee deep doop daap deee")
require 'pry'; binding.pry
bb.play


# say -r 500 -v Boing "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom "
# data_array = ["beep", "boop", "baap", "beee"]
