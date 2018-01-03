require 'pry'
require './lib/activity'

class Reunion

  attr_reader :location,
              :activities,
              :participants

  def initialize(location)
    @location     = location
    @activities   = []
    @participants = {}
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.reduce(0) do |result, activity|
      result + activity.total_cost
    end
  end

  def total_participants
    @activities.reduce(0) do |result, activity|
      result + activity.participants.count
    end
  end

  def average_cost
    total_cost / total_participants
  end

  def split_cost
    @activities.each do |activity|
      check_each_participant(activity)
    end
    @participants
  end

  def check_each_participant(activity)
    activity.participants.each do |participant|
      if participant[1] > average_cost
        puts "#{participant[0]} is owed #{participant[1] - average_cost}"
        @participants[participant[0]] = (average_cost - participant[1])
      elsif participant[1] < average_cost
        puts "#{participant[0]} owes #{average_cost - participant[1]}"
        @participants[participant[0]] = (average_cost - participant[1])
      else
        puts "#{participant[0]} owes nothing and nothing is owed."
        @participants[participant[0]] = (average_cost - participant[1])
      end
    end
  end

  def erb_page
    renderer = ERB.new(template)
    html = File.new("winter_park.html")
    html.puts renderer.result
  end

  def template
    "<html><head></head><body>Welcome to the Richard Family Reunion!

    There are currently <%= #{activities.count} %> activities going.

    <%= #{total_participants} %> have joined, spending $<%= #{total_cost} %>!

    Please see Adam if you payed more or less than $<%= #{average_cost} %>.

    Have fun in Winter Park!</body></html>"
  end
end
