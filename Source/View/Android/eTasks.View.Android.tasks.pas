unit eTasks.View.Android.tasks;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Layouts,
  FMX.TabControl,
  FMX.Objects,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Ani,
  //eTasks - View dialogs factory
  eTasks.View.Dialogs.Factory, FMX.Effects, FMX.Edit, FMX.ScrollBox, FMX.Memo;

type
  tipo_acao = (taNovo, taEditar, taExibe, taLista);

  Telas = (TelaCategorias);

  TTela_Tarefas = class(TForm)
    Lay_main: TLayout;
    TabTarefas: TTabControl;
    TabListaTarefa: TTabItem;
    TabExibeTarefa: TTabItem;
    TabNovoEditaTarefa: TTabItem;
    ToolBar_container: TLayout;
    ToolBar: TLayout;
    Linha_titulo: TLine;
    Botao_voltar: TImage;
    botao_ajuda: TImage;
    title_MinhasTarefas: TImage;
    title_EditaTarefa: TImage;
    title_NovaTarefa: TImage;
    Lay_Topo_lista: TLayout;
    Lay_data_select: TLayout;
    Btn_Volta_data: TImage;
    Btn_Avanca_data: TImage;
    Label_Data: TLabel;
    ListaTarefas: TListView;
    Lay_Lista_vazia: TLayout;
    ListaVaziaFundo: TRectangle;
    Image_sem_tarefas: TImage;
    Label_sem_tarefas: TLabel;
    Img_Afazer: TImage;
    Img_Concluido: TImage;
    RecStatus: TRectangle;
    AnimaStatus: TFloatAnimation;
    Btn_Add_tarefa: TImage;
    Btn_apaga_task: TImage;
    Btn_edita_task: TImage;
    Lay_container_tarefa: TLayout;
    Lay_container_status: TLayout;
    Btn_status: TImage;
    Label_tarefa: TLabel;
    Lay_descricao_exibe: TLayout;
    Linha_descricao_exibe: TLine;
    Lbl_descricao_title_exibe: TLabel;
    Lay_categoria_exibe: TLayout;
    Linha_categoria_title_exibe: TLine;
    Lbl_categoria_exibe: TLabel;
    Lay_data_exibe: TLayout;
    Linha_data_exibe: TLine;
    Lbl_data_exibe: TLabel;
    Lay_container_descricao_exibe: TLayout;
    Lay_container_categoria: TLayout;
    Img_Categoria_exibe: TImage;
    Label_categoria: TLabel;
    Label_data_exibe: TLabel;
    Label_descricao: TLabel;
    Btn_OK: TImage;
    Lay_tarefa: TLayout;
    Lay_tarefa_container: TLayout;
    Rec_tarefa: TRectangle;
    ShadowEffect1: TShadowEffect;
    Img_tarefa: TImage;
    Edit_tarefa: TEdit;
    Lay_descricao_edit: TLayout;
    Linha_descricao_edit: TLine;
    Label_descricao_edit: TLabel;
    Lay_descricao_container: TLayout;
    Lay_descricao_edit_cont: TLayout;
    Rect_descricao: TRectangle;
    sombra_descrcao_container: TShadowEffect;
    Lay_categoria_edit: TLayout;
    Linha_categoria_edit: TLine;
    Label_categoria_edit: TLabel;
    Lay_categoria_container: TLayout;
    Lay_container_categoria_edit: TLayout;
    Btn_categoria: TRectangle;
    ShadowEffect3: TShadowEffect;
    Img_categoria_btn: TImage;
    Img_categoria_abrir: TImage;
    Label_categoria_btn: TLabel;
    Lay_data_edit: TLayout;
    Linha_data_edit: TLine;
    Label_data_edit: TLabel;
    Ed_descricao: TMemo;
    Estilo_tasks: TStyleBook;
    Lay_data_edit_container: TLayout;
    lay_container_data_edit: TLayout;
    Btn_data: TRectangle;
    ShadowEffect4: TShadowEffect;
    Img_data: TImage;
    img_btn_data_abre: TImage;
    Label_data_btn: TLabel;
    Rect_abrir_categorias: TRectangle;
    ShadowEffect2: TShadowEffect;
    AnimaTelaCategorias: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure Botao_voltarClick(Sender: TObject);
    procedure AnimaStatusFinish(Sender: TObject);
    procedure Btn_Avanca_dataClick(Sender: TObject);
    procedure Btn_Volta_dataClick(Sender: TObject);
    procedure Label_DataClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Btn_statusClick(Sender: TObject);
    procedure Ed_descricaoEnter(Sender: TObject);
    procedure Ed_descricaoExit(Sender: TObject);
    procedure Btn_dataClick(Sender: TObject);
    procedure AnimaTelaCategoriasFinish(Sender: TObject);
    procedure Btn_categoriaClick(Sender: TObject);
  private
    { Private declarations }
    {FKBBounds: TRectF;
    FNeedOffset: Boolean;
    procedure CalcContentBoundsProc(Sender: TObject;
                                    var ContentBounds: TRectF);
    procedure RestorePosition;
    procedure UpdateKBBounds;}
    Fid        : string;
    FTarefa    : string;
    FDescricao : string;
    Fdata      : string;
    Fstatus    : string;
    FCategoria : string;
    Fcat_id    : string;
    Fcat_icon  : string;
    FTipoAcao  : tipo_acao;
    FTelas     : Telas;
    Dialogs     : iViewDialogsFactory;
    Loading     : iViewDialogsFactory;
    FCalendar   : iViewDialogsFactory;
    Procedure Add_tarefa (id, Status, tarefa, descricao: string; categoria: string);
    Procedure ListarTarefas(Data : string);
    Procedure AtualizaListaTarefas(Data : string);
    Procedure AbreTela (Tela : Telas);
  public
    { Public declarations }
    Procedure Acao (Acao : tipo_acao);
  end;

