class GossipsController < ApplicationController
	def index
		@gossips = Gossip.all
	end

	def new
		@gossip = Gossip.new
 	end

 	def create
 		@gossip = current_user.gossips.build(gossip_params)
		@gossip.save
		redirect_to @gossip
 	end

 	private
	
	def gossip_params
		params.require(:gossip).permit(:user_id, :content)
	end

 	def show
 		@gossip = Gossip.find(params[:id])
 	end

 	def update
      @gossip = Gossip.find(params[:id])
      @gossip.update(gossip_params)
      redirect_to @gossip
    end

    def destroy
      Gossip.find(params[:id]).destroy
      redirect_to gossips_path
    end
end
