require 'rails_helper'

feature 'User creates todo' do
  scenario 'Successfully' do
    visit new_todo_path
  end
end
