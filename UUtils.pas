unit UUtils;

interface

procedure CriarTabelas();

implementation

uses GerenciadorProjetos, DB, FireDAC.Comp.Client, SysUtils;

procedure CriarTabelas();
var
  databaseName: string;
  conn: TFDConnection;
  qry: TFDQuery;
begin

  databaseName := './banco.sqlite';

  if (not FileExists(databaseName)) then
  begin

    FileClose(FileCreate(databaseName));
  end;

  conn := TFDConnection.Create(nil);
  conn.DriverName := 'SQLite';
  conn.Params.Database := databaseName;

  qry := TFDQuery.Create(nil);
  qry.Connection := conn;

  qry.SQL.Clear;
  qry.SQL.Add('CREATE TABLE  IF NOT EXISTS PROJETOS ');
  qry.SQL.Add
    ('(ID_REGISTRO INTEGER PRIMARY KEY AUTOINCREMENT, TIPO INTEGER, STATUS STRING (20), ');
  qry.SQL.Add
    (' CLIENTE INTEGER REFERENCES CLIENTES (ID_CLIENTE), NUM_ORCAMENTO STRING (50), ');
  qry.SQL.Add
    ('QTDE_HORAS INTEGER, VALOR_HORA FLOAT, VALOR_TOTAL FLOAT, DATA_ORCAMENTO DATE, ');
  qry.SQL.Add
    ('DATA_VALIDADE DATE, TITULO_PROJETO STRING (200), DATA_ENTREGA DATE, PEDIDO_CLIENTE STRING (50))');
  qry.ExecSQL();

  qry.SQL.Clear();
  qry.SQL.Add('CREATE TABLE IF NOT EXISTS TAREFAS_PROJETO');
  qry.SQL.Add
    (' (ID_TAREFA INTEGER PRIMARY KEY AUTOINCREMENT, ID_PROJETO INTEGER REFERENCES PROJETOS (ID_REGISTRO),');
  qry.SQL.Add(' DESCRICAO STRING, CONCLUIDO INTEGER)');
  qry.ExecSQL();

  qry.SQL.Clear();
  qry.SQL.Add('CREATE TABLE IF NOT EXISTS ANOTACOES_PROJETO ');
  qry.SQL.Add
    ('(ID_ANOTACAO INTEGER PRIMARY KEY AUTOINCREMENT, ID_PROJETO INTEGER REFERENCES PROJETOS (ID_REGISTRO),');
  qry.SQL.Add(' DESCRICAO STRING, HORA_REGISTRO DATETIME)');
  qry.ExecSQL();

  qry.SQL.Clear;
  qry.SQL.Add('CREATE TABLE  IF NOT EXISTS CLIENTES ');
  qry.SQL.Add
    ('(ID_CLIENTE INTEGER PRIMARY KEY AUTOINCREMENT, NOME_CLIENTE STRING, CONTATO1 STRING, ');
  qry.SQL.Add('CONTATO2 STRING, OBSERVACOES STRING)');
  qry.ExecSQL();

end;

end.