var
  Tela_Tarefas: TTela_Tarefas;

implementation

uses
  //Required units
  FMX.platform,
  FMX.VirtualKeyboard,
  //eTasks - Controller units
  eTasks.Controller.Interfaces,
  eTasks.Controller.Factory,
  //eTasks - Libraries
  eTasks.libraries.Android,
  eTasks.libraries.Imagens64,
  eTasks.libraries,
  eTasks.view.categorias,
  //eTasks - Form de Categorias
  eTasks.View.Android.categories;

{$R *.fmx}

procedure TTela_Tarefas.AbreTela(Tela: Telas);
begin
  FTelas := Tela;
  AnimaTelaCategorias.Start;
end;

procedure TTela_Tarefas.Acao(Acao: tipo_acao);
begin
  FTipoAcao := Acao;
end;

procedure TTela_Tarefas.Add_tarefa(id, Status, tarefa, descricao,
  categoria: string);
Var
 img : TBitmap;
 picture : TImage;
begin
  with ListaTarefas.Items.Add do
  begin
    TListItemText(Objects.FindDrawable('txt_titulo')).Text := tarefa;

    if Status = 'fazer' then
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Afazer.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'fazer';
     end
    else
     begin
      TListItemImage(Objects.FindDrawable('img_status')).Bitmap := Img_Concluido.Bitmap;
      TListItemImage(Objects.FindDrawable('img_status')).TagString := 'concluido';
     end;

    TListItemText(Objects.FindDrawable('txt_description')).Text := descricao;

    img := TImagens64.fromBase64(tcategorias.New.PegaImagem(categoria));
    picture := TImage.Create(nil);
    try
     TListItemImage(Objects.FindDrawable('img_category')).OwnsBitmap := True;
     picture.Bitmap := img;
     TListItemImage(Objects.FindDrawable('img_category')).Bitmap := picture.Bitmap;
     img.disposeof;
    finally
     picture.DisposeOf;
    end;

    TagString := id;
  end;
