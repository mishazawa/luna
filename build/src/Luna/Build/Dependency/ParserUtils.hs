module Luna.Build.Dependency.ParserUtils where

import Prologue

import qualified Text.Read as Read

import Text.Megaparsec      (Parsec, ParseError)
import Text.Megaparsec.Char (space, string, char, digitChar)

------------------------------
-- === Parser Utilities === --
------------------------------

-- === Definition === --

type Parser = Parsec () Text
type Error  = ParseError Char ()


-- === API === ---

spaces :: Parser ()
spaces = void space

and :: Parser ()
and = spaces *> string "&&" *> spaces

dot :: Parser Char
dot = char '.'

natural :: Parser Word64
natural = Read.read <$> some digitChar

