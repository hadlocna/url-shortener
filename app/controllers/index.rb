get '/' do
 erb :index
end

post '/urls' do
  short_url = (0...8).map{ ('a'..'z').to_a[rand(26)] }.join
  @url = Url.new(main_url: params[:main_url], short_url: short_url)
  if @url.validate?
    @url.save
    erb :short_landing
  else
    erb :warning
  end

end

get '/:short_url' do
 url = Url.find_by_short_url(params[:short_url])
 url.upcount
 redirect url.main_url
end