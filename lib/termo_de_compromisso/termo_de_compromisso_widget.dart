import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TermoDeCompromissoWidget extends StatefulWidget {
  const TermoDeCompromissoWidget({Key key}) : super(key: key);

  @override
  _TermoDeCompromissoWidgetState createState() =>
      _TermoDeCompromissoWidgetState();
}

class _TermoDeCompromissoWidgetState extends State<TermoDeCompromissoWidget> {
  List<String> checkboxGroupValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Image.asset(
                            'assets/images/logo-livre-azul-escuro.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Text(
                            'Código: PES.10.2.024\nRevisão: 01\nData: 23/03/2019',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF323045),
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 8,
                          maxHeight: MediaQuery.of(context).size.height * 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 30, 0, 0),
                              child: Text(
                                'TERMO DE RESPONSABILIDADE DE USO DE EQUIPAMENTO MOTORIZADO ELÉTRICO E AUTORIZAÇÃO PARA USO  DE IMAGEM E VOZ',
                                textAlign: TextAlign.center,
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      spacing: 0,
                                      runSpacing: 0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Text(
                                          'Pelo presente instrumento, eu ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        AuthUserStreamWidget(
                                          child: Text(
                                            valueOrDefault<String>(
                                              currentUserDisplayName,
                                              'NOME',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                        Text(
                                          ' , portador do CPF ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          'NUMEROCPF',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          ', residente em ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        Text(
                                          'LOGRADOURO',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ],
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
                                          5, 0, 0, 0),
                                      child: Text(
                                        'Pelo presente instrumento, eu  declaro que recebi os treinamentos básicos para o uso seguro do equipamento de mobilidade elétrica disponibilizado pela Livre – Montagem de Produtos Assistivos, de modo que estou ciente que é responsabilidade do usuário seguir todas as normas de utilização do produto indicadas pelo instrutor. A utilização dentro das normas proporcionará a segurança do usuário e/ou terceiros e principalmente evitar possíveis acidentes.                               \n\nA Livre – Montagem de Produtos Assistivos esclarece que se isenta de qualquer responsabilidade ocasionada pelo uso e/ou manuseio do KIT LIVRE® pelo usuário e/ou terceiros na qual gere qualquer dano a cadeira de rodas e/ou possíveis acidentes aos mesmos durante sua utilização. Recomenda-se ainda a utilização do equipamento seguindo todas as normas estabelecidas no MANUAL DO USUÁRIO que está à disposição para a sua consulta, de modo a garantir a máxima segurança de todos.\n\nÉ responsabilidade do usuário do KIT LIVRE® seguir todas as normas existentes no MANUAL DO USUÁRIO, e ainda:\n\na - Seguir as normas de segurança conforme descrito no MANUAL DO USUÁRIO;\n\nb - Respeitar o limite de peso e velocidade para utilização do equipamento;\n\nc - Utilizar equipamento de segurança, tal como, capacete de ciclista;\n\nd -Transitar somente em áreas de circulação de pedestres, ciclovias e ciclo faixas, sendo a velocidade máxima permitida de 6 km/h em áreas de circulação de pedestres, bem como de 20 km/h em ciclovias e ciclo faixas, conforme estabelece a Resolução nº465/13 do Conselho Nacional de Trânsito - CONTRAN.\n\nDe mesmo modo, autorizo a LIVRE® MONTAGEM DE PRODUTOS ASSISTIVOS, CNPJ: 20.654.934/0001-54, a utilizar minha imagem e voz registradas na utilização dos produtos por ela produzidos/fornecidos, que será distribuído em veículos de comunicação como transmissão por Televisão, TV por assinatura, TV a cabo, Vídeo, Home Vídeo, Cinema, Internet, CD-ROM, DVD, em exibições públicas e/ou privadas, no Brasil e no exterior, bem como para fins de divulgação do mesmo através de outdoors, jornais, revistas, panfletos, rádios e comerciais para tv. Em decorrência desta autorização não haverá qualquer contrapartida econômica, financeira ou obrigacional mas, caso seja estabelecido, esta será objeto de contrato específico.',
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
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
                                          0, 20, 0, 0),
                                      child: FlutterFlowCheckboxGroup(
                                        initiallySelected:
                                            checkboxGroupValues != null
                                                ? checkboxGroupValues
                                                : [],
                                        options: [
                                          'Li e concordo com o Termo de Responsabilidade e Imagem'
                                        ].toList(),
                                        onChanged: (val) => setState(
                                            () => checkboxGroupValues = val),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        checkColor: Colors.white,
                                        checkboxBorderColor: Color(0xFF95A1AC),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 11,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 300),
                                            reverseDuration:
                                                Duration(milliseconds: 300),
                                            child: LoginWidget(),
                                          ),
                                        );
                                      },
                                      text: 'Concluir',
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
                            ],
                          ),
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
    );
  }
}
