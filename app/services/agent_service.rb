class AgentService

  CREATE_ENDPOINT = "https://api.spacetraders.io/v2/register"
  private_constant :CREATE_ENDPOINT

  def create_agent(symbol, faction)
    body = { symbol: symbol, faction: faction }

    conn = Faraday.new(url: CREATE_ENDPOINT) do |faraday|
      faraday.request :json
      faraday.response :json
    end

    res = conn.post(CREATE_ENDPOINT, body)

    if res.status != 201
      puts res.body
      return nil
    end

    agent_info = res.body["data"]["agent"]
    token = res.body["data"]["token"]

    agent = Agent.new
    agent.symbol = agent_info["symbol"]
    agent.token = token
    agent.faction = agent_info["startingFaction"]
    agent.account_id = agent_info["accountId"]
    agent.headquarters = agent_info["headquarters"]
    agent.credits = agent_info["credits"]

    agent.save!
  end
end
