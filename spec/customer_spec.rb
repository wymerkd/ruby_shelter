require('spec_helper')

describe('#Customer') do
  describe('.all') do
    it("returns an empty array when there are no customers") do
      expect(Customer.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a customer") do
      cust = Customer.new({
        :name => "Bob",
        :id => nil,
        :phone => 5555555555,
        :type_pref => 'dog',
        :breed_pref => 'mutt'
      })
      cust.save()
      cust2 = Customer.new({
        :name => "Sally",
        :id => nil,
        :phone => 5555555555,
        :type_pref => 'cat',
        :breed_pref => 'mix'
      })
      cust2.save()
      expect(Customer.all).to(eq([cust, cust2]))
    end
  end
  
end
