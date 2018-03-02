require 'bundler/setup'
require 'pry'

Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb:index
end

post('/add_store') do
  new_store = Store.create({:name => params['new_store_name'], :location => params['new_store_location']})
  erb:index
end

post('/add_shoe') do
  new_shoe = Shoe.create({:name => params['new_shoe_name'], :price => params['new_shoe_price']}) #, :brand => params['new_shoe_brand']
  erb:index
end

#store pages
  get('/store/:id') do
    @store = Store.find(params['id'].to_i)
    erb:store
  end

  post('/store/:id/add_shoe') do
    @store = Store.find(params['id'].to_i)
    new_shoe = Shoe.find(params['new_shoe'].to_i)
    @store.shoes.push(new_shoe)
    erb:store
  end

  patch('/store/:id/edit_store') do
    redirect to '/store/:id'
  end

  delete('/store/:id/remove_store') do
    remove_store = Store.find(params['id'].to_i)
    remove_store.destroy
    redirect to '/'
  end


#shoe pages
  get('/shoe/:id') do
    @shoe = Shoe.find(params['id'].to_i)
    erb:shoe
  end

  post('/shoe/:id/add_store') do
    @shoe = Shoe.find(params['id'].to_i)
    new_store = Store.find(params['new_store'].to_i)
    @shoe.stores.push(new_store)
    erb:shoe
  end

  patch('/shoe/:id/edit_shoe') do
    redirect to '/shoe/:id'
  end
