import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GasolinaVsAlcool(),
  ));
}

class GasolinaVsAlcool extends StatefulWidget {
  const GasolinaVsAlcool({super.key});

  @override
  State<GasolinaVsAlcool> createState() => _GasolinaVsAlcoolState();
}

class _GasolinaVsAlcoolState extends State<GasolinaVsAlcool> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();
  String _resultado = "Resultado: 0.0";

  void _calcular() {
    final double? valorAlcool = double.tryParse(_alcoolController.text);
    final double? valorGasolina = double.tryParse(_gasolinaController.text);

    if (valorAlcool == null || valorGasolina == null) {
      setState(() {
        _resultado = "Valores inválidos!";
      });
      return;
    }

    final double proporcao = (valorAlcool / valorGasolina) * 100;

    setState(() {
      _resultado =
          proporcao <= 70 ? "Abasteça com Álcool" : "Abasteça com Gasolina";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasolina x Álcool'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/6352/6352837.png',
              height: 150,
            ),
            const SizedBox(height: 16.0),
            // Campo para valor da gasolina
            TextField(
              controller: _gasolinaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor da gasolina',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Campo para valor do álcool
            TextField(
              controller: _alcoolController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor do álcool',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            // Botão Calcular
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 16.0),
            // Resultado
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
