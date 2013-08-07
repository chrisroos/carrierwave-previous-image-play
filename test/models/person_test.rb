require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "without a name should be invalid" do
    person = Person.new(name: nil)
    refute person.valid?
    assert person.errors[:name].any?
  end

  test "uploading an avatar" do
    person = Person.create!(name: 'Chris')
    person.avatar = Tempfile.new(['original-avatar', '.jpg'])
    person.save!

    assert_match /original-avatar/, person.avatar_url
    assert_match /original-avatar/, person.avatar.url
  end
end
