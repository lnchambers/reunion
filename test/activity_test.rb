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
end
