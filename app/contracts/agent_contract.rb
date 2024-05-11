class AgentContract < Dry::Validation::Contract
  params do
    required(:agent).schema do
      required(:symbol).filled(:string)
      required(:faction).filled(:string)
    end
  end
end
