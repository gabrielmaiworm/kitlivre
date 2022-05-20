import 'package:flutter/services.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../inicio_master/inicio_master_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validadores/Validador.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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

// var nascimento = new MaskTextInputFormatter(
//     mask: '##/##/####',
//     filter: {"#": RegExp(r'[0-9]')},
//     type: MaskAutoCompletionType.lazy);

class CadastroOperadorWidget extends StatefulWidget {
  const CadastroOperadorWidget({Key key}) : super(key: key);

  @override
  _CadastroOperadorWidgetState createState() => _CadastroOperadorWidgetState();
}

class _CadastroOperadorWidgetState extends State<CadastroOperadorWidget> {
  TextEditingController campoCepOperadorController;
  String resultadoLogradouro;
  String resultadoBairro;
  String resultadoCidade;
  String resultadoComplemento;
  String resultadoEstado;

  _consultaCep() async {
    // Pegando o cep digitado no campo de texto
    String cep = campoCepOperadorController.text;

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

      campoBairroOperadorController.text = resultadoBairro;
      campoLogradouroOperadorController.text = resultadoLogradouro;
      campoCidadeOperadorController.text = resultadoCidade;
      campoComplementoOperadorController.text = resultadoComplemento;
      dropDownEstadoOperadorValue = resultadoEstado;
    });
  }

  String dropDownAreaEmpresaValue;
  String dropDownEstadoOperadorValue;
  TextEditingController campoConfirmSenhaOperadorController;
  bool campoConfirmSenhaOperadorVisibility;
  TextEditingController campoCpfController;
  TextEditingController campoNomeOperadorController;
  TextEditingController campoSobrenomeOperadorController;
  TextEditingController campoEmailOperadorController;
  TextEditingController campoTelefoneController;
  TextEditingController campoSenhaOperadorController;
  bool campoSenhaOperadorVisibility;
  TextEditingController campoCidadeOperadorController;
  TextEditingController campoBairroOperadorController;
  TextEditingController campoLogradouroOperadorController;
  TextEditingController campoNumeroOperadorController;
  TextEditingController campoComplementoOperadorController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    campoBairroOperadorController = TextEditingController();
    campoCepOperadorController = TextEditingController();
    campoConfirmSenhaOperadorController = TextEditingController();
    campoConfirmSenhaOperadorVisibility = false;
    campoCpfController = TextEditingController();
    campoNomeOperadorController = TextEditingController();
    campoSobrenomeOperadorController = TextEditingController();
    campoEmailOperadorController = TextEditingController();
    campoTelefoneController = TextEditingController();
    campoSenhaOperadorController = TextEditingController();
    campoSenhaOperadorVisibility = false;
    campoCidadeOperadorController = TextEditingController();
    campoLogradouroOperadorController = TextEditingController();
    campoNumeroOperadorController = TextEditingController();
    campoComplementoOperadorController = TextEditingController();
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
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 20, 0),
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
                                  'Cadastro do Operador',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 50, 20, 0),
                                child: TextFormField(
                                  controller: campoNomeOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoNomeOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nome do funcionário',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo nome';
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
                                  controller: campoSobrenomeOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoSobrenomeOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Sobrenome',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo sobrenome';
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
                                  controller: campoEmailOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoEmailOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'E-mail',
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
                                            20, 0, 0, 0),
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
                                      return 'Field is required';
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
                                  controller: campoTelefoneController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoTelefoneController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Telefone',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo telefone';
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
                                  controller: campoSenhaOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoSenhaOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: !campoSenhaOperadorVisibility,
                                  decoration: InputDecoration(
                                    labelText: '        Senha',
                                    hintText: 'Senha',
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
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => campoSenhaOperadorVisibility =
                                            !campoSenhaOperadorVisibility,
                                      ),
                                      child: Icon(
                                        campoSenhaOperadorVisibility
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
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha o campo senha';
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
                                  controller:
                                      campoConfirmSenhaOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoConfirmSenhaOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText:
                                      !campoConfirmSenhaOperadorVisibility,
                                  decoration: InputDecoration(
                                    labelText: '        Confirmar Senha',
                                    hintText: ' Confirmar Senha',
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
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => campoConfirmSenhaOperadorVisibility =
                                            !campoConfirmSenhaOperadorVisibility,
                                      ),
                                      child: Icon(
                                        campoConfirmSenhaOperadorVisibility
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
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha o campo confirmar senha';
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
                                  controller: campoCepOperadorController,
                                  onChanged: (campoCepController) {
                                    if (campoCepController.length >= 8) {
                                      _consultaCep();
                                    }
                                  },
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'CEP',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Preencha o campo CEP';
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
                                    () => dropDownEstadoOperadorValue = val),
                                width: 200,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF0F0F0F),
                                      fontSize: 12,
                                    ),
                                hintText: ' Estado',
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
                                  controller: campoCidadeOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoCidadeOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Cidade',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo cidade';
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
                                  controller: campoBairroOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoBairroOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Bairro',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo bairro';
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
                                  controller: campoLogradouroOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoLogradouroOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Logradouro',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo logradouro';
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
                                  controller: campoNumeroOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoNumeroOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo número';
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
                                  controller:
                                      campoComplementoOperadorController,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    'campoComplementoOperadorController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Complemento',
                                    hintText: '    ',
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
                                            20, 0, 0, 0),
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
                                      return 'Preencha o campo complemento';
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: FlutterFlowDropDown(
                                  options: [
                                    'Administrador',
                                    'Equipe técnica presencial',
                                    'Equipe técnica remota',
                                    'Equipe de logística'
                                  ].toList(),
                                  onChanged: (val) => setState(
                                      () => dropDownAreaEmpresaValue = val),
                                  width: 180,
                                  height: 50,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                  hintText: 'Área da empresa',
                                  fillColor: Color(0xFFE0E3E7),
                                  elevation: 2,
                                  borderColor: Color(0xFF042D6A),
                                  borderWidth: 1,
                                  borderRadius: 20,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Row(
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

                                    if (dropDownEstadoOperadorValue == null) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Estado'),
                                            content:
                                                Text('Preencha o campo estado'),
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
                                    if (dropDownAreaEmpresaValue == null) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Área da empresa'),
                                            content: Text(
                                                'Preencha o campo área da empresa'),
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

                                    await POSTfuncionarioCall.call(
                                      nome: campoNomeOperadorController.text,
                                      email: campoEmailOperadorController.text,
                                      documento: campoCpfController.text,
                                      cep: campoCepOperadorController.text,
                                      logradouro:
                                          campoLogradouroOperadorController
                                              .text,
                                      numero:
                                          campoNumeroOperadorController.text,
                                      complemento:
                                          campoComplementoOperadorController
                                              .text,
                                      bairro:
                                          campoBairroOperadorController.text,
                                      cidade:
                                          campoCidadeOperadorController.text,
                                      estado: dropDownEstadoOperadorValue,
                                      nivel: 2,
                                      senha: campoSenhaOperadorController.text,
                                      telefone: campoTelefoneController.text,
                                      sobrenome:
                                          campoSobrenomeOperadorController.text,
                                    );
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Cadastro'),
                                          content: Text(
                                              'Operador cadastrado com sucesso!'),
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
                                        child: InicioMasterWidget(),
                                      ),
                                    );
                                  },
                                  text: 'Cadastrar Operador',
                                  options: FFButtonOptions(
                                    width: 200,
                                    height: 40,
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
                                    borderRadius: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
