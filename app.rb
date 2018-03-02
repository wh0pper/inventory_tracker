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
    quantity = params['send_quantity']
    @store.shoes.push(new_shoe)
    new_shoe.inventories.where({:store_id => @store.id}).update({:inventory => quantity})
    erb:store
  end

  patch('/store/:id/edit_store') do
    @store = Store.find(params['id'].to_i)
    @store.update({:name => params['update_name'], :location => params['update_location']})
    erb:store
  end

  delete('/store/:id/remove_store') do
    remove_store = Store.find(params['id'].to_i)
    remove_store.inventories.destroy_all
    remove_store.destroy
    redirect to '/'
  end


#shoe pages
  get('/shoe/:id') do
    @shoe = Shoe.find(params['id'].to_i)
    @formatted_price = @shoe.formatted_price
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

  delete('/shoe/:id/remove_shoe') do
    remove_shoe = Shoe.find(params['id'].to_i)
    remove_shoe.inventories.destroy_all
    remove_shoe.destroy
    redirect to '/'
  end
