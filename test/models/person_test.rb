require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "uploading an avatar" do
    person = Person.create!(name: 'Chris')
    person.avatar = Tempfile.new(['original-avatar', '.jpg'])
    person.save!

    assert_match /original-avatar/, person.avatar_url
    assert_match /original-avatar/, person.avatar.url

    assert_match /thumb_original-avatar/, person.avatar_url(:thumb)
    assert_match /thumb_original-avatar/, person.avatar.url(:thumb)
  end

  test "replacing an avatar" do
    person = Person.create!(avatar: Tempfile.new(['original-avatar', '.jpg']))

    person.avatar = Tempfile.new(['new-avatar', '.jpg'])

    assert_match /new-avatar/, person.avatar_url
    assert_match /new-avatar/, person.avatar.url

    assert_match /thumb_new-avatar/, person.avatar_url(:thumb)
    assert_match /thumb_new-avatar/, person.avatar.url(:thumb)

    assert_match /original-avatar/, person.avatar_was.url
    assert_match /thumb_original-avatar/, person.avatar_was.url(:thumb)
  end
end
