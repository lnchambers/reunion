require 'pry'

class Activity

  attr_reader :activity,
              :participant

  def initialize(activity, participant = {})
    @activity = activity
    @participant = participant
  end

end
