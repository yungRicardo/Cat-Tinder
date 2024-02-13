require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'is not valid without a name' do
    cat = Cat.new(age: 2, enjoys: 'Sleeping', image: 'image_url')
    expect(cat).to_not be_valid
  end

  it 'is not valid without an age' do
    cat = Cat.new(name: 'Whiskers', enjoys: 'Sleeping', image: 'image_url')
    expect(cat).to_not be_valid
  end

  it 'is not valid without enjoys' do
    cat = Cat.new(name: 'Whiskers', age: 2, image: 'image_url')
    expect(cat).to_not be_valid
  end

  it 'is not valid if enjoys is less than 10 characters' do
    cat = Cat.new(name: 'Whiskers', age: 2, enjoys: 'Sleeping', image: 'image_url')
    expect(cat).to_not be_valid
  end

  it 'is not valid without an image' do
    cat = Cat.new(name: 'Whiskers', age: 2, enjoys: 'Sleeping')
    expect(cat).to_not be_valid
  end
end

end