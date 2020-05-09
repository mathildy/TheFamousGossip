class GossipController < ApplicationController
  before_action :authenticate_user, only: [:create, :show, :new]
  before_action :authenticate_user_edit, only: [:edit, :update]


  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])

  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: current_user.id) 

    if @gossip.save 
      puts "Tu as réussi ! "
      redirect_to root_path
    else
      puts "Cela ne fontionne pas"
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
      puts "Impossible"
    end
  end

end
