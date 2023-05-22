import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testasd/bloc/Search/searcha_bloc.dart';
import 'package:testasd/model/SearchModel.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}
late SearchModel searchModel;
class _SearchState extends State<Search> {
  TextEditingController doctorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: mHeight * .05,
          ),
          Center(
            child: SizedBox(
              height: mHeight * .07,
              width: mWidth * .92,
              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<SearchaBloc>(context)
                      .add(FetchSearch());
                },
                controller: doctorController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search ",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchaBloc, SearchaState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SearchError) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
              if (state is SearchLoaded) {
                searchModel = BlocProvider.of<SearchaBloc>(context)
                    .searchDoctorModel;
                return Expanded(
                  child: ListView.builder(
                      itemCount: searchModel.hits!.length,
                      itemBuilder: (ctx, index) {
                        return SizedBox(
                            height: mHeight * .12,
                            // width: 200,
                            child: GestureDetector(
                                onTap: () {

                                },
                                child: Card(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: mWidth * .02),
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${searchModel.hits![index].id.toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(searchModel
                                                .hits![index].likes.toString()),
                                            Text(searchModel
                                                .hits![index].userId.toString()),
                                            Text(searchModel
                                                .hits![index].imageSize.toString()),

                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10.0),
                                                child: Image.network(searchModel
                                                    .hits![index].userImageURL.toString()
                                                  ,
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                )));
                      }),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
