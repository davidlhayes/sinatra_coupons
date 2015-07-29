class CouponsController < ApplicationController

  ## list (read) all of the coupons
  get '/' do

    @coupons = Coupons.all
    erb :coupons_index

  end

  ## create coupons
  get '/create' do
    erb :coupons_create
  end

  ## update (edit) coupons
  post '/create' do
    @coupon = Coupons.new
    @coupon.title = params[:title] #bind to <input name='title'>
    @coupon.product = params[:product] #bind to <imput name='product'>
    @coupon.discount = params[:discount]
    @coupon.expiration_date = params[:expiration_date]
    @coupon.save

    erb :coupons_create_success
  end

  ## update (edit) coupons
  get '/edit/:id' do
    @id = params[:id]
    @coupon = Coupons.find(@id)

    erb :coupons_edit
  end

  post '/edit' do
    @coupon = Coupons.find(params[:id])
    @coupon.title = params[:title]
    @coupon.product = params[:product]
    @coupon.discount = params[:discount]
    @coupon.expiration_date = params[:expiration_date]
    @coupon.save

    erb :coupons_edit_success
  end

  ## delete (destroy) coupons
  post '/delete' do
    @id = params[:id]
    @coupon = Coupons.find(@id)
    @coupon.destroy

    erb :coupons_delete_success
  end

end
