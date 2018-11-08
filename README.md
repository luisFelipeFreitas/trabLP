# trabLP

## instrucoes para executar o programa

entre em racket-lang.org

clique em download no canto superior direito

baixe a versao apropriada do racket(NAO USE O MINIMAL) para seu sistema operacional(supomos um mac 64bits)

instale o dmg baixado.

execute no terminal raco pkg install "https://github.com/petrolifero/racket-peg.git"

abra o drracket. Abra a main.rkt no drracket(menu file, opcao open)

aperte o botao run, no canto superior direito do drracket.

execute o comando (evaluate (parser "prog pdl desejado sem espacos ou parentesis") "NoInicial")
ex:(evaluate (parser "a;b") "A")

para alterar o grafo altere a variavel test-graph para 
(define test-graph (graph-struct (list (edge (node "A") (node "B") "a") (edge (node "A") (node "A") "c")
                                       (edge (node "C") (node "B") "c") (edge (node "B") (node "C") "c")
                                       (edge (node "C") (node "A") "b"))))
substituindo na estrutura na estrutura node os nomes das vertices e o caracter externo para mudar a label da aresta

a estrutura de edge e (edge (node "noOrigem") (node "noDestino) "labelDaAresta")

remova ou inclua da maneira desejada

##NOTAS:
Caso não consiga instalar o pacote, desinstale o pacote de PEG que está utilizando e utilize o comando Raco novamente.

Caso queira utilizar um outro grafo de teste já pronto utilize o comando (evaluate (parser "programa") "mundoOrigem" test-graph-b)
ou (evaluate (parser "programa") "mundoOrigem" test-graph-c)

ex:(evaluate (parser "b;a") "B" test-graph-b)

