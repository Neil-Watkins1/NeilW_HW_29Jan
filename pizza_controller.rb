require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative('./models/pizza_order')
also_reload(',/models/*')

# index
get '/pizza_orders' do
@orders = PizzaOrder.all()
  erb( :index )
end


# new
get '/pizza_orders/new' do
  erb( :new )
end

# show
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb( :show )
end


# create
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb (:create)
end


# edit
get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb ( :edit )
end
# like new (needs a form for editing)

# update
# like create (will then send edit info to DB)
post "/pizza_orders/:id" do
  order = PizzaOrder.new(params)
  order.update
  redirect'pizza_orders'
end

# delete
post '/pizza_orders/:id/delete' do
order = PizzaOrder.find(params[:id])
order.delete()
redirect'/pizza_orders'

end
#
#
# end
