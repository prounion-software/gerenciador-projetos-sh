program GerenciadorProjetosSH;

{$R *.dres}

uses
  Vcl.Forms,
  GerenciadorProjetos in 'GerenciadorProjetos.pas' {FRMPrincipal},
  UAnotacoes in 'UAnotacoes.pas' {FRMAnotacoes},
  UTarefas in 'UTarefas.pas' {FRMTarefas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRMPrincipal, FRMPrincipal);
  Application.CreateForm(TFRMAnotacoes, FRMAnotacoes);
  Application.CreateForm(TFRMTarefas, FRMTarefas);
  Application.Run;
end.
