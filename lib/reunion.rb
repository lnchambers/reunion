require 'pry'
require './lib/activity'

class Reunion

  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
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

  def even_cost
    total_cost / total_participants
  end

  def split_cost

  end

end
