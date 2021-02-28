class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, only:[:id, :name, :species]
    render json: birds, except:[:created_at, :updated_at]
    #writing it out the long way (only & except keywords are params of the to_json method, obscured by Rails magic):
    #render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end

end