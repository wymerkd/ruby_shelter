class Customer
  attr_accessor :name, :phone, :type_pref, :breed_pref
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phone = attributes.fetch(:phone)
    @type_pref = attributes.fetch(:type_pref)
    @breed_pref = attributes.fetch(:breed_pref)
  end

  def self.get_customers(db_query)
    returned_customers = DB.exec(db_query)
    customers = []
    returned_customers.each() do |customer|
      name = customer.fetch('name')
      id = customer.fetch('id').to_i
      phone = customer.fetch('phone').to_i
      type_pref = customer.fetch('type_pref')
      breed_pref = customer.fetch('breed_pref')
      customers.push(Customer.new({
        :name => name,
        :id => id,
        :phone => phone,
        :type_pref => type_pref,
        :breed_pref => breed_pref
      }))
    end
    customers
  end
  
  def self.all
    self.get_customers("SELECT * FROM customers;")
  end

  def save
    result = DB.exec("
      INSERT INTO customers (name, phone, type_pref, breed_pref)
      VALUES ('#{@name}',#{@phone}, '#{@type_pref}', '#{@breed_pref}')
      RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def ==(customer_to_compare)
    self.name() == customer_to_compare.name() && self.id() == customer_to_compare.id()
  end

end
