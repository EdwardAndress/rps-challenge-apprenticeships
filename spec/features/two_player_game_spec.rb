feature 'two player game' do
  scenario 'player one chooses rock, player two chooses paper' do
    visit '/'
    fill_in :player_one_name, with: 'Engelbert'
    fill_in :player_two_name, with: 'June'
    click_on 'Play!'
    expect(page).to have_content 'Choose your weapon, Engelbert'
    click_on 'Rock'
    expect(page).to have_content 'Choose your weapon, June'
    click_on 'Paper'
    expect(page).to have_content 'You win, June!'
  end
end