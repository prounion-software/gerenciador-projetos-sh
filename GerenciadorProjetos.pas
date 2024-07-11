unit GerenciadorProjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxMemo, cxCurrencyEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, cxButtons, cxCheckGroup, cxGroupBox, cxRadioGroup,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, Vcl.ExtCtrls, cxPC, cxDBEdit, cxImageComboBox, DateUtils;

type
  TFRMPrincipal = class(TForm)
    cxPageControl1: TcxPageControl;
    tabVisualizacao: TcxTabSheet;
    tabRegistro: TcxTabSheet;
    tabCliente: TcxTabSheet;
    Panel4: TPanel;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxv_orcamento: TcxTextEdit;
    cxv_projeto: TcxTextEdit;
    cxv_cliente: TcxLookupComboBox;
    dtv_inicial: TcxDateEdit;
    dtv_final: TcxDateEdit;
    rgv_tipo: TcxRadioGroup;
    cgv_status: TcxCheckGroup;
    btv_consultar: TcxButton;
    btv_limpar: TcxButton;
    grid_visualizacaoGeral: TcxGrid;
    grid_visualizacaoGeralDBTableView1: TcxGridDBTableView;
    grid_visualizacaoGeralLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxGroupBox3: TcxGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxr_cliente: TcxLookupComboBox;
    cxr_status: TcxComboBox;
    rgr_tipo: TcxRadioGroup;
    cxGroupBox4: TcxGroupBox;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cxr_num_orcamento: TcxTextEdit;
    cxr_horas: TcxTextEdit;
    cxr_valor_hora: TcxCurrencyEdit;
    cxr_valor_total: TcxCurrencyEdit;
    cxr_prazo: TcxTextEdit;
    dtr_orcamento: TcxDateEdit;
    dtr_validade: TcxDateEdit;
    cxGroupBox5: TcxGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cxr_titulo: TcxTextEdit;
    dtr_entrega: TcxDateEdit;
    cxr_pedido_cliente: TcxTextEdit;
    btr_adicionar: TcxButton;
    btr_alterar: TcxButton;
    btr_excluir: TcxButton;
    btr_salvar: TcxButton;
    btr_cancelar: TcxButton;
    Panel3: TPanel;
    cxGroupBox2: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxc_nome: TcxTextEdit;
    cxc_contato1: TcxTextEdit;
    cxc_contato2: TcxTextEdit;
    cxc_obs: TcxMemo;
    grid_cliente: TcxGrid;
    grid_clienteDBTableView1: TcxGridDBTableView;
    grid_clienteLevel1: TcxGridLevel;
    cxc_consulta: TcxTextEdit;
    btc_consultar: TcxButton;
    FDConnection1: TFDConnection;
    QryProjetos: TFDQuery;
    DSProjetos: TDataSource;
    QryClientes: TFDQuery;
    DSClientes: TDataSource;
    QryTarefas: TFDQuery;
    DSTarefas: TDataSource;
    QryAnotacoes: TFDQuery;
    DSAnotacoes: TDataSource;
    QryAnotacoesID_PROJETO: TIntegerField;
    QryAnotacoesID_ANOTACAO: TFDAutoIncField;
    QryAnotacoesDESCRICAO: TWideStringField;
    QryAnotacoesHORA_REGISTRO: TDateTimeField;
    QryTarefasID_PROJETO: TIntegerField;
    QryTarefasID_TAREFA: TFDAutoIncField;
    QryTarefasDESCRICAO: TWideStringField;
    QryTarefasCONCLUIDO: TIntegerField;
    QryClientesID_CLIENTE: TFDAutoIncField;
    QryClientesNOME_CLIENTE: TWideStringField;
    QryClientesCONTATO1: TWideStringField;
    QryClientesCONTATO2: TWideStringField;
    QryClientesOBSERVACOES: TWideStringField;
    grid_visualizacaoGeralDBTableView1ID_REGISTRO: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1CLIENTE: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1NUM_ORCAMENTO: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1QTDE_HORAS: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1VALOR_HORA: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1VALOR_TOTAL: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1DATA_ORCAMENTO: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1DATA_VALIDADE: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1TITULO_PROJETO: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1DATA_ENTREGA: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1PEDIDO_CLIENTE: TcxGridDBColumn;
    btc_adicionar: TcxButton;
    btc_alterar: TcxButton;
    btc_excluir: TcxButton;
    btc_salvar: TcxButton;
    btc_cancelar: TcxButton;
    cxr_id: TcxDBTextEdit;
    QryProjetosID_REGISTRO: TFDAutoIncField;
    QryProjetosTIPO: TIntegerField;
    QryProjetosCLIENTE: TIntegerField;
    QryProjetosNUM_ORCAMENTO: TWideStringField;
    QryProjetosQTDE_HORAS: TIntegerField;
    QryProjetosVALOR_HORA: TFloatField;
    QryProjetosVALOR_TOTAL: TFloatField;
    QryProjetosDATA_ORCAMENTO: TDateField;
    QryProjetosDATA_VALIDADE: TDateField;
    QryProjetosTITULO_PROJETO: TWideStringField;
    QryProjetosDATA_ENTREGA: TDateField;
    QryProjetosPEDIDO_CLIENTE: TWideStringField;
    grid_visualizacaoGeralDBTableView1TIPO: TcxGridDBColumn;
    grid_visualizacaoGeralDBTableView1STATUS: TcxGridDBColumn;
    QryProjetosSTATUS: TWideStringField;
    grid_clienteDBTableView1ID_CLIENTE: TcxGridDBColumn;
    grid_clienteDBTableView1NOME_CLIENTE: TcxGridDBColumn;
    grid_clienteDBTableView1CONTATO1: TcxGridDBColumn;
    grid_clienteDBTableView1CONTATO2: TcxGridDBColumn;
    grid_clienteDBTableView1OBSERVACOES: TcxGridDBColumn;
    QryManu: TFDQuery;
    QryClienteProjeto: TFDQuery;
    QryClienteProjetoID_REGISTRO: TFDAutoIncField;
    QryClienteProjetoCLIENTE: TIntegerField;
    btr_anotacoes: TcxButton;
    btr_tarefas: TcxButton;
    procedure btr_anotacoesClick(Sender: TObject);
    procedure btr_tarefasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btv_consultarClick(Sender: TObject);
    procedure btv_limparClick(Sender: TObject);
    procedure btc_adicionarClick(Sender: TObject);
    procedure habilitarBotoes(acao: string);
    procedure habilitarCampos(aba: string; habilitar: string);
    procedure limparCampos(aba: string);
    procedure btr_cancelarClick(Sender: TObject);
    procedure btr_adicionarClick(Sender: TObject);
    procedure avisoCamposVazios;
    procedure btr_salvarClick(Sender: TObject);
    procedure grid_visualizacaoGeralDBTableView1STATUSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btc_salvarClick(Sender: TObject);
    procedure salvarRegistro();
    procedure btr_alterarClick(Sender: TObject);
    procedure btr_excluirClick(Sender: TObject);
    procedure grid_visualizacaoGeralDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure calcularValor();
    procedure cxr_horasExit(Sender: TObject);
    procedure cxr_valor_horaExit(Sender: TObject);
    procedure calcularValidade();
    procedure dtr_orcamentoExit(Sender: TObject);
    procedure cxr_prazoPropertiesChange(Sender: TObject);
    procedure dtr_validadeExit(Sender: TObject);
    procedure grid_clienteDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btc_alterarClick(Sender: TObject);
    procedure btc_excluirClick(Sender: TObject);
    procedure btc_cancelarClick(Sender: TObject);
    procedure btc_consultarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure consultarRegistro();
    procedure consultarCliente();
  private
    { Private declarations }
    function temClienteNoProjeto(idcliente: integer): boolean;
  public
    { Public declarations }
  end;

