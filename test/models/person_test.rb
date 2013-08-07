require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "uploading an avatar" do
    person = Person.create!
    person.avatar = Tempfile.new(['original-avatar', '.jpg'])
    person.save!

    assert_match /original-avatar/, person.avatar_url
    assert_match /original-avatar/, person.avatar.url
  end
end
