import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:pharm/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'doctor_home_viewmodel.dart';

class DoctorHomeView extends StackedView<DoctorHomeViewModel> {
  final token;
  const DoctorHomeView(this.token, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DoctorHomeViewModel viewModel,
    Widget? child,
  ) {
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Welcome Doctor",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          verticalSpaceMedium,
                          Container(
                            // height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color.fromARGB(255, 222, 219, 219)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                    hintText: "Search for your appointments...",
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () =>
                                          _searchController.clear(),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(Icons.search),
                                      onPressed: () {
                                        // Perform the search here
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    )),
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
                                      height: screenWidth(context) < 1426
                                          ? 260
                                          : 500,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 222, 219, 219)),
                                      child: ListView.builder(
                                        itemCount: 15,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text("Appointment $index"),
                                            onTap: () {},
                                          );
                                        },
                                      )),
                                ],
                              ),
                              // horizontalSpaceMedium,
                              Column(
                                children: [
                                  const Text("Past Appointments"),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 222, 219, 219)),
                                      width: screenWidth(context) * 0.35,
                                      height: screenWidth(context) < 1426
                                          ? 260
                                          : 500,
                                      child: ListView.builder(
                                        itemCount: 15,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text("Appointment $index"),
                                            onTap: () {},
                                          );
                                        },
                                      )),
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
                              )),
                        ),
                        verticalSpaceMedium,
                        const Text("Manage Appointments"),
                        verticalSpaceMedium,
                        SizedBox(
                          height: 450,
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              // scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // return Text("hello $index");
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // border: const Border.fromBorderSide(
                                      //     BorderSide(color: Colors.black87)),
                                      color: const Color.fromARGB(
                                          255, 231, 230, 230)),
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
                                                        (BuildContext
                                                                context) =>
                                                            Dialog(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                height: 350,
                                                                width: 350,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          20),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      const CircleAvatar(
                                                                        radius:
                                                                            50,
                                                                      ),
                                                                      const Text(
                                                                          "Reason"),
                                                                      const Text(
                                                                          "Reason details"),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          ElevatedButton(
                                                                              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: const Text("Cancel")),
                                                                          ElevatedButton(
                                                                              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                                                              onPressed: () {},
                                                                              child: const Text("Accept")),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                              },
                                              icon: const Icon(
                                                  Icons.more_horiz_outlined),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              ElevatedButton(
                                                  style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.red)),
                                                  onPressed: () {},
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text("Cancel"),
                                                  )),
                                              horizontalSpaceMedium,
                                              ElevatedButton(
                                                  style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.green)),
                                                  onPressed: () {},
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text("Accept"),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ))
        ],
      )),
    );
  }

  @override
  DoctorHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DoctorHomeViewModel();

  @override
  void onViewModelReady(DoctorHomeViewModel viewModel) async {
    viewModel.setEmail(token: token);
    await viewModel.sidebar();
    Future.delayed(const Duration(milliseconds: 300));
    super.onViewModelReady(viewModel);
  }
}
