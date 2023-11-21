import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gd_api_1407/client/barang_client.dart';
import 'package:gd_api_1407/entity/barang.dart';
import 'package:gd_api_1407/pages/edit_barang.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  // Provider to collect list data from API
  final listBarangProvider = FutureProvider<List<Barang>>((ref) async {
    return await BarangClient.fetchAll();
  });

  // Action when floating button pressed
  void onAdd(context, ref) {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditBarang()))
        .then((value) => ref.refresh(listBarangProvider));
  }

  // Action when delete button pressed
  void onDelete(id, context, ref) async {
    try {
      await BarangClient.destroy(id);
      ref.refresh(listBarangProvider);
      showSnackBar(context, 'Delete success', Colors.green);
    } catch (e) {
      showSnackBar(context, e.toString(), Colors.red);
    }
  }

  // Widget for item on list
  ListTile scrollViewItem(Barang b, context, ref) => ListTile(
      title: Text(b.nama),
      subtitle: Text(b.deskripsi),
      onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditBarang(id: b.id)))
          .then((value) => ref.refresh(listBarangProvider)),
      trailing: IconButton(
        onPressed: () => onDelete(b.id, context, ref),
        icon: const Icon(Icons.delete),
      ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listener = ref.watch(listBarangProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GD API 1407'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => onAdd(context, ref),
      ),
      body: listener.when(
        data: (barangs) => SingleChildScrollView(
          child: Column(
              children:
                  barangs.map((b) => scrollViewItem(b, context, ref)).toList()),
        ),
        error: (err, s) => Center(child: Text(err.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String msg, Color bg) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(msg),
      backgroundColor: bg,
      action: SnackBarAction(
          label: 'hide', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
