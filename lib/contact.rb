class Contact
  @@contacts = []

  attr_reader(:first_name, :last_name, :birthday_month)

  define_method(:initialize) do |first_name, last_name, birthday_month|
    @first_name = first_name
    @last_name = last_name
    @birthday_month = birthday_month
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:all) do
    @@contacts
  end

end
