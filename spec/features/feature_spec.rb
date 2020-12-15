# feature "testing set up" do
#   scenario "homepage is successfully set up" do
#     visit('/')
#     expect(page).to have_content('success')
#   end
# end

feature "adding diary entry" do
  scenario "user can add diary entry" do
    visit '/'
    expect(page).to have_content('Add an entry')
  end
end
