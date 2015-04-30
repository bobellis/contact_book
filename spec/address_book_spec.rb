require('rspec')
require('contact')
require('pry')

describe(Contact) do
  before do
    Contact.clear()
  end

  describe('.clear') do
    it('will clear array of all contacts') do
      Contact.new("Erin", "Collins", "September").save()
      Contact.clear
      expect(Contact.all).to(eq([]))
    end
  end

  describe('.all') do
    it('will return all contacts in the array of contacts') do
      test_contact = Contact.new("Erin", "Collins", "September").save()
      expect(Contact.all).to(eq(test_contact))
    end
    it('will be empty at first') do
      expect(Contact.all).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a contact into the array of contacts') do
      test_contact = Contact.new("Erin", "Collins", "September").save()
      expect(Contact.all).to(eq(test_contact))
    end
  end

end
