require 'pry'

class Activity

  attr_reader :activity,
              :participant

  def initialize(activity, participant = {})
    @activity = activity
    @participant = participant
  end

  def add_participant(name, cost)
    @participant[name] = cost
  end

end
