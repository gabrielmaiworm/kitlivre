import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GETUsuariosCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GETUsuarios',
      apiUrl: 'http://177.70.102.109:3005/usuario',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class POSTUsuarioCall {
  static Future<ApiCallResponse> call({
    String nome = '',
    String email = '',
    String documento = '',
    String dataDeNascicmento = '',
    String situacaoLesao = '',
    String detalheLesao = '',
    String nivelLesao = '',
    String fotoDocumento = '',
    String fotoComDocumento = '',
    String senha = '',
    String sobrenome = '',
    String cep = '',
    String logradouro = '',
    String numero = '',
    String complemento = '',
    String bairro = '',
    String cidade = '',
    String estado = '',
    String telefone = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "sobrenome": "${sobrenome}",
  "email": "${email}",
  "data_de_nascicmento": "${dataDeNascicmento}",
  "documento": "${documento}",
  "senha": "${senha}",
  "cep": "${cep}",
  "logradouro": "${logradouro}",
  "numero": "${numero}",
  "complemento": "${complemento}",
  "bairro": "${bairro}",
  "cidade": "${cidade}",
  "estado": "${estado}",
  "situacao_lesao": "${situacaoLesao}",
  "nivel_lesao": "${nivelLesao}",
  "detalhe_lesao": "${detalheLesao}",
  "telefone": "${telefone}",
  "foto_documento": "${fotoDocumento}",
  "foto_com_documento": "${fotoComDocumento}"
 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTUsuario',
      apiUrl: 'http://177.70.102.109:3005/usuario',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'nome': nome,
        'email': email,
        'documento': documento,
        'data_de_nascicmento': dataDeNascicmento,
        'situacao_lesao': situacaoLesao,
        'detalhe_lesao': detalheLesao,
        'nivel_lesao': nivelLesao,
        'foto_documento': fotoDocumento,
        'foto_com_documento': fotoComDocumento,
        'senha': senha,
        'sobrenome': sobrenome,
        'cep': cep,
        'logradouro': logradouro,
        'numero': numero,
        'complemento': complemento,
        'bairro': bairro,
        'cidade': cidade,
        'estado': estado,
        'telefone': telefone,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GETequipamentosCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GETequipamentos',
      apiUrl: 'http://177.70.102.109:3005/equipamento',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class POSTequipamentosCall {
  static Future<ApiCallResponse> call({
    String nome = '',
    String equipamentoStatus = '',
    String numeroSerieEquipamento = '',
    String foto = '',
  }) {
    final body = '''
{
  "nome": "${nome}",
  "equipamento_status": "${equipamentoStatus}",
  "numero_serie_equipamento": "${numeroSerieEquipamento}",
  "foto":"${foto}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTequipamentos',
      apiUrl: 'http://177.70.102.109:3005/equipamento',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'nome': nome,
        'equipamento_status': equipamentoStatus,
        'numero_serie_equipamento': numeroSerieEquipamento,
        'foto': foto,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class POSTbateriaCall {
  static Future<ApiCallResponse> call({
    String numeroSerieBateria = '',
    String bateriaStatus = '',
    String carga = '',
  }) {
    final body = '''
{
  "numero_serie_bateria": "${numeroSerieBateria}",
  "bateria_status": "${bateriaStatus}",
  "carga": "${carga}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTbateria',
      apiUrl: 'http://177.70.102.109:3005/bateria',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'numero_serie_bateria': numeroSerieBateria,
        'bateria_status': bateriaStatus,
        'carga': carga,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TesteCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'teste',
      apiUrl:
          'https://collectionapi.metmuseum.org/public/collection/v1/departments',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String email = '',
    String senha = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'http://177.70.102.109:3005/autenticacao',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic',
      },
      params: {
        'email': email,
        'senha': senha,
      },
      returnBody: true,
    );
  }
}

class CepCall {
  static Future<ApiCallResponse> call({
    String cep = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CEP',
      apiUrl: 'https://viacep.com.br/ws/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'cep': cep,
      },
      returnBody: true,
    );
  }
}

class GETParceiroCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GETParceiro',
      apiUrl: 'http://177.70.102.109:3005/parceiro',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class POSTParceiroCall {
  static Future<ApiCallResponse> call({
    String nomeFantasia = '',
    String nome = '',
    String razaoSocial = '',
    String email = '',
    String inscricaoEstadual = '',
    String tipoDeServico = '',
    String telefone = '',
    String telefoneUsuario = '',
    String dataDeNascimento = '',
    String cnpj = '',
    String documento = '',
    String cep = '',
    String logradouro = '',
    String numero = '',
    String complemento = '',
    String bairro = '',
    String cidade = '',
    String estado = '',
    String fotoDocumento = '',
    String fotoComDocumento = '',
    String fotoReconhecimento = '',
    int nivel,
    String senha = '',
    String agencia = '',
    String nConta = '',
    String banco = '',
    String tipo = '',
    String emailPrincipal = '',
    String sobrenome = '',
    String foto = '',
  }) {
    final body = '''
{
  "nome_fantasia": "${nomeFantasia}",
  "nome": "${nome}",
  "razao_social": "${razaoSocial}",
  "email": "${email}",
  "foto": "${foto}",
  "inscricao_estadual": "${inscricaoEstadual}",
  "tipo_de_servico": "${tipoDeServico}",
  "telefone": "${telefone}",
  "telefone_usuario": "${telefoneUsuario}",
  "data_de_nascicmento": "${dataDeNascimento}",
  "cnpj": "${cnpj}",
  "documento": "${documento}",
  "cep": "${cep}",
  "logradouro": "${logradouro}",
  "numero": "${numero}",
  "complemento": "${complemento}",
  "bairro": "${bairro}",
  "cidade": "${cidade}",
  "estado": "${estado}",
  "foto_documento": "${fotoDocumento}",
  "foto_com_documento": "${fotoComDocumento}",
  "foto_reconhecimento": "${fotoReconhecimento}",
  "nivel": ${nivel},
  "senha": "${senha}",
  "agencia": "${agencia}",
  "n_conta": "${nConta}",
  "banco": "${banco}",
  "tipo": "${tipo}",
  "email_principal": "${emailPrincipal}",
  "sobrenome": "${sobrenome}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTParceiro',
      apiUrl: 'http://177.70.102.109:3005/parceiro',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'nome_fantasia': nomeFantasia,
        'nome': nome,
        'razao_social': razaoSocial,
        'email': email,
        'inscricao_estadual': inscricaoEstadual,
        'tipo_de_servico': tipoDeServico,
        'telefone': telefone,
        'telefone_usuario': telefoneUsuario,
        'data_de_nascimento': dataDeNascimento,
        'cnpj': cnpj,
        'documento': documento,
        'cep': cep,
        'logradouro': logradouro,
        'numero': numero,
        'complemento': complemento,
        'bairro': bairro,
        'cidade': cidade,
        'estado': estado,
        'foto_documento': fotoDocumento,
        'foto_com_documento': fotoComDocumento,
        'foto_reconhecimento': fotoReconhecimento,
        'nivel': nivel,
        'senha': senha,
        'agencia': agencia,
        'n_conta': nConta,
        'banco': banco,
        'tipo': tipo,
        'email_principal': emailPrincipal,
        'sobrenome': sobrenome,
        'foto': foto,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class POSTfuncionarioCall {
  static Future<ApiCallResponse> call({
    String nome = '',
    String email = '',
    String documento = '',
    String cep = '',
    String logradouro = '',
    String numero = '',
    String complemento = '',
    String bairro = '',
    String cidade = '',
    String estado = '',
    int nivel,
    String senha = '',
    String telefone = '',
    String sobrenome = '',
  }) {
    final body = '''
{
        "nome": "${nome}",
        "email": "${email}",
        "documento": "${documento}",
        "cep": "${cep}",
        "logradouro": "${logradouro}",
        "numero": "${numero}",
        "complemento": "${complemento}",
        "bairro": "${bairro}",
        "cidade": "${cidade}",
        "estado": "${estado}",     
        "nivel": "${nivel}",
        "senha": "${senha}",
        "telefone": "${telefone}",
        "sobrenome": "${sobrenome}"
    }''';
    return ApiManager.instance.makeApiCall(
      callName: 'POSTfuncionario',
      apiUrl: 'http://177.70.102.109:3005/funcionario',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'nome': nome,
        'email': email,
        'documento': documento,
        'cep': cep,
        'logradouro': logradouro,
        'numero': numero,
        'complemento': complemento,
        'bairro': bairro,
        'cidade': cidade,
        'estado': estado,
        'nivel': nivel,
        'senha': senha,
        'telefone': telefone,
        'sobrenome': sobrenome,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
