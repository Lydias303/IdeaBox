ENV["RACK_ENV"] = "test"
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'

require_relative '../lib/idea_box/idea'


class IdeaTest
include Rack::Test::Methods

  def app
    Idea.new
  end

  def test_it_has_an_idea_resource
    get '/details'
    assert_equal 200, resource.status
    assert last_response.ok?
  end

end
