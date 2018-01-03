require 'pry'

class Activity

  attr_reader :activity,
              :participants,
              :owed

  def initialize(activity)
    @activity     = activity
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def average_cost
    @participants.values.sum / participants.keys.length
  end

  def split_cost
    @participants.reduce({}) do |result, participant|
      if participant[1] > average_cost
        puts "#{participant[0]} is owed #{participant[1] - average_cost}"
        result[participant[0]] = (average_cost - participant[1])
      elsif participant[1] < average_cost
        puts "#{participant[0]} owes #{average_cost - participant[1]}"
        result[participant[0]] = (average_cost - participant[1])
      else
        puts "#{participant[0]} owes nothing and nothing is owed."
        result[participant[0]] = (average_cost - participant[1])
      end
      result
    end
  end

end