var
  FRMPrincipal: TFRMPrincipal;
  camposVazios: integer;
implementation


{$R *.dfm}

uses UAnotacoes, UTarefas, UUtils;

procedure TFRMPrincipal.avisoCamposVazios;
begin
  camposVazios := 0;

  if cxPageControl1.ActivePageIndex = 1 then
  begin
    if cxr_cliente.Text = '' then
    begin
      Application.MessageBox('Informe o cliente.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
      cxr_cliente.SetFocus;
      camposVazios := camposVazios + 1;
      Exit;
    end;

    if cxr_status.Text = '' then
    begin
      Application.MessageBox('Informe o status atual.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
      cxr_status.SetFocus;
      camposVazios := camposVazios + 1;
      Exit;
    end;

    // se um orçamento estiver sendo incluído
    if rgr_tipo.ItemIndex = 0 then
    begin
      if cxr_num_orcamento.Text = '' then
      begin
        Application.MessageBox('Informe o número do orçamento.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        cxr_num_orcamento.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if cxr_horas.Text = '' then
      begin
        Application.MessageBox('Informe a quantidade de horas do orçamento.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        cxr_horas.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if cxr_valor_hora.Text = '' then
      begin
        Application.MessageBox('Informe o valor da hora.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        cxr_valor_hora.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if cxr_valor_total.Text = '' then
        calcularValor();

      if dtr_orcamento.Text = '' then
      begin
        Application.MessageBox('Informe a data do orçamento.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        dtr_orcamento.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if cxr_prazo.Text = '' then
      begin
        Application.MessageBox('Informe os dias de prazo do orçamento.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        cxr_prazo.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if dtr_validade.Text = '' then
        calcularValidade();
    end;

    // se um projeto estiver sendo incluído
    if rgr_tipo.ItemIndex = 1 then
    begin
      if cxr_titulo.Text = '' then
      begin
        Application.MessageBox('Informe o título do projeto.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        cxr_titulo.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;

      if dtr_entrega.Text = '' then
      begin
        Application.MessageBox('Informe a data de entrega do projeto.', 'Campos obrigatórios', MB_ICONASTERISK + MB_OK);
        dtr_entrega.SetFocus;
        camposVazios := camposVazios + 1;
        Exit;
      end;
    end;
  end;
end;

procedure TFRMPrincipal.btc_adicionarClick(Sender: TObject);
begin
  QryClientes.Open;

  limparCampos('cliente');
  habilitarCampos('cliente', 'habilita');
  habilitarBotoes('incluirAlterarCliente');

  cxc_nome.SetFocus;
  QryClientes.Insert;

end;

procedure TFRMPrincipal.btc_alterarClick(Sender: TObject);
begin
  habilitarBotoes('incluirAlterarCliente');
  habilitarCampos('cliente', 'habilita');

  QryClientes.Edit;
end;

procedure TFRMPrincipal.btc_cancelarClick(Sender: TObject);
begin
  if QryClientes.State in [dsInsert] then
  begin
    limparCampos('cliente');
    habilitarBotoes('cancelarNovoCliente');
  end;

  if QryClientes.State in [dsEdit] then
    habilitarBotoes('cancelarAlterarCliente');

  QryClientes.Cancel;
  consultarCliente();

  habilitarCampos('cliente', 'desabilita');
end;

procedure TFRMPrincipal.btc_consultarClick(Sender: TObject);
begin
  with QryClientes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID_CLIENTE, NOME_CLIENTE, CONTATO1, CONTATO2, OBSERVACOES ');
    SQL.Add('FROM CLIENTES                                                    ');

    if cxc_consulta.Text <> '' then
    begin
      SQL.Add('WHERE NOME_CLIENTE LIKE :CLIENTE');
      ParamByName('CLIENTE').AsString := '%' + cxc_consulta.Text + '%';
    end;

    Open;
  end;
end;

procedure TFRMPrincipal.btc_excluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do cliente?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = MRYES then
  begin
    if temClienteNoProjeto(QryClientesID_CLIENTE.AsInteger) then
    begin
      Application.MessageBox('Não é possível seguir com a exclusão.'+#13+'Há orçamentos ou projetos com esse cliente.', 'Atenção', MB_ICONASTERISK + MB_OK);
      abort;
    end;

    QryClientes.Delete;
    cxc_nome.Clear;
    cxc_contato1.Clear;
    cxc_contato2.Clear;
    cxc_obs.Clear;
  end;
end;

procedure TFRMPrincipal.btc_salvarClick(Sender: TObject);
begin
  QryClientesNOME_CLIENTE.Value := cxc_nome.Text;
  QryClientesCONTATO1.Value     := cxc_contato1.Text;
  QryClientesCONTATO2.Value     := cxc_contato2.Text;
  QryClientesOBSERVACOES.Value  := cxc_obs.Text;

  QryClientes.Post;
  QryClientes.Close;
  QryClientes.Open;

  habilitarBotoes('visualizarCliente');
  habilitarCampos('cliente', 'desabilita');
end;

procedure TFRMPrincipal.btr_adicionarClick(Sender: TObject);
begin
  limparCampos('registro');
  habilitarBotoes('novoRegistro');
  habilitarBotoes('semAnotacao');
  habilitarCampos('registro', 'habilita');

  cxr_cliente.SetFocus;

  cxr_status.ItemIndex := 0;
  rgr_tipo.ItemIndex   := 0;
  cxr_prazo.Text       := '10';

  QryProjetos.Insert;
end;

procedure TFRMPrincipal.btr_alterarClick(Sender: TObject);
begin
  habilitarBotoes('alterarRegistro');
  habilitarCampos('registro', 'habilita');

  QryProjetos.Edit;
end;

procedure TFRMPrincipal.btr_anotacoesClick(Sender: TObject);
begin
  with QryAnotacoes do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID_PROJETO, ID_ANOTACAO, DESCRICAO, HORA_REGISTRO ');
    SQL.Add('FROM ANOTACOES_PROJETO                                   ');
    SQL.Add('WHERE ID_PROJETO = :ID_PROJETO                           ');
    ParamByName('ID_PROJETO').AsInteger := QryProjetosID_REGISTRO.AsInteger;
    Open;
  end;

  FRMAnotacoes.showmodal;
end;

procedure TFRMPrincipal.btr_cancelarClick(Sender: TObject);
begin
  if QryProjetos.State in [dsInsert] then
  begin
    limparCampos('registro');
    habilitarBotoes('cancelarNovoRegistro');
    cxPageControl1.ActivePageIndex := 0;
  end;

  if QryProjetos.State in [dsEdit] then
    habilitarBotoes('cancelarAlterarRegistro');

  habilitarCampos('registro', 'desabilita');
  QryProjetos.Cancel;
  consultarRegistro();
end;

procedure TFRMPrincipal.btr_excluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    QryManu.SQL.Clear;
    QryManu.SQL.Add('DELETE FROM ANOTACOES_PROJETO WHERE ID_PROJETO = :ID');
    QryManu.ParamByName('ID').AsInteger := QryProjetosID_REGISTRO.AsInteger;
    QryManu.ExecSQL;

    QryManu.SQL.Clear;
    QryManu.SQL.Add('DELETE FROM TAREFAS_PROJETO WHERE ID_PROJETO = :ID');
    QryManu.ParamByName('ID').AsInteger := QryProjetosID_REGISTRO.AsInteger;
    QryManu.ExecSQL;

    QryProjetos.Delete;

    habilitarBotoes('excluirRegistro');
    habilitarCampos('registro', 'desabilita');
    limparCampos('registro');

    btr_adicionar.SetFocus;
  end;
end;

procedure TFRMPrincipal.btr_salvarClick(Sender: TObject);
begin
  avisoCamposVazios();
  if camposVazios = 0 then
  begin
    salvarRegistro();
    habilitarBotoes('visualizarRegistro');
    habilitarBotoes('anotar');
    habilitarCampos('registro', 'desabilita');

    QryProjetos.Close;
    QryProjetos.Open;

    QryProjetos.Last;
  end;

end;

procedure TFRMPrincipal.btr_tarefasClick(Sender: TObject);
begin
  with QryTarefas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT ID_PROJETO, ID_TAREFA, DESCRICAO, CONCLUIDO ');
    SQL.Add('FROM TAREFAS_PROJETO                                ');
    SQL.Add('WHERE ID_PROJETO = :ID_REGISTRO                    ');
    ParamByName('ID_REGISTRO').AsInteger := QryProjetosID_REGISTRO.AsInteger;
    Open;
  end;

  FRMTarefas.ShowModal;
end;

procedure TFRMPrincipal.btv_consultarClick(Sender: TObject);
begin
  with QryProjetos do
  begin
    SQL.Clear;
    SQL.Add('SELECT ID_REGISTRO, CLIENTE, NUM_ORCAMENTO, QTDE_HORAS, STATUS, ');
    SQL.Add('       VALOR_HORA, VALOR_TOTAL, DATA_ORCAMENTO, DATA_VALIDADE,  ');
    SQL.Add('       TITULO_PROJETO, DATA_ENTREGA, PEDIDO_CLIENTE, TIPO       ');
    SQL.Add('FROM PROJETOS                                                   ');
    SQL.Add('WHERE ID_REGISTRO > 0                                           ');

    if cxv_orcamento.Text <> '' then
    begin
      SQL.Add(' AND NUM_ORCAMENTO LIKE :ORCAMENTO ');
      ParamByName('ORCAMENTO').AsString := '%' + cxv_orcamento.Text + '%';
    end;

    if cxv_projeto.Text <> '' then
    begin
      SQL.Add(' AND TITULO_PROJETO LIKE :PROJETO ');
      ParamByName('PROJETO').AsString := '%' + cxv_projeto.Text + '%';
    end;

    if cxv_cliente.Text <> '' then
    begin
      SQL.Add(' AND CLIENTE LIKE :CLIENTE ');
      ParamByName('CLIENTE').Value := cxv_cliente.EditValue;
    end;

    if (dtv_inicial.Text <> '') and (dtv_final.Text <> '') then
    begin
      SQL.Add(' AND DATA_ORCAMENTO BETWEEN :DT_INICIAL AND :DT_FINAL ');
      ParamByName('DT_INICIAL').AsDateTime := dtv_inicial.date;
      ParamByName('DT_FINAL').AsDateTime   := dtv_final.date;
    end;

    if rgv_tipo.ItemIndex = 0 then
    begin
      SQL.Add(' AND TIPO = :TIPO ');
      ParamByName('TIPO').AsInteger := 0;
    end;

    if rgv_tipo.ItemIndex = 1 then
    begin
      SQL.Add(' AND TIPO = :TIPO ');
      ParamByName('TIPO').AsInteger := 1;
    end;

    if (cgv_status.States[0] = cbsUnchecked) and (cgv_status.States[1] = cbsUnchecked) and
       (cgv_status.States[2] = cbsUnchecked) and (cgv_status.States[3] = cbsUnchecked) and
       (cgv_status.States[4] = cbsUnchecked) and (cgv_status.States[5] = cbsUnchecked) then
      SQL.Add(' AND STATUS <> '''' ')       // consulta todos
    else
      SQL.Add(' AND STATUS = ''x'' ');     // apenas para a consulta poder ter um 'OR'

    if cgv_status.States[0] = cbsChecked then
      SQL.Add(' OR STATUS = ''Pendente'' ');

    if cgv_status.States[1] = cbsChecked then
      SQL.Add(' OR STATUS = ''Finalizado'' ');

    if cgv_status.States[2] = cbsChecked then
      SQL.Add(' OR STATUS = ''Em andamento'' ');

    if cgv_status.States[3] = cbsChecked then
      SQL.Add(' OR STATUS = ''Recusado'' ');

    if cgv_status.States[4] = cbsChecked then
      SQL.Add(' OR STATUS = ''Aguardando validação'' ');

    if cgv_status.States[5] = cbsChecked then
      SQL.Add(' OR STATUS = ''Cancelado'' ');

    SQL.Add('ORDER BY ID_REGISTRO ');
    Open;

    if RecordCount = 0 then
    begin
      Application.MessageBox('Sem resultados encontrados.', 'Informação do sistema', MB_ICONINFORMATION + MB_OK);
    end;
  end;

end;

procedure TFRMPrincipal.btv_limparClick(Sender: TObject);
begin
  limparCampos('visualizacao');
end;

procedure TFRMPrincipal.calcularValidade;
begin
  dtr_validade.Date := dtr_orcamento.Date + StrToInt(cxr_prazo.Text);
end;

procedure TFRMPrincipal.calcularValor;
var
  valor_total : double;
begin
  valor_total := cxr_valor_hora.EditValue * StrtoFloat(cxr_horas.Text);
  cxr_valor_total.EditValue := Floattostr(valor_total);
end;

procedure TFRMPrincipal.consultarCliente;
begin
  cxc_nome.Text     := QryClientesNOME_CLIENTE.AsString;
  cxc_contato1.Text := QryClientesCONTATO1.AsString;
  cxc_contato2.Text := QryClientesCONTATO2.AsString;
  cxc_obs.Text      := QryClientesOBSERVACOES.AsString;
end;

procedure TFRMPrincipal.consultarRegistro;
begin
  cxr_cliente.EditValue     := QryProjetosCLIENTE.AsInteger;
  rgr_tipo.ItemIndex        := QryProjetosTIPO.AsInteger;
  cxr_status.Text           := QryProjetosSTATUS.AsString;
  cxr_num_orcamento.Text    := QryProjetosNUM_ORCAMENTO.AsString;
  cxr_horas.Text            := IntToStr(QryProjetosQTDE_HORAS.AsInteger);
  cxr_valor_hora.EditValue  := QryProjetosVALOR_HORA.AsFloat;
  cxr_valor_total.EditValue := QryProjetosVALOR_TOTAL.AsFloat;
  cxr_titulo.Text           := QryProjetosTITULO_PROJETO.AsString;
  cxr_pedido_cliente.Text   := QryProjetosPEDIDO_CLIENTE.AsString;

  if not QryProjetosDATA_ORCAMENTO.IsNull then
    dtr_orcamento.Date        := QryProjetosDATA_ORCAMENTO.AsDateTime
  else
    dtr_orcamento.Text := '';

  if not QryProjetosDATA_VALIDADE.IsNull then
    dtr_validade.Date         := QryProjetosDATA_VALIDADE.AsDateTime
  else
    dtr_validade.Text := '';

  if not QryProjetosDATA_ENTREGA.IsNull then
    dtr_entrega.Date          := QryProjetosDATA_ENTREGA.AsDateTime
  else
    dtr_entrega.Text := '';

  if not QryProjetosDATA_ORCAMENTO.IsNull then
    cxr_prazo.Text := IntToStr(DaysBetween(dtr_orcamento.Date, dtr_validade.Date))
  else
    cxr_prazo.Text := '';
end;

procedure TFRMPrincipal.cxr_horasExit(Sender: TObject);
begin
  if (cxr_horas.Text <> '') and (cxr_valor_hora.Text <> '') then
    calcularValor();
end;

procedure TFRMPrincipal.cxr_prazoPropertiesChange(Sender: TObject);
begin
  if (dtr_orcamento.Text <> '') and (cxr_prazo.Text <> '') then
    calcularValidade();

  if cxr_prazo.Text = '' then
    dtr_validade.text := '';
end;

procedure TFRMPrincipal.cxr_valor_horaExit(Sender: TObject);
begin
  if (cxr_horas.Text <> '') and (cxr_valor_hora.Text <> '') then
    calcularValor();
end;

procedure TFRMPrincipal.dtr_orcamentoExit(Sender: TObject);
begin
  if (dtr_orcamento.Text <> '') and (cxr_prazo.Text <> '') then
    calcularValidade();
end;

procedure TFRMPrincipal.dtr_validadeExit(Sender: TObject);
begin
  if (dtr_orcamento.Text <> '') and (dtr_validade.Text <> '') then
    cxr_prazo.Text := IntToStr(DaysBetween(dtr_orcamento.Date, dtr_validade.Date));
end;

procedure TFRMPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFRMPrincipal.FormShow(Sender: TObject);
begin


  cxPageControl1.ActivePageIndex := 0;
  QryProjetos.Open;
  QryClientes.Open;
end;

procedure TFRMPrincipal.grid_clienteDBTableView1CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  consultarCliente();
  habilitarBotoes('visualizarCliente');
end;

procedure TFRMPrincipal.grid_visualizacaoGeralDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  consultarRegistro();
  cxPageControl1.ActivePageIndex := 1;

  habilitarBotoes('visualizarRegistro');
  habilitarBotoes('anotar');
end;

procedure TFRMPrincipal.grid_visualizacaoGeralDBTableView1STATUSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  status: string;
begin
  status := AViewInfo.Text;

  if status = 'Pendente' then
    ACanvas.Font.Color := clPurple;

  if status = 'Em andamento' then
    ACanvas.Font.Color := clNavy;

  if status = 'Finalizado' then
    ACanvas.Font.Color := clGreen;

  if status = 'Aguardando validação' then
    ACanvas.Font.Color := clTeal;

  if status = 'Cancelado' then
    ACanvas.Font.Color := clGray;

  if status = 'Recusado' then
    ACanvas.Font.Color := clRed;
end;

procedure TFRMPrincipal.habilitarBotoes(acao: string);
begin
  if acao = 'incluirAlterarCliente' then
  begin
    btc_adicionar.Enabled := false;
    btc_alterar.Enabled   := false;
    btc_excluir.Enabled   := false;
    btc_salvar.Enabled    := true;
    btc_cancelar.Enabled  := true;
    btc_consultar.Enabled := false;
  end;

  if acao = 'visualizarCliente' then
  begin
    btc_adicionar.Enabled := true;
    btc_alterar.Enabled   := true;
    btc_excluir.Enabled   := true;
    btc_salvar.Enabled    := false;
    btc_cancelar.Enabled  := false;
    btc_consultar.Enabled := true;
  end;

  if acao = 'cancelarNovoCliente' then
  begin
    btc_adicionar.Enabled := true;
    btc_alterar.Enabled   := false;
    btc_excluir.Enabled   := false;
    btc_salvar.Enabled    := false;
    btc_cancelar.Enabled  := false;
    btc_consultar.Enabled := true;
  end;

  if acao = 'cancelarAlterarCliente' then
  begin
    btc_adicionar.Enabled := true;
    btc_alterar.Enabled   := true;
    btc_excluir.Enabled   := true;
    btc_salvar.Enabled    := false;
    btc_cancelar.Enabled  := false;
    btc_consultar.Enabled := true;
  end;

  if acao = 'excluirCliente' then
  begin
    btc_adicionar.Enabled := true;
    btc_alterar.Enabled   := false;
    btc_excluir.Enabled   := false;
    btc_salvar.Enabled    := false;
    btc_cancelar.Enabled  := false;
    btc_consultar.Enabled := true;
  end;

  if acao = 'novoRegistro' then
  begin
    btr_adicionar.Enabled := false;
    btr_alterar.Enabled   := false;
    btr_excluir.Enabled   := false;
    btr_salvar.Enabled    := true;
    btr_cancelar.Enabled  := true;
    btr_anotacoes.Enabled := false;
    btr_tarefas.Enabled   := false;
  end;

  if acao = 'alterarRegistro' then
  begin
    btr_adicionar.Enabled := false;
    btr_alterar.Enabled   := false;
    btr_excluir.Enabled   := false;
    btr_salvar.Enabled    := true;
    btr_cancelar.Enabled  := true;
    btr_anotacoes.Enabled := true;
    btr_tarefas.Enabled   := true;
  end;

  if acao = 'visualizarRegistro' then
  begin
    btr_adicionar.Enabled := true;
    btr_alterar.Enabled   := true;
    btr_excluir.Enabled   := true;
    btr_salvar.Enabled    := false;
    btr_cancelar.Enabled  := false;
    btr_anotacoes.Enabled := true;
    btr_tarefas.Enabled   := true;
  end;

  if acao = 'cancelarNovoRegistro' then
  begin
    btr_adicionar.Enabled := true;
    btr_alterar.Enabled   := false;
    btr_excluir.Enabled   := false;
    btr_salvar.Enabled    := false;
    btr_cancelar.Enabled  := false;
    btr_anotacoes.Enabled := false;
    btr_tarefas.Enabled   := false;
  end;

  if acao = 'cancelarAlterarRegistro' then
  begin
    btr_adicionar.Enabled := true;
    btr_alterar.Enabled   := true;
    btr_excluir.Enabled   := true;
    btr_salvar.Enabled    := false;
    btr_cancelar.Enabled  := false;
    btr_anotacoes.Enabled := true;
    btr_tarefas.Enabled   := true;
  end;

  if acao = 'excluirRegistro' then
  begin
    btr_adicionar.Enabled := true;
    btr_alterar.Enabled   := false;
    btr_excluir.Enabled   := false;
    btr_salvar.Enabled    := false;
    btr_cancelar.Enabled  := false;
    btr_anotacoes.Enabled := false;
    btr_tarefas.Enabled   := false;
  end;

  if acao = 'anotar' then
  begin
    btr_anotacoes.Enabled := true;
    btr_tarefas.Enabled   := true;
  end;

  if acao = 'semAnotacao' then
  begin
    btr_anotacoes.Enabled := false;
    btr_tarefas.Enabled   := false;
  end;
end;

procedure TFRMPrincipal.habilitarCampos(aba, habilitar: string);
begin
  if (aba = 'registro') and (habilitar = 'habilita') then
  begin
    cxGroupBox3.Enabled := true;
    cxGroupBox4.Enabled := true;
    cxGroupBox5.Enabled := true;
  end;

  if (aba = 'registro') and (habilitar = 'desabilita') then
  begin
    cxGroupBox3.Enabled := false;
    cxGroupBox4.Enabled := false;
    cxGroupBox5.Enabled := false;
  end;

  if (aba = 'cliente') and (habilitar = 'habilita') then
  begin
    cxGroupBox2.Enabled := true;
  end;

  if (aba = 'cliente') and (habilitar = 'desabilita') then
  begin
    cxGroupBox2.Enabled := false;
  end;
end;

procedure TFRMPrincipal.limparCampos(aba: string);
begin
  if aba = 'visualizacao' then
  begin
    cxv_orcamento.Clear;
    cxv_projeto.Clear;
    cxv_cliente.Clear;
    dtv_inicial.Clear;
    dtv_final.Clear;
    rgv_tipo.ItemIndex := 2;
    cgv_status.States[0] := cbsUnchecked;
    cgv_status.States[1] := cbsUnchecked;
    cgv_status.States[2] := cbsUnchecked;
    cgv_status.States[3] := cbsUnchecked;
    cgv_status.States[4] := cbsUnchecked;
    cgv_status.States[5] := cbsUnchecked;
  end;

  if aba = 'registro' then
  begin
    cxr_id.Clear;
    cxr_cliente.Clear;
    cxr_status.Clear;
    cxr_num_orcamento.Clear;
    cxr_horas.Clear;
    cxr_valor_hora.Clear;
    cxr_valor_total.Clear;
    cxr_prazo.Clear;
    cxr_titulo.Clear;
    cxr_pedido_cliente.Clear;
    dtr_orcamento.Clear;
    dtr_validade.Clear;
    dtr_entrega.Clear;
    rgr_tipo.ItemIndex := -1;
  end;

  if aba = 'cliente' then
  begin
    cxc_nome.Clear;
    cxc_contato1.Clear;
    cxc_contato2.Clear;
    cxc_obs.Clear;
  end;
end;

procedure TFRMPrincipal.salvarRegistro;
begin
  QryProjetosCLIENTE.Value              := cxr_cliente.EditValue;
  QryProjetos.FieldByName('TIPO').Value := rgr_tipo.ItemIndex;
  QryProjetosSTATUS.Value               := cxr_status.Text;
  QryProjetosNUM_ORCAMENTO.Value        := cxr_num_orcamento.Text;
  QryProjetosPEDIDO_CLIENTE.Value       := cxr_pedido_cliente.Text;
  QryProjetosTITULO_PROJETO.Value       := cxr_titulo.Text;

  if cxr_horas.Text <> '' then
    QryProjetosQTDE_HORAS.Value          := StrToInt(cxr_horas.Text);

  if cxr_valor_hora.Text <> '' then
    QryProjetosVALOR_HORA.Value          := StrToFloat(cxr_valor_hora.EditValue);

  if cxr_valor_total.Text <> '' then
    QryProjetosVALOR_TOTAL.Value         := StrToFloat(cxr_valor_total.EditValue);

  if dtr_orcamento.Text <> '' then
    QryProjetosDATA_ORCAMENTO.AsDateTime := dtr_orcamento.Date;

  if dtr_validade.Text <> '' then
    QryProjetosDATA_VALIDADE.AsDateTime  := dtr_validade.Date;

  if dtr_entrega.Text <> '' then
    QryProjetosDATA_ENTREGA.AsDateTime   := dtr_entrega.Date;

  QryProjetos.Post;

  Application.MessageBox('Registro salvo com sucesso.', 'Informação do sistema', MB_ICONINFORMATION + MB_OK);
end;

function TFRMPrincipal.temClienteNoProjeto(idcliente: integer): boolean;
begin
  //verifica se tem produto usando esse grupo
  result := false;

  QryClienteProjeto.Close;
  QryClienteProjeto.ParamByName('CLIENTE').AsInteger := idcliente;
  QryClienteProjeto.Open;
  QryClienteProjeto.First;

  if QryClienteProjeto.RecordCount > 0 then
    result := true;
end;

end.
