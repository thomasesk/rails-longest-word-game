require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Submitting a word" do
    visit new_url
    fill_in 'score', with: 'Jimejzfnzefmy'
    click_button 'Play'
  end
end

class GamesTest2 < ApplicationSystemTestCase
  test "new value" do
    visit new_url
    fill_in 'score', with: 'Jimejzfnzefmy'
    click_button 'Play'
    assert_selector "p"
  end
end
