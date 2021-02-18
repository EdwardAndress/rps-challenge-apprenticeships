require 'sinatra/base'
require_relative './lib/game.rb'
class RockPaperScissors < Sinatra::Base

  enable :sessions

  get '/test' do
    'test page'
  end

  get '/' do
    erb :sign_in
  end

  post '/sign_in' do
    player_one_name = params[:player_one_name]
    player_two_name = params[:player_two_name]
    session[:game] = Game.new(players: [player_one_name, player_two_name])
    redirect '/weapons'
  end
  
  get '/weapons' do
    game = session[:game]
    @current_player = game.current_player
    erb :weapons
  end

  post '/weapons' do
    game = session[:game]
    game.player_weapon = params[:weapon]
    if game.pending_weapon_choice?
      redirect '/weapons'
    else
      redirect '/outcome'
    end
  end

  get '/outcome' do
    game = session[:game]
    game.player_weapon = session[:weapon]
    @outcome = session[:game].outcome
    erb :outcome
  end

  run! if app_file == $0
end
