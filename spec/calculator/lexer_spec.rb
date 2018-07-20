# frozen_string_literal: true

require 'rspec'

require_relative '../../lib/calculator/lexer'

RSpec.describe Calculator::Lexer do
  subject(:lexer) { described_class.new }

  describe '#lex' do
    context 'with int' do
      it 'returns :int and "15"' do
        expect(lexer.lex('15')).to eq [[:int, '15']]
      end
    end

    context 'with float' do
      it 'returns :float and "12.54"' do
        expect(lexer.lex('12.54')).to eq [[:float, '12.54']]
      end
    end

    context 'with operator supported' do
      it 'returns :op and +' do
        expect(lexer.lex('+')).to eq [[:op, '+']]
      end
    end

    context 'with operator "-"' do
      it 'returns :op and -' do
        expect(lexer.lex('-')).to eq [[:op, '-']]
      end
    end

    context 'with operator "*"' do
      it 'returns :op and *' do
        expect(lexer.lex('*')).to eq [[:op, '*']]
      end
    end

    context 'with operator "/"' do
      it 'returns :op and /' do
        expect(lexer.lex('/')).to eq [[:op, '/']]
      end
    end

    context 'with operator "%"' do
      it 'returns :op and %' do
        expect(lexer.lex('%')).to eq [[:op, '%']]
      end
    end

    context 'with space' do
      it 'returns :sp and "sp"' do
        expect(lexer.lex(' ')).to eq [[:sp, ' ']]
      end
    end

    context 'with lowercase character a' do
      it 'raises syntaxerror' do
        expect(lexer.lex('a')).to eq [[:id, 'a']]
      end
    end

    context 'with lowercase character b' do
      it 'raises syntaxerror' do
        expect(lexer.lex('b')).to eq [[:id, 'b']]
      end
    end

    context 'with lowercase character c' do
      it 'raises syntaxerror' do
        expect(lexer.lex('c')).to eq [[:id, 'c']]
      end
    end

    context 'with lowercase character d' do
      it 'raises syntaxerror' do
        expect(lexer.lex('d')).to eq [[:id, 'd']]
      end
    end

    context 'with lowercase character e' do
      it 'raises syntaxerror' do
        expect(lexer.lex('e')).to eq [[:id, 'e']]
      end
    end

    context 'with lowercase character f' do
      it 'raises syntaxerror' do
        expect(lexer.lex('f')).to eq [[:id, 'f']]
      end
    end

    context 'with lowercase character g' do
      it 'raises syntaxerror' do
        expect(lexer.lex('g')).to eq [[:id, 'g']]
      end
    end

    context 'with lowercase character h' do
      it 'raises syntaxerror' do
        expect(lexer.lex('h')).to eq [[:id, 'h']]
      end
    end

    context 'with lowercase character i' do
      it 'raises syntaxerror' do
        expect(lexer.lex('i')).to eq [[:id, 'i']]
      end
    end

    context 'with lowercase character j' do
      it 'raises syntaxerror' do
        expect(lexer.lex('j')).to eq [[:id, 'j']]
      end
    end

    context 'with lowercase character k' do
      it 'raises syntaxerror' do
        expect(lexer.lex('k')).to eq [[:id, 'k']]
      end
    end

    context 'with lowercase character l' do
      it 'raises syntaxerror' do
        expect(lexer.lex('l')).to eq [[:id, 'l']]
      end
    end

    context 'with lowercase character m' do
      it 'raises syntaxerror' do
        expect(lexer.lex('m')).to eq [[:id, 'm']]
      end
    end

    context 'with lowercase character n' do
      it 'raises syntaxerror' do
        expect(lexer.lex('n')).to eq [[:id, 'n']]
      end
    end

    context 'with lowercase character o' do
      it 'raises syntaxerror' do
        expect(lexer.lex('o')).to eq [[:id, 'o']]
      end
    end

    context 'with lowercase character p' do
      it 'raises syntaxerror' do
        expect(lexer.lex('p')).to eq [[:id, 'p']]
      end
    end

    context 'with lowercase character q' do
      it 'raises syntaxerror' do
        expect(lexer.lex('q')).to eq [[:id, 'q']]
      end
    end

    context 'with lowercase character r' do
      it 'raises syntaxerror' do
        expect(lexer.lex('r')).to eq [[:id, 'r']]
      end
    end

    context 'with lowercase character s' do
      it 'raises syntaxerror' do
        expect(lexer.lex('s')).to eq [[:id, 's']]
      end
    end

    context 'with lowercase character t' do
      it 'raises syntaxerror' do
        expect(lexer.lex('t')).to eq [[:id, 't']]
      end
    end

    context 'with lowercase character u' do
      it 'raises syntaxerror' do
        expect(lexer.lex('u')).to eq [[:id, 'u']]
      end
    end

    context 'with lowercase character v' do
      it 'returns :id and "v"' do
        expect(lexer.lex('v')).to eq [[:id, 'v']]
      end
    end

    context 'with lowercase character w' do
      it 'returns :id and "w"' do
        expect(lexer.lex('w')).to eq [[:id, 'w']]
      end
    end

    context 'with lowercase character x' do
      it 'returns :id and "x"' do
        expect(lexer.lex('x')).to eq [[:id, 'x']]
      end
    end

    context 'with lowercase character y' do
      it 'returns :id and "y"' do
        expect(lexer.lex('y')).to eq [[:id, 'y']]
      end
    end

    context 'with lowercase character z' do
      it 'returns :id and "z"' do
        expect(lexer.lex('z')).to eq [[:id, 'z']]
      end
    end

    context 'with uppercase character A' do
      it 'returns :const and "A"' do
        expect(lexer.lex('A')).to eq [[:const, 'A']]
      end
    end

    context 'with uppercase character B' do
      it 'returns :const and "B"' do
        expect(lexer.lex('B')).to eq [[:const, 'B']]
      end
    end

    context 'with uppercase character C' do
      it 'returns :const and "C"' do
        expect(lexer.lex('C')).to eq [[:const, 'C']]
      end
    end

    context 'with uppercase character D' do
      it 'returns :const and "D"' do
        expect(lexer.lex('D')).to eq [[:const, 'D']]
      end
    end

    context 'with uppercase character E' do
      it 'returns :const and "E"' do
        expect(lexer.lex('E')).to eq [[:const, 'E']]
      end
    end

    context 'with uppercase character F' do
      it 'returns :const and "F"' do
        expect(lexer.lex('F')).to eq [[:const, 'F']]
      end
    end

    context 'with uppercase character G' do
      it 'returns :const and "G"' do
        expect(lexer.lex('G')).to eq [[:const, 'G']]
      end
    end

    context 'with uppercase character H' do
      it 'returns :const and "H"' do
        expect(lexer.lex('H')).to eq [[:const, 'H']]
      end
    end

    context 'with uppercase character I' do
      it 'returns :const and "I"' do
        expect(lexer.lex('I')).to eq [[:const, 'I']]
      end
    end

    context 'with uppercase character J' do
      it 'returns :const and "J"' do
        expect(lexer.lex('J')).to eq [[:const, 'J']]
      end
    end

    context 'with uppercase character K' do
      it 'returns :const and "K"' do
        expect(lexer.lex('K')).to eq [[:const, 'K']]
      end
    end

    context 'with uppercase character L' do
      it 'returns :const and "L"' do
        expect(lexer.lex('L')).to eq [[:const, 'L']]
      end
    end

    context 'with uppercase character M' do
      it 'returns :const and "M"' do
        expect(lexer.lex('M')).to eq [[:const, 'M']]
      end
    end

    context 'with uppercase character N' do
      it 'returns :const and "N"' do
        expect(lexer.lex('N')).to eq [[:const, 'N']]
      end
    end

    context 'with uppercase character O' do
      it 'returns :const and "O"' do
        expect(lexer.lex('O')).to eq [[:const, 'O']]
      end
    end

    context 'with uppercase character P' do
      it 'returns :const and "P"' do
        expect(lexer.lex('P')).to eq [[:const, 'P']]
      end
    end

    context 'with uppercase character Q' do
      it 'returns :const and "Q"' do
        expect(lexer.lex('Q')).to eq [[:const, 'Q']]
      end
    end

    context 'with uppercase character R' do
      it 'returns :const and "R"' do
        expect(lexer.lex('R')).to eq [[:const, 'R']]
      end
    end

    context 'with uppercase character S' do
      it 'returns :const and "S"' do
        expect(lexer.lex('S')).to eq [[:const, 'S']]
      end
    end

    context 'with uppercase character T' do
      it 'returns :const and "T"' do
        expect(lexer.lex('T')).to eq [[:const, 'T']]
      end
    end

    context 'with uppercase character U' do
      it 'returns :const and "U"' do
        expect(lexer.lex('U')).to eq [[:const, 'U']]
      end
    end

    context 'with uppercase character V' do
      it 'returns :const and "V"' do
        expect(lexer.lex('V')).to eq [[:const, 'V']]
      end
    end

    context 'with uppercase character W' do
      it 'returns :const and "W"' do
        expect(lexer.lex('W')).to eq [[:const, 'W']]
      end
    end

    context 'with uppercase character X' do
      it 'returns :const and "X"' do
        expect(lexer.lex('X')).to eq [[:const, 'X']]
      end
    end

    context 'with uppercase character Y' do
      it 'returns :const and "Y"' do
        expect(lexer.lex('Y')).to eq [[:const, 'Y']]
      end
    end

    context 'with uppercase character Z' do
      it 'returns :const and "Z"' do
        expect(lexer.lex('Z')).to eq [[:const, 'Z']]
      end
    end

    context 'with not supported operator `' do
      it 'returns :error and "`"' do
        expect(lexer.lex('`')).to eq [[:error, '`']]
      end
    end

    context 'with not supported operator ~' do
      it 'returns :error and "~"' do
        expect(lexer.lex('~')).to eq [[:error, '~']]
      end
    end

    context 'with not supported operator !' do
      it 'returns :error and "!"' do
        expect(lexer.lex('!')).to eq [[:error, '!']]
      end
    end

    context 'with not supported operator @' do
      it 'returns :error and "@"' do
        expect(lexer.lex('@')).to eq [[:error, '@']]
      end
    end

    context 'with not supported operator #' do
      it 'returns :error and "#"' do
        expect(lexer.lex('#')).to eq [[:error, '#']]
      end
    end

    context 'with not supported operator $' do
      it 'returns :error and "$"' do
        expect(lexer.lex('$')).to eq [[:error, '$']]
      end
    end

    context 'with not supported operator ^' do
      it 'returns :error and "^"' do
        expect(lexer.lex('^')).to eq [[:error, '^']]
      end
    end

    context 'with not supported operator &' do
      it 'returns :error and "&"' do
        expect(lexer.lex('&')).to eq [[:error, '&']]
      end
    end

    context 'with not supported operator (' do
      it 'returns :error an "("' do
        expect(lexer.lex('(')).to eq [[:error, '(']]
      end
    end

    context 'with not supported operator )' do
      it 'returns :error an ")"' do
        expect(lexer.lex(')')).to eq [[:error, ')']]
      end
    end

    context 'with not supported operator _' do
      it 'returns :error and "_"' do
        expect(lexer.lex('_')).to eq [[:error, '_']]
      end
    end

    context 'with not supported operator =' do
      it 'returns :error and "="' do
        expect(lexer.lex('=')).to eq [[:error, '=']]
      end
    end

    context 'with not supported operator {' do
      it 'returns :error and "{"' do
        expect(lexer.lex('{')).to eq [[:error, '{']]
      end
    end

    context 'with not supported operator }' do
      it 'returns :error and "}"' do
        expect(lexer.lex('}')).to eq [[:error, '}']]
      end
    end

    context 'with not supported operator [' do
      it 'returns :error and "["' do
        expect(lexer.lex('[')).to eq [[:error, '[']]
      end
    end

    context 'with not supported operator ]' do
      it 'returns :error and "]"' do
        expect(lexer.lex(']')).to eq [[:error, ']']]
      end
    end

    context 'with not supported operator |' do
      it 'returns :error and "|"' do
        expect(lexer.lex('|')).to eq [[:error, '|']]
      end
    end

    context 'with not supported operator |' do
      it 'returns :error and "\"' do
        expect(lexer.lex('\\')).to eq [[:error, '\\']]
      end
    end

    context 'with not supported operator  :' do
      it 'returns :error and ":"' do
        expect(lexer.lex(':')).to eq [[:error, ':']]
      end
    end

    context 'with not supported operator ;' do
      it 'returns :error and ";"' do
        expect(lexer.lex(';')).to eq [[:error, ';']]
      end
    end

    context 'with not supported operator "' do
      it 'returns :error and """' do
        expect(lexer.lex('"')).to eq [[:error, '"']]
      end
    end

    context 'with not supported operator \'' do
      it 'returns :error and "\"' do
        expect(lexer.lex('\'')).to eq [[:error, '\'']]
      end
    end

    context 'with not supported operator <' do
      it 'returns :error and "<"' do
        expect(lexer.lex('<')).to eq [[:error, '<']]
      end
    end

    context 'with not supported operator ,' do
      it 'returns :error and ","' do
        expect(lexer.lex(',')).to eq [[:error, ',']]
      end
    end

    context 'with not supported operator >' do
      it 'returns :error and ">"' do
        expect(lexer.lex('>')).to eq [[:error, '>']]
      end
    end

    context 'with not supported operator .' do
      it 'returns :error and "."' do
        expect(lexer.lex('.')).to eq [[:error, '.']]
      end
    end

    context 'with not supported operator ?' do
      it 'returns :error and "?"' do
        expect(lexer.lex('?')).to eq [[:error, '?']]
      end
    end
  end
end

