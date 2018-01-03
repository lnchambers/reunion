require "./lib/reunion"
require "./lib/activity"
require "erb"

reunion = Reunion.new("Winter Park")
activity = Activity.new("hiking")
activity2 = Activity.new("biking")

activity.add_participant("Richard", 15)
activity.add_participant("Rich", 16)
activity.add_participant("Richie", 17)
activity.add_participant("RIRIRI", 18)
activity.add_participant("Richardo", 19)
activity2.add_participant("Adam", 20)
activity2.add_participant("Rich Richie", 21)
activity2.add_participant("Richie Rich", 22)
activity2.add_participant("RIRIRIRI", 23)
activity2.add_participant("Richardo Montoya", 24)
activity2.add_participant("Inigo", 25)
reunion.add_activity(activity)
reunion.add_activity(activity2)

reunion.erb_page
