class AgentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @agent = Agent.new
  end

  def index
    @agents = Agent.all
  end

  def show
    @agent = Agent.find_by!(symbol: params[:symbol].upcase)
  end

  def create
    agent_service = AgentService.new
    contract = AgentContract.new
    validation_result = contract.call(params.permit!.to_h)
    if validation_result.success?
      symbol, faction = validation_result[:agent].values_at(:symbol, :faction)
      agent = agent_service.create_agent(symbol, faction)
      render json: agent, status: 200
    else
      render json: validation_result.errors.to_hash, status: :unprocessable_entity
    end
  end

  private
  def agent_params
    params.require(:agent).permit(:faction, :symbol)
  end
end