end;

procedure TTela_Tarefas.AnimaStatusFinish(Sender: TObject);
begin
  if AnimaStatus.Inverse = False then
   begin
    AnimaStatus.Inverse := true;
   end
  else
   begin
    AnimaStatus.Inverse := false;
    ModalResult := mrOk;
   end;
end;

procedure TTela_Tarefas.AnimaTelaCategoriasFinish(Sender: TObject);
begin
  if AnimaTelaCategorias.Inverse = false then
   begin
     AnimaTelaCategorias.Inverse := True;
     case FTelas of
      TelaCategorias : begin
                          if not Assigned(Tela_categorias) then
                            Application.CreateForm(TTela_categorias, Tela_categorias);
                          Tela_Categorias.Acao(taListar);
                          Tela_Categorias.ShowModal(Procedure (ModalResult: TModalResult)
                                                    Begin
                                                     AnimaTelaCategorias.Start;
                                                    End);
                       end;
     end;
   end
  else
   AnimaTelaCategorias.Inverse := False;
end;

procedure TTela_Tarefas.AtualizaListaTarefas(Data: string);
Var
  erro : string;
  Tarefas : iControllerTarefas;
  Loading :  iViewDialogsFactory;
begin
  teTasksLibrary.CustomThread(Procedure()
                              begin
                                Loading := tviewdialogsmessages.New;
                                Tela_tarefas.AddObject(
                                                             Loading.Loading
                                                                      .Mensagem('Buscando tarefas. Aguarde, por favor... ')
                                                                      .AcaoLimpa(Procedure()
                                                                                 begin
                                                                                  Loading := nil;
                                                                                 end)
                                                                      .Exibe
                                                            );
                              end,
                              Procedure ()
                              begin
                                Tarefas := tcontrollerFactory.New.Tarefas.data(data).ListarTarefas(erro);
                              end,
                              Procedure ()
                              Var
                               tarefa : TTarefa;
                              begin
                                loading.Loading.Fechar;
                                listaTarefas.Items.Clear;
                                Lay_Lista_vazia.Visible := False;
                                if Tarefas.ListagemdeTarefas.Count <> 0 then
                                 begin
                                   ListaTarefas.BeginUpdate;
                                   for Tarefa in Tarefas.ListagemdeTarefas.Values do
                                    Add_tarefa(Tarefa.id, Tarefa.status, Tarefa.tarefa, Tarefa.descricao, Tarefa.Cat_icon);
                                   ListaTarefas.EndUpdate;
                                 end
                                else
                                 Lay_Lista_vazia.Visible := True;
                              end);
end;

procedure TTela_Tarefas.Botao_voltarClick(Sender: TObject);
begin
  //ModalResult := mrOk;
  AnimaStatus.Start;
end;

procedure TTela_Tarefas.Btn_Avanca_dataClick(Sender: TObject);
begin
   ListarTarefas(DateToStr(StrToDate(Label_Data.Text) + 1));
end;

procedure TTela_Tarefas.Btn_categoriaClick(Sender: TObject);
begin
  AbreTela(TelaCategorias);
end;

procedure TTela_Tarefas.Btn_dataClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  FCalendar := TViewDialogsMessages.New;
  FData := DateToStr(now);
  Tela_tarefas.AddObject(
                               FCalendar.Calendar
                                            .Data(StrToDate(Fdata))
                                            .AcaoBotao(Procedure ()
                                                       begin
                                                         Fdata := DateToStr(FCalendar.Calendar.Data);
                                                         Label_data_btn.Text := FormatDateTime('dd "de" mmmm "de" yyyy', StrToDate(Fdata));
                                                         FCalendar := nil;
                                                       end)
                                            .AcaoFundo(Procedure ()
                                                       begin
                                                         FCalendar := nil;
                                                       end)
                                            .Exibe);
