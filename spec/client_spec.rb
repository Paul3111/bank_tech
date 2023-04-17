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

  it 'Creates a client with lowercase first name and returns correct output.' do
    client1 = Client.new('paul', 'Lazar')
    expect(client1.view_client).to eq 'Paul Lazar'
  end

  it 'Creates a client with lowercase last name and returns correct output.' do
    client1 = Client.new('Paul', 'lazar')
    expect(client1.view_client).to eq 'Paul Lazar'
  end

  it 'Creates a client with lowercase first & last name and returns correct output.' do
    client1 = Client.new('paul', 'lazar')
    expect(client1.view_client).to eq 'Paul Lazar'
  end

  it 'Fails if the first name contains letters.' do
    expect{ Client.new('Paul2', 'Lazar') }.to raise_error 'Names can only contain letters'
  end

  it 'Fails if the last name contains letters.' do
    expect{ Client.new('Paul', 'Lazar3') }.to raise_error 'Names can only contain letters'
  end

  it 'Fails if the first and last name contain letters.' do
    expect{ Client.new('Paul2', 'Laza3r') }.to raise_error 'Names can only contain letters'
  end
end