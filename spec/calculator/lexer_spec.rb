# frozen_string_literal: true

require 'rspec'

require_relative '../../lib/calculator/lexer'

RSpec.describe Calculator::Lexer do
  subject { described_class.new.lex(str) }

  describe '#lex' do
    context 'with int' do
      let(:str) { '15' }

      it { is_expected.to eq [[:int, '15']] }
    end

    context 'with int included _' do
      let(:str) { '1_000' }

      it { is_expected.to eq [[:int, '1_000']] }
    end

    context 'with float start with digit' do
      let(:str) { '12.54' }

      it { is_expected.to eq [[:float, '12.54']] }
    end

    context 'with float start with .' do
      let(:str) { '.75' }

      it { is_expected.to eq [[:float, '.75']] }
    end

    context 'with float start with digit include _' do
      let(:str) { '123_324.544_232_234' }

      it { is_expected.to eq [[:float, '123_324.544_232_234']] }
    end

    context 'with float start with . include _' do
      let(:str) { '.752_234_234' }

      it { is_expected.to eq [[:float, '.752_234_234']] }
    end

    context 'with operator "+"' do
      let(:str) { '+' }

      it { is_expected.to eq [[:op, '+']] }
    end

    context 'with operator "-"' do
      let(:str) { '-' }

      it { is_expected.to eq [[:op, '-']] }
    end

    context 'with operator "*"' do
      let(:str) { '*' }

      it { is_expected.to eq [[:op, '*']] }
    end

    context 'with operator "/"' do
      let(:str) { '/' }

      it { is_expected.to eq [[:op, '/']] }
    end

    context 'with operator "%"' do
      let(:str) { '%' }

      it { is_expected.to eq [[:op, '%']] }
    end

    context 'with space' do
      let(:str) { ' ' }

      it { is_expected.to eq [[:sp, ' ']] }
    end

    context 'with equation 1' do
      let(:str) { '1 + 1' }

      it { is_expected.to eq [[:int, '1'], [:sp, ' '], [:op, '+'], [:sp, ' '], [:int, '1']] }
    end

    context 'with equation 1' do
      let(:str) { '30_000_000*.25' }

      it { is_expected.to eq [[:int, '30_000_000'], [:op, '*'], [:float, '.25']] }
    end

    context 'with equation 1' do
      let(:str) { '1 + 1' }

      it { is_expected.to eq [[:int, '1'], [:sp, ' '], [:op, '+'], [:sp, ' '], [:int, '1']] }
    end

    # Below is not supported

    context 'with lowercase character a' do
      let(:str) { 'a' }

      it { is_expected.to eq [[:id, 'a']] }
    end

    context 'with lowercase character b' do
      let(:str) { 'b' }

      it { is_expected.to eq [[:id, 'b']] }
    end

    context 'with lowercase character c' do
      let(:str) { 'c' }

      it { is_expected.to eq [[:id, 'c']] }
    end

    context 'with lowercase character d' do
      let(:str) { 'd' }

      it { is_expected.to eq [[:id, 'd']] }
    end

    context 'with lowercase character e' do
      let(:str) { 'e' }

      it { is_expected.to eq [[:id, 'e']] }
    end

    context 'with lowercase character f' do
      let(:str) { 'f' }

      it { is_expected.to eq [[:id, 'f']] }
    end

    context 'with lowercase character g' do
      let(:str) { 'g' }

      it { is_expected.to eq [[:id, 'g']] }
    end

    context 'with lowercase character h' do
      let(:str) { 'h' }

      it { is_expected.to eq [[:id, 'h']] }
    end

    context 'with lowercase character i' do
      let(:str) { 'i' }

      it { is_expected.to eq [[:id, 'i']] }
    end

    context 'with lowercase character j' do
      let(:str) { 'j' }

      it { is_expected.to eq [[:id, 'j']] }
    end

    context 'with lowercase character k' do
      let(:str) { 'k' }

      it { is_expected.to eq [[:id, 'k']] }
    end

    context 'with lowercase character l' do
      let(:str) { 'l' }

      it { is_expected.to eq [[:id, 'l']] }
    end

    context 'with lowercase character m' do
      let(:str) { 'm' }

      it { is_expected.to eq [[:id, 'm']] }
    end

    context 'with lowercase character n' do
      let(:str) { 'n' }

      it { is_expected.to eq [[:id, 'n']] }
    end

    context 'with lowercase character o' do
      let(:str) { 'o' }

      it { is_expected.to eq [[:id, 'o']] }
    end

    context 'with lowercase character p' do
      let(:str) { 'p' }

      it { is_expected.to eq [[:id, 'p']] }
    end

    context 'with lowercase character q' do
      let(:str) { 'q' }

      it { is_expected.to eq [[:id, 'q']] }
    end

    context 'with lowercase character r' do
      let(:str) { 'r' }

      it { is_expected.to eq [[:id, 'r']] }
    end

    context 'with lowercase character s' do
      let(:str) { 's' }

      it { is_expected.to eq [[:id, 's']] }
    end

    context 'with lowercase character t' do
      let(:str) { 't' }

      it { is_expected.to eq [[:id, 't']] }
    end

    context 'with lowercase character u' do
      let(:str) { 'u' }

      it { is_expected.to eq [[:id, 'u']] }
    end

    context 'with lowercase character v' do
      let(:str) { 'v' }

      it { is_expected.to eq [[:id, 'v']] }
    end

    context 'with lowercase character w' do
      let(:str) { 'w' }

      it { is_expected.to eq [[:id, 'w']] }
    end

    context 'with lowercase character x' do
      let(:str) { 'x' }

      it { is_expected.to eq [[:id, 'x']] }
    end

    context 'with lowercase character y' do
      let(:str) { 'y' }

      it { is_expected.to eq [[:id, 'y']] }
    end

    context 'with lowercase character z' do
      let(:str) { 'z' }

      it { is_expected.to eq [[:id, 'z']] }
    end

    context 'with uppercase character A' do
      let(:str) { 'A' }

      it { is_expected.to eq [[:const, 'A']] }
    end

    context 'with uppercase character B' do
      let(:str) { 'B' }

      it { is_expected.to eq [[:const, 'B']] }
    end

    context 'with uppercase character C' do
      let(:str) { 'C' }

      it { is_expected.to eq [[:const, 'C']] }
    end

    context 'with uppercase character D' do
      let(:str) { 'D' }

      it { is_expected.to eq [[:const, 'D']] }
    end

    context 'with uppercase character E' do
      let(:str) { 'E' }

      it { is_expected.to eq [[:const, 'E']] }
    end

    context 'with uppercase character F' do
      let(:str) { 'F' }

      it { is_expected.to eq [[:const, 'F']] }
    end

    context 'with uppercase character G' do
      let(:str) { 'G' }

      it { is_expected.to eq [[:const, 'G']] }
    end

    context 'with uppercase character H' do
      let(:str) { 'H' }

      it { is_expected.to eq [[:const, 'H']] }
    end

    context 'with uppercase character I' do
      let(:str) { 'I' }

      it { is_expected.to eq [[:const, 'I']] }
    end

    context 'with uppercase character J' do
      let(:str) { 'J' }

      it { is_expected.to eq [[:const, 'J']] }
    end

    context 'with uppercase character K' do
      let(:str) { 'K' }

      it { is_expected.to eq [[:const, 'K']] }
    end

    context 'with uppercase character L' do
      let(:str) { 'L' }

      it { is_expected.to eq [[:const, 'L']] }
    end

    context 'with uppercase character M' do
      let(:str) { 'M' }

      it { is_expected.to eq [[:const, 'M']] }
    end

    context 'with uppercase character N' do
      let(:str) { 'N' }

      it { is_expected.to eq [[:const, 'N']] }
    end

    context 'with uppercase character O' do
      let(:str) { 'O' }

      it { is_expected.to eq [[:const, 'O']] }
    end

    context 'with uppercase character P' do
      let(:str) { 'P' }

      it { is_expected.to eq [[:const, 'P']] }
    end

    context 'with uppercase character Q' do
      let(:str) { 'Q' }

      it { is_expected.to eq [[:const, 'Q']] }
    end

    context 'with uppercase character R' do
      let(:str) { 'R' }

      it { is_expected.to eq [[:const, 'R']] }
    end

    context 'with uppercase character S' do
      let(:str) { 'S' }

      it { is_expected.to eq [[:const, 'S']] }
    end

    context 'with uppercase character T' do
      let(:str) { 'T' }

      it { is_expected.to eq [[:const, 'T']] }
    end

    context 'with uppercase character U' do
      let(:str) { 'U' }

      it { is_expected.to eq [[:const, 'U']] }
    end

    context 'with uppercase character V' do
      let(:str) { 'V' }

      it { is_expected.to eq [[:const, 'V']] }
    end

    context 'with uppercase character W' do
      let(:str) { 'W' }

      it { is_expected.to eq [[:const, 'W']] }
    end

    context 'with uppercase character X' do
      let(:str) { 'X' }

      it { is_expected.to eq [[:const, 'X']] }
    end

    context 'with uppercase character Y' do
      let(:str) { 'Y' }

      it { is_expected.to eq [[:const, 'Y']] }
    end

    context 'with uppercase character Z' do
      let(:str) { 'Z' }

      it { is_expected.to eq [[:const, 'Z']] }
    end

    context 'with not supported operator `' do
      let(:str) { '`' }

      it { is_expected.to eq [[:error, '`']] }
    end

    context 'with not supported operator ~' do
      let(:str) { '~' }

      it { is_expected.to eq [[:error, '~']] }
    end

    context 'with not supported operator !' do
      let(:str) { '!' }

      it { is_expected.to eq [[:error, '!']] }
    end

    context 'with not supported operator @' do
      let(:str) { '@' }

      it { is_expected.to eq [[:error, '@']] }
    end

    context 'with not supported operator #' do
      let(:str) { '#' }

      it { is_expected.to eq [[:error, '#']] }
    end

    context 'with not supported operator $' do
      let(:str) { '$' }

      it { is_expected.to eq [[:error, '$']] }
    end

    context 'with not supported operator ^' do
      let(:str) { '^' }

      it { is_expected.to eq [[:error, '^']] }
    end

    context 'with not supported operator &' do
      let(:str) { '&' }

      it { is_expected.to eq [[:error, '&']] }
    end

    context 'with not supported operator (' do
      let(:str) { '(' }

      it { is_expected.to eq [[:error, '(']] }
    end

    context 'with not supported operator )' do
      let(:str) { ')' }

      it { is_expected.to eq [[:error, ')']] }
    end

    context 'with not supported operator _' do
      let(:str) { '_' }

      it { is_expected.to eq [[:error, '_']] }
    end

    context 'with not supported operator =' do
      let(:str) { '=' }

      it { is_expected.to eq [[:error, '=']] }
    end

    context 'with not supported operator {' do
      let(:str) { '{' }

      it { is_expected.to eq [[:error, '{']] }
    end

    context 'with not supported operator }' do
      let(:str) { '}' }

      it { is_expected.to eq [[:error, '}']] }
    end

    context 'with not supported operator [' do
      let(:str) { '[' }

      it { is_expected.to eq [[:error, '[']] }
    end

    context 'with not supported operator ]' do
      let(:str) { ']' }

      it { is_expected.to eq [[:error, ']']] }
    end

    context 'with not supported operator |' do
      let(:str) { '|' }

      it { is_expected.to eq [[:error, '|']] }
    end

    context 'with not supported operator |' do
      let(:str) { '\\' }

      it { is_expected.to eq [[:error, '\\']] }
    end

    context 'with not supported operator :' do
      let(:str) { ':' }

      it { is_expected.to eq [[:error, ':']] }
    end

    context 'with not supported operator ;' do
      let(:str) { ';' }

      it { is_expected.to eq [[:error, ';']] }
    end

    context 'with not supported operator "' do
      let(:str) { '"' }

      it { is_expected.to eq [[:error, '"']] }
    end

    context 'with not supported operator \'' do
      let(:str) { '\'' }

      it { is_expected.to eq [[:error, '\'']] }
    end

    context 'with not supported operator <' do
      let(:str) { '<' }

      it { is_expected.to eq [[:error, '<']] }
    end

    context 'with not supported operator ,' do
      let(:str) { ',' }

      it { is_expected.to eq [[:error, ',']] }
    end

    context 'with not supported operator >' do
      let(:str) { '>' }

      it { is_expected.to eq [[:error, '>']] }
    end

    context 'with not supported operator .' do
      let(:str) { '.' }

      it { is_expected.to eq [[:error, '.']] }
    end

    context 'with not supported operator ?' do
      let(:str) { '?' }

      it { is_expected.to eq [[:error, '?']] }
    end
  end
end

