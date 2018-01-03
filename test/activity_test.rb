require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_exists
    activity = Activity.new("hiking")

    assert_instance_of Activity, activity
  end

  def test_activity_has_activities
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.activity
  end

  def test_activity_can_haz_participants
    activity = Activity.new("hiking")

    activity.add_participant("Richard", 15)

    assert_equal 15, activity.participant["Richard"]
    assert_equal ["Richard"], activity.participant.keys
  end

  def test_activity_total_cost
    activity = Activity.new("hiking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 15)
    activity.add_participant("Richie", 15)
    activity.add_participant("RIRIRI", 15)

    assert_equal 60, activity.total_cost
  end
end
