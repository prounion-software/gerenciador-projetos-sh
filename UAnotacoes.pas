unit UAnotacoes;

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
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit;

type
  TFRMAnotacoes = class(TForm)
    Panel1: TPanel;
    grid_anotacoesDBTableView1: TcxGridDBTableView;
    grid_anotacoesLevel1: TcxGridLevel;
    grid_anotacoes: TcxGrid;
    grid_anotacoesDBTableView1ID_PROJETO: TcxGridDBColumn;
    grid_anotacoesDBTableView1ID_ANOTACAO: TcxGridDBColumn;
    grid_anotacoesDBTableView1DESCRICAO: TcxGridDBColumn;
    grid_anotacoesDBTableView1HORA_REGISTRO: TcxGridDBColumn;
    cxa_descricao: TcxTextEdit;
    bta_adicionar: TcxButton;
    Label1: TLabel;
    MenuAnotacoes: TPopupMenu;
    Excluir1: TMenuItem;
    Editardescricao1: TMenuItem;
    bta_salvar: TcxButton;
    bta_cancelar: TcxButton;
    cxa_editar: TcxTextEdit;
    QryManu: TFDQuery;
    procedure bta_adicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Editardescricao1Click(Sender: TObject);
    procedure bta_salvarClick(Sender: TObject);
    procedure bta_cancelarClick(Sender: TObject);
    procedure habilitarMenu();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMAnotacoes: TFRMAnotacoes;

implementation

uses
  GerenciadorProjetos;

{$R *.dfm}

procedure TFRMAnotacoes.bta_adicionarClick(Sender: TObject);
begin
  if cxa_descricao.Text = '' then
  begin
    Application.MessageBox('Insira uma descrição','Informação do sistema', MB_ICONEXCLAMATION+MB_OK);
    cxa_descricao.SetFocus;
  end
  else
  begin
    with FRMPrincipal do
    begin
      QryAnotacoes.Insert;

      QryAnotacoesID_PROJETO.Value := QryProjetosID_REGISTRO.Value;
      QryAnotacoesDESCRICAO.Value  := cxa_descricao.Text;
      QryAnotacoesHORA_REGISTRO.AsDateTime := now;
      QryAnotacoes.Post;

      QryAnotacoes.Close;
      QryAnotacoes.Open;

      cxa_descricao.Clear;
    end;
  end;

  habilitarMenu();
end;

procedure TFRMAnotacoes.bta_cancelarClick(Sender: TObject);
begin
  cxa_descricao.Visible := true;
  bta_adicionar.Visible := true;
  cxa_editar.Visible    := false;
  bta_salvar.Visible    := false;
  bta_cancelar.Visible  := false;
  cxa_editar.Clear;
end;

procedure TFRMAnotacoes.bta_salvarClick(Sender: TObject);
begin
  with QryManu do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE ANOTACOES_PROJETO   ');
    SQL.Add('SET DESCRICAO = :DESCRICAO ');
    SQL.Add('WHERE ID_PROJETO = :ID_PROJETO AND ID_ANOTACAO = :ID_ANOTACAO ');
    ParamByName('DESCRICAO').AsString    := cxa_editar.Text;
    ParamByName('ID_PROJETO').AsInteger  := FRMPrincipal.QryAnotacoesID_PROJETO.AsInteger;
    ParamByName('ID_ANOTACAO').AsInteger := FRMPrincipal.QryAnotacoesID_ANOTACAO.AsInteger;
    ExecSQL;
  end;

  FRMPrincipal.QryAnotacoes.Close;
  FRMPrincipal.QryAnotacoes.Open;

  cxa_descricao.Visible := true;
  bta_adicionar.Visible := true;
  cxa_editar.Visible    := false;
  bta_salvar.Visible    := false;
  bta_cancelar.Visible  := false;
  cxa_editar.Clear;
end;

procedure TFRMAnotacoes.Editardescricao1Click(Sender: TObject);
begin
  cxa_descricao.Visible := false;
  bta_adicionar.Visible := false;
  cxa_editar.Visible    := true;
  bta_salvar.Visible    := true;
  bta_cancelar.Visible  := true;

  cxa_editar.Text := FRMPrincipal.QryAnotacoesDESCRICAO.AsString;
  cxa_editar.SetFocus;
end;

procedure TFRMAnotacoes.Excluir1Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir essa anotação?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    FRMPrincipal.QryAnotacoes.Delete;
  end;

  habilitarMenu();
end;

procedure TFRMAnotacoes.FormShow(Sender: TObject);
begin
  cxa_descricao.SetFocus;
  habilitarMenu();
end;

procedure TFRMAnotacoes.habilitarMenu;
begin
  if FRMPrincipal.QryAnotacoes.RecordCount = 0 then
  begin
    Excluir1.Enabled                := false;
    Editardescricao1.Enabled        := false;
  end
  else
  begin
    Excluir1.Enabled                := true;
    Editardescricao1.Enabled        := true;
  end;
end;

end.
