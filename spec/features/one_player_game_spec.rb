feature 'one player game' do
  scenario 'player chooses rock, computer choose scissors' do
    srand(3)
    visit '/'
    fill_in :player_one_name, with: 'Engelbert'
    click_on 'Play!'
    expect(page).to have_content 'Choose your weapon, Engelbert'
    click_on 'Rock'
    expect(page).to have_content 'You win, Engelbert!'
  end
end