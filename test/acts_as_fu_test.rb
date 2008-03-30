require 'test/unit'

class ActsAsFuTest < Test::Unit::TestCase
  def test_this_plugin
    fu = true
    assert fu
    puts "Fu! All tests passed with flying colors!"
  end
end
