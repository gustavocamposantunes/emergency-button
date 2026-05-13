// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emergency_button/app.dart';
import 'package:emergency_button/contacts/contacts_page.dart';
import 'package:emergency_button/history/history_page.dart';

void main() {
  testWidgets('exibe a tela inicial', (WidgetTester tester) async {
    await tester.pumpWidget(const EmergencyButtonApp());

    expect(find.text('Guardian SOS'), findsOneWidget);
    expect(find.text('MODO DE EMERGÊNCIA\nATIVO'), findsOneWidget);
    expect(find.text('Enviando alerta em 3s...'), findsOneWidget);
    expect(find.text('CANCELAR ALERTA'), findsOneWidget);
    expect(find.text('Sua Localização Atual'), findsOneWidget);
    expect(find.text('Alerta'), findsOneWidget);
  });

  testWidgets('abre a tela de contatos', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContactsPage()));

    expect(find.text('Contatos de Emergência'), findsOneWidget);
    expect(find.text('Adicionar Contato'), findsOneWidget);
    expect(find.text('Jane Doe'), findsOneWidget);
    expect(find.text('Contatos'), findsOneWidget);
  });

  testWidgets('abre o histórico de alertas', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HistoryPage()));

    expect(find.text('Histórico de Alertas'), findsOneWidget);
    expect(find.text('Registros detalhados das suas ativações de emergência recentes.'), findsOneWidget);
    expect(find.text('24 OUT, 2023'), findsOneWidget);
    expect(find.text('Ver no mapa'), findsAtLeastNWidgets(2));
  });
}
