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

    assert_equal 15, activity.participants["Richard"]
    assert_equal ["Richard"], activity.participants.keys
  end

  def test_activity_total_cost
    activity = Activity.new("hiking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 15)
    activity.add_participant("Richie", 15)
    activity.add_participant("RIRIRI", 15)

    assert_equal 60, activity.total_cost
  end

  def test_activity_average_cost
    activity = Activity.new("hiking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 16)
    activity.add_participant("Richie", 17)
    activity.add_participant("RIRIRI", 18)
    activity.add_participant("Richardo", 19)

    assert_equal 17, activity.average_cost
  end

  def test_activity_splits_cost
    activity = Activity.new("hiking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 16)
    activity.add_participant("Richie", 17)
    activity.add_participant("RIRIRI", 18)
    activity.add_participant("Richardo", 19)

    assert_equal 2, activity.split_cost["Richard"]
    assert_equal -2, activity.split_cost["Richardo"]
  end

end
