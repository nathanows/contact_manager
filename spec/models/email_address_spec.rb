require 'rails_helper'

RSpec.describe EmailAddress, :type => :model do
  let(:person) { Person.create(first_name: 'John', last_name: 'Elway') }
  let(:email_address) { EmailAddress.new(address: 'nowsiany@gmail.com', contact_id: person.id, contact_type: 'Person') }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'is invalid without an email address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end

  it 'is invalid without a contact_id' do
    email_address.contact_id = nil
    expect(email_address).to_not be_valid
  end

  it 'is associated with a contact' do
    expect(email_address).to respond_to(:contact)
  end
end
