require './lib/client'

RSpec.describe Client do
  it 'Creates a client.' do
    client1 = Client.new('Paul', 'Lazar')
    expect(client1.view_client).to eq 'Paul Lazar'
  end

  it 'Creates a client with empty space as last name and returns error.' do
    expect{ Client.new('Paul', '') }.to raise_error 'First and last name are mandatory'
  end

  it 'Creates a client with empty space as first name and returns error.' do
    expect{ Client.new('', 'Lazar') }.to raise_error 'First and last name are mandatory'
  end

  it 'Creates a client with empty space as first and last name and returns error.' do
    expect{ Client.new('', '') }.to raise_error 'First and last name are mandatory'
  end
end