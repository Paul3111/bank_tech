require './lib/client'

RSpec.describe Client do
  it 'Creates a client.' do
    client1 = Client.new('Paul', 'Lazar')
    expect(client1.view_client).to eq 'Paul Lazar'
  end
end