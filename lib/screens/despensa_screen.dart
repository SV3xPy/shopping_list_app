import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/products_database.dart';
import 'package:flutter_application_1/models/productos_model.dart';
import 'package:intl/intl.dart';

class DespensaScreen extends StatefulWidget {
  const DespensaScreen({super.key});

  @override
  State<DespensaScreen> createState() => _DespensaScreenState();
}

class _DespensaScreenState extends State<DespensaScreen> {
  ProductsDatabase? productsDB;
  @override
  void initState() {
    super.initState();
    productsDB = new ProductsDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final conNombre = TextEditingController();
    final txtNombre = TextFormField(
      keyboardType: TextInputType.text,
      controller: conNombre,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );

    final conCantidad = TextEditingController();
    final txtCantidad = TextFormField(
      keyboardType: TextInputType.number,
      controller: conCantidad,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
    final space = SizedBox(
      height: 10,
    );
    final conFecha = TextEditingController();
    final txtFecha = TextFormField(
      controller: conFecha,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            conFecha.text =
                formattedDate; //set foratted date to TextField value.
          });
        }
      },
    );
    final btnAgregar = ElevatedButton.icon(
        onPressed: () {
          productsDB!.INSERTAR({
            "nomProducto": conNombre.text,
            "canProducto": int.parse(conCantidad.text),
            "fechaCaducidad": conFecha.text
          }).then((value) {
            Navigator.pop(context);
            String msg="";
            if (value > 0) {
              msg = "Producto insertado";
              var snackbar = SnackBar(content: Text(msg));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            } else{
              msg = "Ocurrio un error :()";
            }
            var snackbar = SnackBar(content: Text(msg));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          });
        },
        icon: Icon(Icons.save),
        label: Text('Guardar'));
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi depsensa :)'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        txtNombre,
                        space,
                        txtCantidad,
                        space,
                        txtFecha,
                        space,
                        btnAgregar,
                      ],
                    );
                  });
            },
            icon: Icon(Icons.store_rounded),
          )
        ],
      ),
      body: FutureBuilder(
        future: productsDB!.CONSULTAR(),
        builder: (context, AsyncSnapshot<List<ProductosModel>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something was wrong! :()'),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return itemDespensa(snapshot.data![index]);
              },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
  Widget itemDespensa(ProductosModel producto){
    return Container(
      height: 100,
      child: Column(
        children: [
          Text('${producto.nomProducto!}'),
          Text('${producto.fechaCaducidad!}'),
        ]),
    );
  }
}
