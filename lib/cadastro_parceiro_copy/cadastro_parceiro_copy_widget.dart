import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../backend/api_requests/api_calls.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login/login_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:validadores/Validador.dart';

var telefone = new MaskTextInputFormatter(
    mask: '(##)#####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var CPF = new MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var CEP = new MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

var nascimento = new MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class CadastroParceiroWidget extends StatefulWidget {
  const CadastroParceiroWidget({Key key}) : super(key: key);

  @override
  _CadastroParceiroWidgetState createState() => _CadastroParceiroWidgetState();
}

class _CadastroParceiroWidgetState extends State<CadastroParceiroWidget> {
  TextEditingController campoCepController;
  String resultadoLogradouro;
  String resultadoBairro;
  String resultadoCidade;
  String resultadoComplemento;
  String resultadoEstado;

  _consultaCep() async {
    // Pegando o cep digitado no campo de texto
    String cep = campoCepController.text;

    // Configurando a url
    String url = "http://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      String logradouro = retorno["logradouro"];
      String bairro = retorno["bairro"];
      String cidade = retorno["localidade"];
      String complemento = retorno["complemento"];
      String estado = retorno["uf"];

      resultadoLogradouro = "${logradouro}";
      resultadoBairro = "${bairro}";
      resultadoCidade = "${cidade}";
      resultadoComplemento = "${complemento}";
      resultadoEstado = "${estado}";

      campoBairroController.text = resultadoBairro;
      campoLogradouroController.text = resultadoLogradouro;
      campoCdadeController.text = resultadoCidade;
      campoComplementoController.text = resultadoComplemento;
      dropDownEstadoUsuarioValue = resultadoEstado;
    });
  }

  String uploadedFileUrl = '';
  String dropDownBancoValue;
  TextEditingController campoCnpjController;
  TextEditingController campoInscriocaoEstadualController;
  TextEditingController campoTipoServicoController;
  TextEditingController campoTelefoneParceiroController;
  TextEditingController campoRazaoController;
  TextEditingController campoNomeFantasiaController;
  TextEditingController campoEmailParceiroController;
  TextEditingController campoAgenciaController;
  TextEditingController campoContaController;
  String dropDownTipoValue;

  TextEditingController campoLogradouroController;
  TextEditingController campoNumeroController;
  TextEditingController campoComplementoController;
  TextEditingController campoBairroController;
  TextEditingController campoCdadeController;
  String dropDownEstadoUsuarioValue;
  TextEditingController campoNomeGestorController;
  TextEditingController campoSobrenomeController;
  TextEditingController campoCpfController;
  TextEditingController campoEmailGestorController;
  TextEditingController campoCelularController;
  TextEditingController campoSenhaUsuarioController;
  bool campoSenhaUsuarioVisibility;
  TextEditingController campoConfsenhaUsuarioController;
  bool campoConfsenhaUsuarioVisibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    campoAgenciaController = TextEditingController();
    campoCnpjController = TextEditingController();
    campoInscriocaoEstadualController = TextEditingController();
    campoTipoServicoController = TextEditingController();
    campoTelefoneParceiroController = TextEditingController();
    campoRazaoController = TextEditingController();
    campoNomeFantasiaController = TextEditingController();
    campoEmailParceiroController = TextEditingController();
    campoContaController = TextEditingController();
    campoCepController = TextEditingController();
    campoLogradouroController = TextEditingController();
    campoNumeroController = TextEditingController();
    campoComplementoController = TextEditingController();
    campoBairroController = TextEditingController();
    campoCdadeController = TextEditingController();
    campoNomeGestorController = TextEditingController();
    campoSobrenomeController = TextEditingController();
    campoCpfController = TextEditingController();
    campoEmailGestorController = TextEditingController();
    campoCelularController = TextEditingController();
    campoSenhaUsuarioController = TextEditingController();
    campoSenhaUsuarioVisibility = false;
    campoConfsenhaUsuarioController = TextEditingController();
    campoConfsenhaUsuarioVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                constraints: BoxConstraints(
                  maxWidth: 800,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.chevron_left,
                                    size: 25,
                                  ),
                                  options: FFButtonOptions(
                                    width: 50,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: 100,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Text(
                                  'Cadastro do Parceiro',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF030335),
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Text(
                                  'Dados da Empresa',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 14,
                                  controller: campoCnpjController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoCnpjController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'CNPJ',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha ';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 9,
                                  controller: campoInscriocaoEstadualController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoInscriocaoEstadualController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ' Inscrição estadual',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha o campo Inscrição estadual';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoTipoServicoController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoTipoServicoController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Tipo de serviço',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  textAlign: TextAlign.start,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha um tipo de serviço';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 14,
                                  controller: campoTelefoneParceiroController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoTelefoneParceiroController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ' Telefone',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    telefone
                                  ],
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Informe um telefone valido';
                                    }
                                    if (val.length < 8) {
                                      return 'Requires at least 8 characters.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoRazaoController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoRazaoController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   Razão Social',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha o campo razão social';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoNomeFantasiaController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoNomeFantasiaController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   Nome Fantasia',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Informe nome fantasia';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoEmailParceiroController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoEmailParceiroController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   E-mail',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Informe um email';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Text(
                                  'Dados bancários',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowDropDown(
                                options: [
                                  'Banco do Brasil',
                                  'Caixa',
                                  'Santander',
                                  'Itaú',
                                  'Bradesco',
                                  'Nubank'
                                ].toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownBancoValue = val),
                                width: 200,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 12,
                                    ),
                                hintText: 'Banco',
                                fillColor: Color(0xFFE0E3E7),
                                elevation: 2,
                                borderColor: Color(0xFF042D6A),
                                borderWidth: 1,
                                borderRadius: 20,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 4, 20, 4),
                                hidesUnderline: true,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoAgenciaController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoAgenciaController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   Agência',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Insira uma agência';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoContaController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoContaController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   Número da conta',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Insira uma conta';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowDropDown(
                                options: ['Corrente', 'Poupança', 'Salário']
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownTipoValue = val),
                                width: 200,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 12,
                                    ),
                                hintText: 'Tipo',
                                fillColor: Color(0xFFE0E3E7),
                                elevation: 2,
                                borderColor: Color(0xFF042D6A),
                                borderWidth: 1,
                                borderRadius: 20,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 4, 20, 4),
                                hidesUnderline: true,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Text(
                                  'Endereço',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 9,
                                  controller: campoCepController,
                                  onChanged: (campoCepController) {
                                    if (campoCepController.length >= 8) {
                                      _consultaCep();
                                    }
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'CEP',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    CEP
                                  ],
                                  keyboardType: TextInputType.number,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Insira um cep *apenas números';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoLogradouroController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoLogradouroController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Logradouro',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoNumeroController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoNumeroController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Informe um númer';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoComplementoController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoComplementoController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Complemento',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoBairroController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoBairroController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Bairro',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoCdadeController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoCdadeController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Cidade',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowDropDown(
                                options: [
                                  'AC',
                                  'AL',
                                  'AP',
                                  'AM',
                                  'BA',
                                  'CE',
                                  'DF',
                                  'ES',
                                  'GO',
                                  'MA',
                                  'MT',
                                  'MS',
                                  'MG',
                                  'PR',
                                  'PB',
                                  'PA',
                                  'PE',
                                  'PI',
                                  'RN',
                                  'RS',
                                  'RJ',
                                  'RO',
                                  'RR',
                                  'SC',
                                  'SE',
                                  'SP',
                                  'TO'
                                ].toList(),
                                onChanged: (val) => setState(
                                    () => dropDownEstadoUsuarioValue = val),
                                width: 200,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 12,
                                    ),
                                hintText: 'Estado',
                                fillColor: Color(0xFFE0E3E7),
                                elevation: 2,
                                borderColor: Color(0xFF042D6A),
                                borderWidth: 1,
                                borderRadius: 20,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 4, 20, 4),
                                hidesUnderline: true,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              showUploadMessage(
                                context,
                                'Carregando...',
                                showLoading: true,
                              );
                              final downloadUrls = (await Future.wait(
                                      selectedMedia.map((m) async =>
                                          await uploadData(
                                              m.storagePath, m.bytes))))
                                  .where((u) => u != null)
                                  .toList();
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrls != null &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(
                                    () => uploadedFileUrl = downloadUrls.first);
                                showUploadMessage(
                                  context,
                                  'Sucesso!',
                                );
                              } else {
                                showUploadMessage(
                                  context,
                                  'Carregamento falhou',
                                );
                                return;
                              }
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: Image.network(
                                    uploadedFileUrl,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Anexar logo do parceiro',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Text(
                                  'Gestor da conta',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoNomeGestorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoNomeGestorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoSobrenomeController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoSobrenomeController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Sobrenome',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 14,
                                  validator: (value) {
                                    // Aqui entram as validações
                                    return Validador()
                                        .add(Validar.CPF, msg: 'CPF Inválido')
                                        .add(Validar.OBRIGATORIO,
                                            msg: 'Campo obrigatório')
                                        .minLength(11)
                                        .maxLength(11)
                                        .valido(value, clearNoNumber: true);
                                  },
                                  controller: campoCpfController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoDocUsuarioController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   CPF',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    CPF
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoEmailGestorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoEmailGestorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    hintText: '  ',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  maxLength: 14,
                                  controller: campoCelularController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoTelefoneUsuarioController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '   Telefone Celular',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    telefone
                                  ],
                                  textAlign: TextAlign.start,
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencher campo telefone ';
                                    }
                                    if (val.length < 1) {
                                      return 'Requires at least 1 characters.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: TextFormField(
                                  controller: campoSenhaUsuarioController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoSenhaUsuarioController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: !campoSenhaUsuarioVisibility,
                                  decoration: InputDecoration(
                                    labelText: '  Senha',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => campoSenhaUsuarioVisibility =
                                            !campoSenhaUsuarioVisibility,
                                      ),
                                      child: Icon(
                                        campoSenhaUsuarioVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: TextFormField(
                                  controller: campoConfsenhaUsuarioController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoConfsenhaUsuarioController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: !campoConfsenhaUsuarioVisibility,
                                  decoration: InputDecoration(
                                    labelText: '  Confirmar Senha',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF04044E),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).lineColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 10),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => campoConfsenhaUsuarioVisibility =
                                            !campoConfsenhaUsuarioVisibility,
                                      ),
                                      child: Icon(
                                        campoConfsenhaUsuarioVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0F0F0F),
                                        fontSize: 12,
                                      ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 20, 20),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (formKey.currentState == null ||
                                      !formKey.currentState.validate()) {
                                    return;
                                  }

                                  if (dropDownBancoValue == null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Atenção'),
                                          content: Text('Escolha uma opção'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }

                                  await POSTParceiroCall.call(
                                    nomeFantasia:
                                        campoNomeFantasiaController.text,
                                    nome: campoNomeGestorController.text,
                                    razaoSocial: campoRazaoController.text,
                                    email: campoEmailGestorController.text,
                                    inscricaoEstadual:
                                        campoInscriocaoEstadualController.text,
                                    tipoDeServico:
                                        campoTipoServicoController.text,
                                    telefone:
                                        campoTelefoneParceiroController.text,
                                    telefoneUsuario:
                                        campoCelularController.text,
                                    cnpj: campoCnpjController.text,
                                    documento: campoCpfController.text,
                                    cep: campoCepController.text,
                                    logradouro: campoLogradouroController.text,
                                    numero: campoNumeroController.text,
                                    complemento:
                                        campoComplementoController.text,
                                    bairro: campoBairroController.text,
                                    cidade: campoCdadeController.text,
                                    estado: dropDownEstadoUsuarioValue,
                                    nivel: 2,
                                    senha: campoSenhaUsuarioController.text,
                                    agencia: campoAgenciaController.text,
                                    nConta: campoContaController.text,
                                    banco: dropDownBancoValue,
                                    tipo: dropDownTipoValue,
                                    emailPrincipal:
                                        campoEmailParceiroController.text,
                                    sobrenome: campoSobrenomeController.text,
                                    foto: uploadedFileUrl,
                                  );
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Cadastro'),
                                        content: Text(
                                            'Parceiro foi cadastrado com sucesso!!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 300),
                                      reverseDuration:
                                          Duration(milliseconds: 300),
                                      child: LoginWidget(),
                                    ),
                                  );
                                },
                                text: 'Cadastrar Parceiro',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