end;

procedure TTela_Tarefas.Btn_statusClick(Sender: TObject);
begin
  if Btn_status.TagString = 'fazer' then
   begin
     Btn_status.Bitmap    := Img_Concluido.Bitmap;
     Btn_status.TagString := 'concluido';
   end
  else
   begin
     Btn_status.Bitmap    := Img_Afazer.Bitmap;
     Btn_status.TagString := 'fazer';
   end;
end;

procedure TTela_Tarefas.Btn_Volta_dataClick(Sender: TObject);
begin
  ListarTarefas(DateToStr(StrToDate(Label_Data.Text) - 1));
end;

procedure TTela_Tarefas.Ed_descricaoEnter(Sender: TObject);
begin
  if Ed_descricao.Text = 'Digite aqui uma descri��o para a tarefa' then
   begin
     Ed_descricao.Lines.Clear;
     Ed_descricao.FontColor := talphacolors.Black;
   end;
end;

procedure TTela_Tarefas.Ed_descricaoExit(Sender: TObject);
begin
  if Ed_descricao.Text = '' then
   begin
     Ed_descricao.Text := 'Digite aqui uma descri��o para a tarefa';
     Ed_descricao.FontColor := $00686868;
   end;
end;

procedure TTela_Tarefas.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Var
  FService : iFMXVirtualKeyboardService;
begin
   if (Key = vkHardwareBack) then
    begin
      TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
      if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
       begin
         // Bot�o BACK pressionado e teclado v�sivel, apenas fecha o teclado
       end
      else
       begin
         if (Assigned(Dialogs)) or (Assigned(Loading)) or (Assigned(FCalendar)) then
          begin
            Key := 0;
            if Assigned(dialogs) then
             begin
              dialogs.DialogMessages.Fechar;
             end;
            if Assigned(FCalendar) then
             begin
              FCalendar.Calendar.Fechar;
             end;
          end
         else
          begin
           AnimaStatus.Start;
          end;
       end;
    end;
end;

procedure TTela_Tarefas.FormShow(Sender: TObject);
begin
  case FTipoAcao of
    taNovo: begin
              title_MinhasTarefas.Visible := False;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := True;
              TabTarefas.ActiveTab        := TabNovoEditaTarefa;
            end;
    taEditar: begin
              title_MinhasTarefas.Visible := False;
              title_EditaTarefa.Visible   := True;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabNovoEditaTarefa;
              end;
    taExibe: begin
              title_MinhasTarefas.Visible := True;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabExibeTarefa;
              Btn_status.TagString := 'fazer';
             end;
    taLista: begin
              title_MinhasTarefas.Visible := True;
              title_EditaTarefa.Visible   := False;
              title_NovaTarefa.Visible    := False;
              TabTarefas.ActiveTab        := TabListaTarefa;
              ListarTarefas(DateToStr(now));
             end;
  end;
  AnimaStatus.Start;
end;

procedure TTela_Tarefas.Label_DataClick(Sender: TObject);
Var
 FService : IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService));
  if (FService <> Nil) and (TVirtualKeyboardState.Visible in FService.VirtualKeyboardState) then
   begin
    FService.HideVirtualKeyboard;
   end;
  FCalendar := TViewDialogsMessages.New;
  Tela_tarefas.AddObject(
                               FCalendar.Calendar
                                            .Data(StrToDate(Label_Data.Text))
                                            .AcaoBotao(Procedure ()
                                                       begin
                                                         ListarTarefas(DateToStr(FCalendar.Calendar.Data));
                                                         FCalendar := nil;
                                                       end)
                                            .AcaoFundo(Procedure ()
                                                       begin
                                                         FCalendar := nil;
                                                       end)
                                            .Exibe);
end;

procedure TTela_Tarefas.ListarTarefas(Data: string);
begin
  Label_Data.Text := Data;
  AtualizaListaTarefas(data);

end;

end.
