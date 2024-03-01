import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:pharm/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final token;
  const HomeView(this.token, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final TextEditingController _searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SideMenu(
                  style: SideMenuStyle(
                      backgroundColor: const Color.fromARGB(255, 222, 219, 219),
                      openSideMenuWidth: 300,
                      compactSideMenuWidth: 90),
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: screenWidth(context) > 600
                        ? Text(
                            "Pharm",
                            style: TextStyle(
                              fontSize: getResponsiveLargeFontSize(context),
                            ),
                          )
                        : const Text(
                            "P",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                  ),
                  items: [
                    SideMenuItem(
                      title: 'Dashboard',
                      onTap: (index, _) {
                        viewModel.sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.home),
                    ),
                    SideMenuItem(
                      title: 'Bookings',
                      onTap: (index, _) {
                        viewModel.sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    SideMenuItem(
                      title: 'Exit',
                      onTap: (index, _) {
                        viewModel.logout();
                      },
                      icon: const Icon(Icons.exit_to_app),
                    )
                  ],
                  controller: viewModel.sideMenu),
            ),
            Expanded(
              flex: 4,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewModel.pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Welcome ${viewModel.email}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          verticalSpaceMedium,
                          Container(
                            // height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 222, 219, 219),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: "Search for your appointments...",
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.clear),
                                    onPressed: () => _searchController.clear(),
                                  ),
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      // Perform the search here
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          Wrap(
                            spacing: 25,
                            runSpacing: 25,
                            children: [
                              Column(
                                children: [
                                  const Text("Future Appointments"),
                                  Container(
                                    width: screenWidth(context) * 0.35,
                                    height:
                                        screenWidth(context) < 1426 ? 260 : 500,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          255, 222, 219, 219),
                                    ),
                                    child: ListView.builder(
                                      itemCount: 15,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text("Appointment $index"),
                                          onTap: () {},
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // horizontalSpaceMedium,
                              Column(
                                children: [
                                  const Text("Past Appointments"),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 222, 219, 219)),
                                    width: screenWidth(context) * 0.35,
                                    height:
                                        screenWidth(context) < 1426 ? 260 : 500,
                                    child: ListView.builder(
                                      itemCount: 15,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text("Appointment $index"),
                                          onTap: () {},
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _searchController,
                          onSubmitted: (name) {
                            viewModel.searchDoctor(name);
                          },
                          decoration: InputDecoration(
                            hintText: "Search for your doctor...",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => _searchController.clear(),
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        SizedBox(
                          height: screenHeight(context) * 0.75,
                          child: ListView.separated(
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 231, 230, 230),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 30,
                                          ),
                                          horizontalSpaceSmall,
                                          Text(
                                            "Micheal Jordan $index",
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: screenWidth(context) < 1200
                                            ? false
                                            : true,
                                        replacement: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Dialog(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    height: 350,
                                                    width: 350,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const CircleAvatar(
                                                            radius: 50,
                                                          ),
                                                          const Text("Name"),
                                                          const Text(
                                                              "Specification"),
                                                          const Text(
                                                              "Affilation"),
                                                          const TextField(
                                                            decoration:
                                                                InputDecoration(
                                                                    hintText:
                                                                        "Reason for appointment"),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Close",
                                                                ),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () {},
                                                                child:
                                                                    const Text(
                                                                  "Book appointment",
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.more_horiz_outlined,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Text("affilation $index"),
                                            horizontalSpaceMedium,
                                            Text("specification $index"),
                                            horizontalSpaceMedium,
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text("Book appointment"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) async {
    // Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    // late String email = jwtDecodedToken['email'];
    viewModel.setEmail(token: token);

    await viewModel.sidebar();
    Future.delayed(const Duration(milliseconds: 300));
    super.onViewModelReady(viewModel);
  }
}
