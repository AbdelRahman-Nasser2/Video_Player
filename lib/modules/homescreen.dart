import 'package:flutter/material.dart';
import 'package:videoplayer/models/infomodel.dart';
import 'package:videoplayer/modules/videoinfo.dart';
import 'package:videoplayer/shared/components/colors.dart' as color;
import 'package:videoplayer/shared/components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<InfoModel> info = [
      InfoModel('Gluts', 'assets/ex1.png'),
      InfoModel('Abs', 'assets/ex2.png'),
      InfoModel('Legs', 'assets/ex3.png'),
      InfoModel('Arms', 'assets/ex4.png'),
      InfoModel('Legs', 'assets/ex3.png'),
      InfoModel('Arms', 'assets/ex4.png'),
      InfoModel('Arms', 'assets/ex4.png'),
    ];
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Training",
          style: TextStyle(
              fontSize: 30,
              color: color.AppColor.homePageTitle,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          Icon(Icons.arrow_back_ios,
              size: 20, color: color.AppColor.homePageIcons),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.calendar_today_outlined,
            size: 20,
            color: color.AppColor.homePageIcons,
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(Icons.arrow_forward_ios,
              size: 20, color: color.AppColor.homePageIcons)
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        navigateTo(context, const VideoInfo());
                      },
                      child: Row(
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageDetail,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward,
                              size: 20, color: color.AppColor.homePageIcons)
                        ],
                      ))
                ],
              ),
              space(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2))
                    ]),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next workout",
                        style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageContainerTextSmall),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextSmall),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextSmall),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer,
                                  size: 20,
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: color
                                        .AppColor.homePageContainerTextSmall),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: [
                                  BoxShadow(
                                      color: color.AppColor.gradientFirst,
                                      blurRadius: 10,
                                      offset: const Offset(4, 8))
                                ]),
                            child: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 60,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              space(),
              SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage("assets/card.jpg"),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 40,
                                offset: const Offset(8, 10),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.3)),
                            BoxShadow(
                                blurRadius: 10,
                                offset: const Offset(-1, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.3))
                          ]),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 200, bottom: 30),
                      decoration: BoxDecoration(
                        // color:Colors.redAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/figure.png"),
                          //fit:BoxFit.fill
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color.AppColor.homePageDetail),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    color: color.AppColor.homePagePlanColor,
                                    fontSize: 16,
                                  ),
                                  children: const [
                                TextSpan(text: "stick to your plan")
                              ]))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              space(),
              Text(
                "Area of foucs",
                //textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle),
              ),
              space(),
              SizedBox(
                height: 500,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: info.length,
                    itemBuilder: (BuildContext context, int index) =>
                        item(info[index])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget space() => const SizedBox(
        height: 20,
      );

  Widget item(InfoModel model) => Container(
        height: 170,
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(model.img!),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(5, 5),
                  color: color.AppColor.gradientSecond.withOpacity(0.1)),
              BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(-5, -5),
                  color: color.AppColor.gradientSecond.withOpacity(0.1))
            ]),
        child: Center(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              model.title!,
              style:
                  TextStyle(fontSize: 20, color: color.AppColor.gradientFirst),
            ),
          ),
        ),
      );
}
