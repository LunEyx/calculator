# frozen_string_literal: true

require_relative '../../lib/calculator/parser'

RSpec.describe Calculator::Parser do
  describe '#sexp' do
    subject { described_class.new.sexp(str) }

    context 'with integer' do
      let(:str) { '15' }

      it { is_expected.to eq [:int, 15] }
    end

    context 'with negative number' do
      let(:str) { '-500' }

      it { is_expected.to eq [:unary, :-@, [:int, 500]] }
    end

    context 'with integer included _' do
      let(:str) { '1_000' }

      it { is_expected.to eq [:int, 1_000] }
    end

    context 'with float start with digit' do
      let(:str) { '12.54' }

      it { is_expected.to eq [:float, 12.54] }
    end

    context 'with float start with .' do
      let(:str) { '.75' }

      it { is_expected.to eq [:float, 0.75] }
    end

    context 'with float start with digit include _' do
      let(:str) { '123_324.544_232_234' }

      it { is_expected.to eq [:float, 123_324.544_232_234] }
    end

    context 'with float start with . include _' do
      let(:str) { '.752_234_234' }

      it { is_expected.to eq [:float, 0.752_234_234] }
    end

    context 'with simple expression' do
      let(:str) { '5 *7 + 4 / -2' }

      it do
        is_expected.to eq [:binary, :+,
                           [:binary, :*, [:int, 5], [:int, 7]],
                           [:binary, :/, [:int, 4], [:unary, :-@, [:int, 2]]]]
      end
    end

    context 'with complex expression' do
      let(:str) { '-3 * -4 + 5 / -- +- 4 % 53' }

      it do
        is_expected.to eq(
          [:binary, :+, [:binary, :*, [:unary, :-@, [:int, 3]], [:unary, :-@, [:int, 4]]],
           [:binary, :%, [:binary, :/, [:int, 5],
                          [:unary, :-@, [:unary, :-@, [:unary, :+@, [:unary, :-@, [:int, 4]]]]]], [:int, 53]]]
        )
      end
    end

    context 'with two number only' do
      let(:str) { ' 1 1 ' }

      it { is_expected.to eq nil }
    end

    context 'with two binary operator together' do
      let(:str) { ' 1 / /1 ' }

      it { is_expected.to eq nil }
    end

    context 'with empty string' do
      let(:str) { '' }

      it { is_expected.to eq [] }
    end

    context 'with only space or tab' do
      let(:str) { "   \t   \t  \t" }

      it { is_expected.to eq [] }
    end

    context 'with random garbage' do
      let(:str) { '/ ** 4 3 + ...lsdjfka' }

      it { is_expected.to eq nil }
    end
  end

  describe '#parse' do
    subject { described_class.new.parse(str) }

    context 'with integer' do
      let(:str) { '15' }

      it { is_expected.to eq [[:int, 15]] }
    end

    context 'with negative number' do
      let(:str) { '-500' }

      it { is_expected.to eq [[:int, 500], [:unary, :-@]] }
    end

    context 'with integer included _' do
      let(:str) { '1_000' }

      it { is_expected.to eq [[:int, 1_000]] }
    end

    context 'with float start with digit' do
      let(:str) { '12.54' }

      it { is_expected.to eq [[:float, 12.54]] }
    end

    context 'with float start with .' do
      let(:str) { '.75' }

      it { is_expected.to eq [[:float, 0.75]] }
    end

    context 'with float start with digit include _' do
      let(:str) { '123_324.544_232_234' }

      it { is_expected.to eq [[:float, 123_324.544_232_234]] }
    end

    context 'with float start with . include _' do
      let(:str) { '.752_234_234' }

      it { is_expected.to eq [[:float, 0.752_234_234]] }
    end

    context 'with simple expression' do
      let(:str) { '5 *7 + 4 / -2' }

      it do
        is_expected.to eq [[:int, 5], [:int, 7], [:binary, :*],
                           [:int, 4], [:int, 2], [:unary, :-@], [:binary, :/], [:binary, :+]]
      end
    end

    context 'with complex expression' do
      let(:str) { '-3 * -4 + 5 / -- +- 4 % 53' }

      it do
        is_expected.to eq [[:int, 3], [:unary, :-@], [:int, 4], [:unary, :-@], [:binary, :*],
                           [:int, 5], [:int, 4], [:unary, :-@], [:unary, :+@], [:unary, :-@],
                           [:unary, :-@], [:binary, :/], [:int, 53], [:binary, :%], [:binary, :+]]
      end
    end

    context 'with two number only' do
      let(:str) { ' 1 1 ' }

      it { is_expected.to eq nil }
    end

    context 'with two binary operator together' do
      let(:str) { ' 1 / /1 ' }

      it { is_expected.to eq nil }
    end

    context 'with empty string' do
      let(:str) { '' }

      it { is_expected.to eq [] }
    end

    context 'with only space or tab' do
      let(:str) { "   \t   \t  \t" }

      it { is_expected.to eq [] }
    end

    context 'with random garbage' do
      let(:str) { '/ ** 4 3 + ...lsdjfka' }

      it { is_expected.to eq nil }
    end
  end
end

