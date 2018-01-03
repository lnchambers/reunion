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

  def test_reunion_splits_cost
    reunion = Reunion.new("Winter Park")
    activity = Activity.new("hiking")
    activity2 = Activity.new("biking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 16)
    activity.add_participant("Richie", 17)
    activity.add_participant("RIRIRI", 18)
    activity.add_participant("Richardo", 19)
    activity2.add_participant("Adam", 20)
    activity2.add_participant("Rich Richie", 21)
    activity2.add_participant("Richie Rich", 22)
    activity2.add_participant("RIRIRIRI", 23)
    activity2.add_participant("Richardo Montoya", 24)
    activity2.add_participant("Inigo", 25)
    reunion.add_activity(activity)
    reunion.add_activity(activity2)

    assert_equal 5, reunion.split_cost["Richard"]
    assert_equal -5, reunion.split_cost["Inigo"]
  end

  def test_reunion_adds_total_participants
    reunion = Reunion.new("Winter Park")
    activity = Activity.new("hiking")
    activity2 = Activity.new("biking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 16)
    activity.add_participant("Richie", 17)
    activity.add_participant("RIRIRI", 18)
    activity.add_participant("Richardo", 19)
    activity2.add_participant("Adam", 20)
    activity2.add_participant("Rich Richie", 21)
    activity2.add_participant("Richie Rich", 22)
    activity2.add_participant("RIRIRIRI", 23)
    activity2.add_participant("Richardo Montoya", 24)
    activity2.add_participant("Inigo", 25)
    reunion.add_activity(activity)
    reunion.add_activity(activity2)

    assert_equal 11, reunion.total_participants
  end

  def test_reunion_returns_the_average_cost
    reunion = Reunion.new("Winter Park")
    activity = Activity.new("hiking")
    activity2 = Activity.new("biking")

    activity.add_participant("Richard", 15)
    activity.add_participant("Rich", 16)
    activity.add_participant("Richie", 17)
    activity.add_participant("RIRIRI", 18)
    activity.add_participant("Richardo", 19)
    activity2.add_participant("Adam", 20)
    activity2.add_participant("Rich Richie", 21)
    activity2.add_participant("Richie Rich", 22)
    activity2.add_participant("RIRIRIRI", 23)
    activity2.add_participant("Richardo Montoya", 24)
    activity2.add_participant("Inigo", 25)
    reunion.add_activity(activity)
    reunion.add_activity(activity2)

    assert_equal 20, reunion.average_cost
  end
end
