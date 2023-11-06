import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:prova_flutter/shared/widgets/load_indicator.dart';

import 'responsive.dart';
import 'widgets/default_snack_bar.dart';

/// Ajusta o valor tamanho passado para um tamanho
/// proporcinal à largura tela.
///
/// Valor da largura total: mobile: 428, web: 1920.
double wXD(
  double size,
  BuildContext context, {
  double? ws,
  bool mediaWeb = false,
}) {
  if (Responsive.isDesktop(context)) {
    double sSize = ws ?? size;
    if (mediaWeb) {
      return MediaQuery.of(context).size.width / 1920 * sSize;
    } else {
      return sSize;
    }
  }
  return MediaQuery.of(context).size.width / 428 * size;
}

/// Ajusta o valor tamanho passado para um tamanho
/// proporcinal à altura tela.
///
/// Valor da altura total: mobile: 926, web: 1280.
double hXD(double size, BuildContext context) {
  return MediaQuery.of(context).size.height / 926 * size;
}

/// Retorna a altura máxima disponível.
double maxHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Retorna a largura máxima disponível.
double maxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Retorna a largura do objeto já descontando os espaçamentos
double splitWidth(BuildContext context, double splitWidth) {
  return (maxWidth(context) - ((splitWidth + 1) * 10)) / splitWidth;
}

/// Retorna a altura da barra de status.
double viewPaddingTop(context) => MediaQuery.of(context).viewPadding.top;

/// Cria um espaçamento vertical.
Widget vSpace(double val) => SizedBox(height: val);

/// Cria um espaçamento horizontal.
Widget hSpace(double val) => SizedBox(width: val);

/// Indica o tema do dispositivo (Light, Dark).
Brightness brightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

/// Armazena as cores do esquema de cores do tema do flutter.
late ColorScheme colors;

/// Armazena as temas de texto tema do flutter.
late TextTheme styles;

/// Atualiza a variável "colors" a partir do esquema de cores do tema do flutter.
ColorScheme getColors(context) => colors = Theme.of(context).colorScheme;

/// Atualiza os estilos temas de texto a partir do tema do flutter.
TextTheme getStyles(context) => styles = Theme.of(context).textTheme;

SystemUiOverlayStyle getSystemUiOverlayStyle(Color color) {
  // return SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // print("Brightness: ${ThemeData.estimateBrightnessForColor(color)} ");
  return ThemeData.estimateBrightnessForColor(color) == Brightness.light
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        )
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        );
}

/// Exibe uma mensagem para o usuário na parte de baixo do dispositivo
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
        BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar(context, msg));

// class Masks {
//   static MaskTextInputFormatter hourMask =
//       MaskTextInputFormatter(mask: "##:##", filter: {"#": RegExp("[0-9]")});

//   static MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
//       mask: "###.###.###-##", filter: {"#": RegExp("[0-9]")});

//   static MaskTextInputFormatter cnpjMask = MaskTextInputFormatter(
//       mask: "##.###.###/####-##", filter: {"#": RegExp("[0-9]")});
// }

/// Auxilia a navegar à uma página com mais facilidade
dynamic navigate(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

/// Formatador para formato monetário
// final currencyFormatter = NumberFormat("#,##0,00", "pt_BR");

/// Retorna o [OverlayEntry] com o load.
OverlayEntry getLoadEntry() =>
    OverlayEntry(builder: (context) => const LoadIndicator());
