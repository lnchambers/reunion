require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_reunion_exists
    reunion = Reunion.new("Winter Park")

    assert_instance_of Reunion, reunion
  end

  def test_reunion_has_a_location
    reunion = Reunion.new("Winter Park")

    assert_equal "Winter Park", reunion.location
  end

  def test_reunion_can_haz_activities
    reunion = Reunion.new("Winter Park")

    reunion.add_activity(Activity.new("Horseshoeing"))

    assert_equal "Horseshoeing", reunion.activities[0].activity
  end

  def test_reunion_can_haz_total_cost
    reunion = Reunion.new("Winter Park")
    activity = Activity.new("hiking")
    activity2 = Activity.new("biking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 15)
    activity.add_participant("Richie", 15)
    activity.add_participant("RIRIRI", 15)
    reunion.add_activity(activity)

    assert_equal 60, reunion.total_cost

    activity2.add_participant("Richard", 15)
    activity2.add_participant("Rich", 15)
    activity2.add_participant("Richie", 15)
    activity2.add_participant("RIRIRI", 15)
    reunion.add_activity(activity2)

    assert_equal 120, reunion.total_cost
  end

  
end
