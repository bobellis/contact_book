require('./lib/contact')
require('./lib/phone')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @contacts = Contact.all
  erb(:index)
end

get('/reset') do
  Contact.clear()
  erb(:index)
end

get('/add_contact') do
  erb(:add_contact)
end

post('/save_person') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  birthday_month = params.fetch('birthday_month')
  Contact.new(first_name, last_name, birthday_month).save()
  @contacts = Contact.all
  erb(:index)
end

get('/contact/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  @numbers = @contact.get_numbers()
  erb(:contact)
end

post('/save_number') do
  area_code = (params.fetch('area_code')).to_i()
  number = (params.fetch('number')).to_i()
  type = params.fetch('type')
  phone_number = Phone.new(area_code, number, type)
  @contact = Contact.find((params.fetch("specific_contact_id")).to_i())
  @contact.add_number(phone_number)
  @numbers = @contact.get_numbers()
  erb(:contact)
end
