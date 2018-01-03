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
end
