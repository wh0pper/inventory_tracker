require("bundler/setup")
require("pry")

Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb:index
end

post('/add_shoe') do
  erb:index
end

post('/add_store') do
  erb:index
end

#store pages
  get('/store/:id') do
    erb:store
  end

  post('/store/:id/add_shoe') do
    erb:store
  end

  patch('/store/:id/edit_store') do
    redirect to '/store/:id'
  end


#shoe pages
  get('/shoe/:id') do
    erb:shoe
  end

  post('/shoe/:id/add_store') do
    erb:shoe
  end

  patch('/shoe/:id/edit_shoe') do
    redirect to '/shoe/:id'
  end
