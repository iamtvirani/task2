import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmphi_practical_demo/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller.numberController.value,
                    decoration: const InputDecoration(labelText: 'Number'),
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  color: Colors.black,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _controller.data.value.clear();
                    for (int i = 0; i < 4; i++) {
                      _controller.num.value = _controller.num.value + 1;
                      _controller.data.add(_controller.num.value);
                    }
                    _controller.isLoad.value = true;
                  },
                ),
              ],
            ),
            Obx(
              () => SizedBox(
                  height: 70,
                  child: ListView.builder(
                    itemCount: _controller.data.length,
                    scrollDirection: Axis.horizontal,
                    reverse: _controller.isPrev.value ? true : false,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
                            child: Center(
                                child:
                                    Text(_controller.data[index].toString()))),
                      );
                    },
                  )),
              //: const SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.black,
                  child: const Text(
                    'Previous',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _controller.isPrev.value = true;
                    _controller.previousOnTap();
                  },
                ),
                MaterialButton(
                  color: Colors.black,
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _controller.isPrev.value = false;
                    _controller.nextOnTap();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
