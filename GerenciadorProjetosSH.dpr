program GerenciadorProjetosSH;

{$R *.dres}

uses
  Vcl.Forms,
  GerenciadorProjetos in 'GerenciadorProjetos.pas' {FRMPrincipal},
  UAnotacoes in 'UAnotacoes.pas' {FRMAnotacoes},
  UTarefas in 'UTarefas.pas' {FRMTarefas},
  UUtils in 'UUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  CriarTabelas();

  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  FRMPrincipal.FDConnection1.Params.Database := './banco.sqlite';


  Application.CreateForm(TFRMAnotacoes, FRMAnotacoes);
  Application.CreateForm(TFRMTarefas, FRMTarefas);
  Application.Run;
end.
