# feature "testing set up" do
#   scenario "homepage is successfully set up" do
#     visit('/')
#     expect(page).to have_content('success')
#   end
# end

feature "adding diary entry" do
  scenario "user can add diary entry" do
    visit '/'
    fill_in 'title', with:'today'
    fill_in 'entry', with:'I was happy'
    click_button('Add')
    expect(page).to have_content('today')
    expect(page).to have_content('I was happy')
  end

  scenario "user can see all titles" do
    visit '/'
    fill_in 'title', with:'today'
    fill_in 'entry', with:'I was happy'
    click_button('Add')
end
