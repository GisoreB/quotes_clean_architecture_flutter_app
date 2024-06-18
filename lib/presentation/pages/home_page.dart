import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean_architecture_flutter_app/presentation/bloc/bloc/home_bloc.dart';
import 'package:quotes_clean_architecture_flutter_app/presentation/widgets/item_quotes.dart';
import 'package:quotes_clean_architecture_flutter_app/presentation/widgets/poppins_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PoppinsText(text: "Quotes Bloc Clean Architecture", fontSize: 22),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeSuccess) {
            return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 90),
                itemCount: state.data.result?.length ?? 0,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemBuilder: (context, index) {
                  return ItemQuotesWidget(
                      quotesEntity: state.data.result![index]);
                });
          } else if (state is HomeError) {
            return Center(
              child: PoppinsText(text: state.textError, fontSize: 18),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final homeBloc = BlocProvider.of<HomeBloc>(context);
          homeBloc.add(GetRandomQuotesEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}