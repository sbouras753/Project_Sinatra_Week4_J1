require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  post '/gossips/new/' do

  Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save 
  #puts "Salut, je suis dans le serveur"
  #puts "Ceci est mon super params : ""#{params}" 
  #puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  #puts "De la bombe, et du coup ça ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  #puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"

  redirect '/'
  end

  get '/gossips/:id' do 
    erb :show, locals: {gossip: Gossip.find(params["id"]), id: params["id"]}
  end

  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params["id"]}
  end

  post '/gossips/:id/edit' do

  Gossip.edit(params["id"], params["gossip_new_author"], params["gossip_new_content"])
  redirect '/'
  end

end
