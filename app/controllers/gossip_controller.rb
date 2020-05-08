class GossipController < ApplicationController
  before_action :authenticate_user, only: [:create, :show, :new]
  before_action :authenticate_user_edit, only: [:edit, :update]


  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])

  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id) 

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      puts "Tu as réussi"
      redirect_to root_path
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      puts "ca ne fontionne pas"
      render new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_user = @gossip.user

    if @gossip.update(gossip_params)
      redirect_to root_path
    else
      render edit_gossip_path
    end
  end

  
  def destroy
    @gossip = Gossip.find(params[:id])
    gossip_user = @gossip.user

    if current_user == gossip_user
      @gossip.destroy
      redirect_to root_path
    else
      puts "pas possible"
    end
  end

end
