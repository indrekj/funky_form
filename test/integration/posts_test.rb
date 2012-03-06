require "test_helper"

class PostsTest < ActiveSupport::IntegrationCase
  def test_creating_a_post
    visit new_post_path

    within "#new_post" do
      fill_in "Title", :with => "Fruits"
      fill_in "Body", :with => "Apples and oranges"
      click_button "Create"
    end

    assert page.has_content?("Successfully created")
  end

  def test_creating_a_post_when_validation_errors
    visit new_post_path

    within "#new_post" do
      fill_in "Title", :with => "a" * 40
      fill_in "Body", :with => "Short"
      click_button "Create"
    end

    assert page.has_content?("Validation errors")
  end

  def test_editing_existing_post_title
    post = Post.create(:title => "Fruits", :body => "Apples and oranges")

    visit edit_post_path(post)

    within "#edit_post_#{post.id}" do
      assert "Fruits", page.find("#post_title").value
      fill_in "Title", :with => "My Fruits"

      click_button "Update"
    end

    assert page.has_content?("Successfully updated")
  end

  def test_editing_existing_post_title_when_validation_errors
    post = Post.create(:title => "Fruits", :body => "Apples and oranges")

    visit edit_post_path(post)

    invalid_title = "a" * 40

    within "#edit_post_#{post.id}" do
      assert "Fruits", page.find("#post_title").value
      fill_in "Title", :with => invalid_title

      click_button "Update"
    end

    assert page.has_content?("Validation errors")
    assert invalid_title, page.find("#post_title").value
  end
end
