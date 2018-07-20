# frozen_string_literal: true

require_relative '../../lib/calculator/evaluator'

RSpec.describe Calculator::Evaluator do
  describe '#eval' do
    subject { described_class.new.eval(str) }

    context 'with empty string' do
      let(:str) { '' }

      it { is_expected.to eq '' }
    end

    context 'with only space or tab' do
      let(:str) { "   \t   \t  \t" }

      it { is_expected.to eq '' }
    end

    context 'with random garbage' do
      let(:str) { '/ ** 4 3 + ...lsdjfka' }

      it { is_expected.to eq nil }
    end

    context 'with simple expression 1' do
      let(:str) { '4 * 3 - 1' }

      it { is_expected.to eq 11 }
    end

    context 'with simple expression 2' do
      let(:str) { '5 * 7 + 2 / 3' }

      it { is_expected.to eq 35.666666666666664 }
    end

    context 'with complex expression 1' do
      let(:str) { '-3 * -4 + 5 / --+- 4 % 53' }

      it { is_expected.to eq 63.75 }
    end

    context 'with complex expression 2' do
      let(:str) { '78 / 3.75 * 8' }

      it { is_expected.to eq 166.4 }
    end
  end
end

