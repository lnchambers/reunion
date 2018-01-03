require 'pry'

class Activity

  attr_reader :activity,
              :participants

  def initialize(activity)
    @activity = activity
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def even_cost
    @participants.values.sum / participants.keys.length
  end

  def split_cost

  end

end
