# Flutter App Onboarding

<img src="https://raw.githubusercontent.com/aikenahac/tutorial/master/assets/tutorial_demo.gif" alt="roundedRectangle" width="200"/>

## Usage

Import the package into your `pubspec.yaml`

```
dependencies:
  app_tutorial: ^currentVersion
```

View the [example project](https://github.com/aikenahac/app_tutorial/tree/master/example) to see how to use the package.

#### Properties:

##### TutorialItem

| Property | Description | Type | Required | Default value |
| -------- | ----------- | ---- | -------- | ------------- |
| globalKey | The Global Key of the component you want to focus on | `GlobalKey` | `yes` | / |
| child | Widget to show on the screen when this item is active | `Widget` | `yes`| / |
| color | Color of the overlay | `Color?` | `no` | `Color.fromRGBO(0, 0, 0, 0.6)` |
| borderRadius | Radius of the border of the higlighted item | `Radius` | `no` | `Radius.circular(10.0)` |
| radius | Radius of the `ShapeFocus.oval` shape | `double?` | `no` | `null` |
| shapeFocus | Shape of the focus element | `ShapeFocus.oval`, `ShapeFocus.square`, `ShapeFocus.roundedSquare` | `no` |  `ShapeFocus.roundedSquare` |

##### Tutorial

- `show()` - the show () method, receives two parameters, the context and the list of tutorial items you created
Now just run the Tutorial.show(context, items)
```
Tutorial.showTutorial(context, items);
```

- `skipAll()` - the skipAll() method receives the context parameter and ends the onboarding process
```
Tutorial.skipAll(context, items);
```

###### This package is a separated fork of [this package](https://pub.dev/packages/tutorial).