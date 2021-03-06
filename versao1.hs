type Contato = ([Char], Integer, [Char], [Char])

contatoToString :: Contato -> IO()
contatoToString (nome, telefone, endereco, relacao) = do
  putStrLn("Nome: "++nome)
  putStrLn("Telefone: "++show(telefone))
  putStrLn("Endereco: "++endereco)
  putStrLn("Relacao: "++relacao)

contatoSetNome :: Contato -> [Char] -> Contato
contatoSetNome (nome, telefone, endereco, relacao) n = (n, telefone, endereco, relacao)

contatoSetTelefone :: Contato -> Integer -> Contato
contatoSetTelefone (nome, telefone, endereco, relacao) t = (nome, t, endereco, relacao)

contatoSetEndereco :: Contato -> [Char] -> Contato
contatoSetEndereco (nome, telefone, endereco, relacao) e = (nome, telefone, e, relacao)

contatoSetRelacao :: Contato -> [Char] -> Contato
contatoSetRelacao (nome, telefone, endereco, relacao) r = (nome, telefone, endereco, r)

contatoGetNome :: Contato -> [Char]
contatoGetNome (nome, telefone, endereco, relacao) = nome

contatoGetTelefone :: Contato -> Integer
contatoGetTelefone (nome, telefone, endereco, relacao) = telefone

contatoGetEndereco :: Contato -> [Char]
contatoGetEndereco (nome, telefone, endereco, relacao) = endereco

contatoGetRelacao :: Contato -> [Char]
contatoGetRelacao (nome, telefone, endereco, relacao) = relacao

type Agenda = [Contato]

agendaToString :: Agenda -> IO()
agendaToString [] = pure()
agendaToString agenda = do
  contatoToString (head agenda)
  putStrLn("")
  agendaToString (tail agenda)

agendaInsere :: Agenda -> Contato -> Agenda
agendaInsere [] contato = [contato]
agendaInsere (h:t) contato
  |(contatoGetNome h == contatoGetNome contato) = contato : t
  |otherwise = h : agendaInsere t contato

agendaAltera :: Agenda -> Contato -> Agenda
agendaAltera [] contato = []
agendaAltera (h:t) contato
  |(contatoGetNome h == contatoGetNome contato) = contato : t
  |otherwise = h : agendaAltera t contato

agendaRemove :: Agenda -> [Char] -> Agenda
agendaRemove [] nome = []
agendaRemove (h:t) nome
  |(contatoGetNome h == nome) = t
  |otherwise = h : agendaRemove t nome

agendaBusca :: Agenda -> [Char] -> IO()
agendaBusca [] nome = putStrLn "Nao Encontrado"
agendaBusca (h:t) nome
  |(contatoGetNome h == nome) = contatoToString h
  |otherwise = agendaBusca t nome

a1 :: Agenda
a1 = [("Neri", 22992532957, "Macae", "Eu"),
     ("Lucas", 21996875014, "Marica", "Amigo"),
     ("Bazilio", 22111111111, "Rio das Ostras", "Professor de LP")]

main :: IO()
main = do
  let a2 = agendaInsere a1 ("Sergio", 22333333333, "Rio das Ostras", "Professor de prog" )
  agendaBusca a2 "Bazilio"
