import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
        1,
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "O Widget Card no Flutter é uma ferramenta versátil para a criação de elementos de interface visualmente atraentes e organizados. Ele oferece uma maneira eficaz de agrupar informações e adicionar sombras, bordas e estilos personalizados aos seus componentes, tornando o design de aplicativos mais elegante e funcional...");
  }
}
