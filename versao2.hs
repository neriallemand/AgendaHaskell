data Contato = Contato{nome :: [Char], telefone :: Integer, endereco :: [Char], relacao :: [Char]}

contatoToString :: Contato -> [Char]
contatoToString c = nome c++" "++show(telefone c)++" "++endereco c++" "++relacao c

type Agenda = [Contato]

agendaToString :: Agenda -> [Char]
agendaToString [] = ""
agendaToString a = contatoToString (head a)++", "++agendaToString (tail a)

agendaInsere :: Agenda -> Contato -> Agenda
agendaInsere [] c = [c]
agendaInsere (h:t) c
  |(nome h == nome c) = c : t
  |otherwise = h : agendaInsere t c

agendaRemove :: Agenda -> [Char] -> Agenda
agendaRemove [] n = []
agendaRemove (h:t) n
  |(nome h == n) = t
  |otherwise = h : agendaRemove t n

agendaBusca :: Agenda -> [Char] -> Contato
agendaBusca [] n = Contato "" 0 "" ""
agendaBusca (h:t) n
  |(nome h == n) = h
  |otherwise = agendaBusca t n

a1 :: Agenda
a1 = [Contato "Neri" 11111111111 "Macae" "Eu",
     Contato "Lucas" 22222222222 "Maje" "Amigo",
     Contato "Bazilio" 33333333333 "Rio das Ostras" "Professor de LP"]

main :: IO()
main = do
  print(agendaToString a1)
  let a2 = agendaInsere a1 (Contato "Sergio" 33333333333 "Rio das Ostras" "Professor de prog")
  print(agendaToString a2)
  let a3 = agendaInsere a2 (Contato "Neri" 11111111111 "Niteroi" "Alterado")
  print(agendaToString a3)
  let a4 = agendaRemove a2 "Lucas"
  print(agendaToString a4)
  print(contatoToString (agendaBusca a4 "Bazilio"))
