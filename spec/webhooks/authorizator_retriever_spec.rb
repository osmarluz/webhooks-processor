# frozen_string_literal: true

describe Webhooks::AuthorizatorRetriever do
  context 'when integration exists' do
    it 'returns a success result' do
      result = described_class.new(integration: :stripe).call

      expect(result).to be_success
    end

    it 'returns the authorizator' do
      result = described_class.new(integration: :stripe).call

      expect(result.value!).to eq(Webhooks::Authorizators::Stripe)
    end
  end

  context 'when integration does not exist' do
    it 'returns a failure result' do
      result = described_class.new(integration: :whatever).call

      expect(result).to be_failure
    end
  end
end
