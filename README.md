Projeto App Minhas Financas
Aplicativo simples criado em ViewCode, utilizando arquitetura MVC.
Banco de Dados Cloud Firestore e Login pelo Firebase Authentication.
O aplicativo funciona com varios usuarios cadastrados e eles ficam independentes, ou seja cada usuario tem seu relatorio de gastos.
Foi utilizado o UILongPressGestureRecognizer para quando selecionar por alguns segundos um registro na TableView ele abrir uma alerta se quer excluir
o mesmo.
Utilizado Structs, Protocols, Delegates e foi utilizado o UserDefaults para gravar o ID do usuario que e retornado pelo Firebase, para assim quando o
usuario se logar novamente ele poder fazer um "select" no banco de dados para poder trazer o Total Gasto referente ao usuario correto e tambem para
trazer os registros corretos daquele usuario na TableView.
