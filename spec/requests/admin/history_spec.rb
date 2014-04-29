require 'spec_helper'

describe "History", js: true do
  let! :admin do
    sign_in_as_admin
  end

  before do
    StandardTree.build_minimal
    visit new_admin_page_path(parent_id: Page.home.id)
    fill_in 'Name', with: 'Foo Bar'
    click_on 'Create Page'
    click_on 'advanced options'
  end

  it "records the author on creation" do
    page.should have_content "Created by #{admin.name}"
  end

  it "records an edit event on update" do
    fill_in 'Page Name', with: 'Foo Bar Baz'
    click_on 'Save changes'

    page.should have_content "Edited by #{admin.name}"
  end
end
