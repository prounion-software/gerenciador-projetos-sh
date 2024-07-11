unit UTarefas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxCheckBox, cxContainer, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFRMTarefas = class(TForm)
    Panel1: TPanel;
    grid_tarefasDBTableView1: TcxGridDBTableView;
    grid_tarefasLevel1: TcxGridLevel;
    grid_tarefas: TcxGrid;
    grid_tarefasDBTableView1ID_PROJETO: TcxGridDBColumn;
    grid_tarefasDBTableView1ID_TAREFA: TcxGridDBColumn;
    grid_tarefasDBTableView1DESCRICAO: TcxGridDBColumn;
    grid_tarefasDBTableView1CONCLUIDO: TcxGridDBColumn;
    cxt_descricao: TcxTextEdit;
    btt_adicionar: TcxButton;
    Label1: TLabel;
    MenuTarefas: TPopupMenu;
    Marcarcomoconcluido1: TMenuItem;
    Editardescricao1: TMenuItem;
    Excluir1: TMenuItem;
    Marcarcomonaoconcluido1: TMenuItem;
    cxt_editar: TcxTextEdit;
    btt_salvar: TcxButton;
    btt_cancelar: TcxButton;
    QryManu: TFDQuery;
    procedure btt_adicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Editardescricao1Click(Sender: TObject);
    procedure btt_salvarClick(Sender: TObject);
    procedure btt_cancelarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Marcarcomonaoconcluido1Click(Sender: TObject);
    procedure Marcarcomoconcluido1Click(Sender: TObject);
    procedure habilitarMenu();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMTarefas: TFRMTarefas;

implementation

uses
  GerenciadorProjetos;

{$R *.dfm}

procedure TFRMTarefas.btt_adicionarClick(Sender: TObject);
begin
  if cxt_descricao.Text = '' then
  begin
    Application.MessageBox('Insira uma descrição','Informação do sistema', MB_ICONEXCLAMATION+MB_OK);
    cxt_descricao.SetFocus;
  end
  else
  begin
    with FRMPrincipal do
    begin
      QryTarefas.Insert;

      QryTarefasID_PROJETO.Value := QryProjetosID_REGISTRO.Value;
      QryTarefasDESCRICAO.Value  := cxt_descricao.Text;
      QryTarefasCONCLUIDO.Value  := 0;
      QryTarefas.Post;

      QryTarefas.Close;
      QryTarefas.Open;

      cxt_descricao.Clear;
    end;
  end;

  habilitarMenu();
end;

procedure TFRMTarefas.btt_cancelarClick(Sender: TObject);
begin
  cxt_descricao.Visible := true;
  btt_adicionar.Visible := true;
  cxt_editar.Visible    := false;
  btt_salvar.Visible    := false;
  btt_cancelar.Visible  := false;
  cxt_editar.Clear;
end;

procedure TFRMTarefas.btt_salvarClick(Sender: TObject);
begin
  with QryManu do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TAREFAS_PROJETO     ');
    SQL.Add('SET DESCRICAO = :DESCRICAO ');
    SQL.Add('WHERE ID_PROJETO = :ID_PROJETO AND ID_TAREFA = :ID_TAREFA ');
    ParamByName('DESCRICAO').AsString    := cxt_editar.Text;
    ParamByName('ID_PROJETO').AsInteger  := FRMPrincipal.QryTarefasID_PROJETO.AsInteger;
    ParamByName('ID_TAREFA').AsInteger := FRMPrincipal.QryTarefasID_TAREFA.AsInteger;
    ExecSQL;
  end;

  FRMPrincipal.QryTarefas.Close;
  FRMPrincipal.QryTarefas.Open;

  cxt_descricao.Visible := true;
  btt_adicionar.Visible := true;
  cxt_editar.Visible    := false;
  btt_salvar.Visible    := false;
  btt_cancelar.Visible  := false;
  cxt_editar.Clear;
end;

procedure TFRMTarefas.Editardescricao1Click(Sender: TObject);
begin
  cxt_descricao.Visible := false;
  btt_adicionar.Visible := false;
  cxt_editar.Visible    := true;
  btt_salvar.Visible    := true;
  btt_cancelar.Visible  := true;

  cxt_editar.Text := FRMPrincipal.QryTarefasDESCRICAO.AsString;
  cxt_editar.SetFocus;
end;

procedure TFRMTarefas.Excluir1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir essa tarefa?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    FRMPrincipal.QryTarefas.Delete;
  end;

  habilitarMenu();
end;

procedure TFRMTarefas.FormShow(Sender: TObject);
begin
  cxt_descricao.SetFocus;
  habilitarMenu();
end;

procedure TFRMTarefas.habilitarMenu;
begin
  if FRMPrincipal.QryTarefas.RecordCount = 0 then
  begin
    Excluir1.Enabled                := false;
    Editardescricao1.Enabled        := false;
    Marcarcomoconcluido1.Enabled    := false;
    Marcarcomonaoconcluido1.Enabled := false;
  end
  else
  begin
    Excluir1.Enabled                := true;
    Editardescricao1.Enabled        := true;
    Marcarcomoconcluido1.Enabled    := true;
    Marcarcomonaoconcluido1.Enabled := true;
  end;
end;

procedure TFRMTarefas.Marcarcomoconcluido1Click(Sender: TObject);
begin
  with QryManu do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TAREFAS_PROJETO ');
    SQL.Add('SET CONCLUIDO = 1      ');
    SQL.Add('WHERE ID_PROJETO = :ID_REGISTRO AND ID_TAREFA = :ID_TAREFA ');
    ParamByName('ID_REGISTRO').AsInteger := FRMPrincipal.QryTarefasID_PROJETO.AsInteger;
    ParamByName('ID_TAREFA').AsInteger   := FRMPrincipal.QryTarefasID_TAREFA.AsInteger;
    ExecSQL;
  end;

  FRMPrincipal.QryTarefas.Close;
  FRMPrincipal.QryTarefas.Open;
end;

procedure TFRMTarefas.Marcarcomonaoconcluido1Click(Sender: TObject);
begin
  with QryManu do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE TAREFAS_PROJETO ');
    SQL.Add('SET CONCLUIDO = 0      ');
    SQL.Add('WHERE ID_PROJETO = :ID_REGISTRO AND ID_TAREFA = :ID_TAREFA ');
    ParamByName('ID_REGISTRO').AsInteger := FRMPrincipal.QryTarefasID_PROJETO.AsInteger;
    ParamByName('ID_TAREFA').AsInteger   := FRMPrincipal.QryTarefasID_TAREFA.AsInteger;
    ExecSQL;
  end;

  FRMPrincipal.QryTarefas.Close;
  FRMPrincipal.QryTarefas.Open;
end;

end.


