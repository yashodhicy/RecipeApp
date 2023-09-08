require 'rails_helper'

RSpec.describe Recipe, type: :model do
  @author = User.new(name: 'Nasir')

  subject do
    Recipe.new(user: @user,
               name: 'Pasta',
               description: 'Delicious pasta',
               preparation_time: 30,
               cooking_time: 50)
  end

  before { subject.save }

  it 'should have an user' do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid preparation time' do
    subject.preparation_time = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid cooking time' do
    subject.cooking_time = nil
    expect(subject).not_to be_valid
  end
end