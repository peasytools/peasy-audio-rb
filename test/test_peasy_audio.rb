# frozen_string_literal: true

require "minitest/autorun"
require "peasy_audio"

class TestPeasyAudio < Minitest::Test
  def test_version
    refute_nil PeasyAudio::VERSION
    assert_equal "0.1.1", PeasyAudio::VERSION
  end
end
