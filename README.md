# Flutter App Tutorial

<img src="https://raw.githubusercontent.com/aikenahac/tutorial/master/assets/tutorial_demo.gif" alt="roundedRectangle" width="200"/>

## Usage

Import the package into your `pubspec.yaml`

```
dependencies:
  app_tutorial: ^currentVersion
```

Then import the library into the file you want:

```
import 'package:app_tutorial/app_tutorial.dart'
```

Then create the global keys and name them accordingly to where you are going to use them:

```
final keyMenu = GlobalKey();
final keyContainer = GlobalKey();
final keyChat = GlobalKey();  
```

Then create a list of TutorialItems

```
List<TutorialItems> items = [];
@override
  void initState() {
    items.addAll({
      TutorialItems(
          globalKey: keyMenu,
          touchScreen: true,
          top: 200,
          left: 50,
          borderRadius: Radius.circular(15.0), // NEEDED ON  ShapeFocus.roundedSquare !!!
          color: Color.fromRGBO(R, G, B, opacity),
          children: [
            Text(
              "Tutorial Item 1",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Next",
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.roundedSquare),
      TutorialItems(
        globalKey: keyChat,
        touchScreen: true,
        top: 200,
        left: 50,
        color: Color.fromRGBO(R, G, B, opacity),
        children: [
          Text(
            "Tutorial Item 2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Next",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        shapeFocus: ShapeFocus.oval,
      ),
      TutorialItems(
        globalKey: keyContainer,
        touchScreen: true,
        bottom: 50,
        left: 50,
        color: Color.fromRGBO(R, G, B, opacity),
        children: [
          Text(
            "Tutorial Item 3",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          )
        ],
        widgetNext: Text(
          "Finish",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        shapeFocus: ShapeFocus.square,
      ),
    });
    super.initState();
  }
```

#### Properties:

**TutorialItems**
  - **globalKey**  - The Global Key of the component you want to focus on
  - **touchScreen** - Sets whether to move to the next tutorial items by clicking anywhere on the screen
  - **children** - List of widgets to compose the screen
  - **widgetNext** - A component to move to the next item, if touchScreen is equal to false, the click will be only on that component
  - **shapeFocus** -Focus shape can be chosen using **shapeFocus.oval**, **ShapeFocus.square** or **ShapeFocus.roundedSquare**
  - Can be aligned on the screen as well as positioned using **(top, bottom, left, right)**

**Tutorial.show(context,items)**

show() -   the show () method, receives two parameters, the context and the list of TutorialItems you created
Now just run the Tutorial.show(context, items)

```
Tutorial.showTutorial(context, items);
```

###### This package is a fork of [this](https://pub.dev/packages/tutorial) package, that I reuploaded as a Flutter package due to the package maintainer not responding.