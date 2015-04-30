class Phone
  @@phone_details = []

  attr_reader(:area_code, :number, :type)

  define_method(:initialize) do |area_code, number, type|
    @area_code = area_code
    @number = number
    @type = type
  end

  define_method(:save) do
    @@phone_details.push(self)
  end

  define_singleton_method(:all) do
    @@phone_details
  end

  define_singleton_method(:clear) do
    @@phone_details = []
  end

end
