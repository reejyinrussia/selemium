require 'rails_helper'

feature 'Bank Accounts New', js: true do
  login_js
  before(:each) do
    FactoryGirl.create(:bank_account, user: @user)
    visit new_bank_account_path

  end

  scenario 'correct header content' do
    expect(page).to have_content('New Bank Account For: = current_user.email')
  end

  scenario 'is the institution text field present' do
    expect(page).to have_content('Institution')
  end

  scenario 'is the institution text placeholder present' do
    find_field('Chase').value

  end

  scenario 'is the Description text placeholder present' do
    find_field('Your Description').value

  end

  # # scenario 'is the amount text placeholder present' do
  # #   expect(page).to have_field("#bank_account_amount",
  # #    :type => "number", :name => "bank_account[amount]", :value => "0.0")
  #   end

  scenario 'is the active check box present' do
    check('Active')
  end

  scenario 'Find the create bank account button' do
    find_button('Create Bank account').click
  end

  scenario 'link to return to index' do
    expect(page).to have_selector('#bank-accounts')
  end
end
