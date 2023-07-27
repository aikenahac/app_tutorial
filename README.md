# Flutter App Tutorial

<img src="https://raw.githubusercontent.com/aikenahac/tutorial/master/assets/tutorial_demo.gif" alt="roundedRectangle" width="200"/>

## Usage

Import the package into your `pubspec.yaml`

```
dependencies:
  app_tutorial: ^currentVersion
```

View the [example project](https://github.com/aikenahac/app_tutorial/tree/master/example) to see how to use the package.

#### Properties:

**TutorialItem**

| Property | Description | Type | Required |
| -------- | ----------- | ---- | -------- |
| globalKey | The Global Key of the component you want to focus on | `GlobalKey` | `yes` |
| children | List of widgets to show on the screen when this item is active | `List<Widget>` | `yes`|
| top | Offset from the top | `double` | `no` |
| left | Offset from the left | `double` | `no` |
| bottom | Offset from the bottom | `double` | `no` |
| right | Offset from the right | `double` | `no` |
| color | Color of the overlay | `Color` | `no` |
| borderRadius | Radius of the border of the higlighted item | `Radius` | `no` |
| crossAxisAlignment | Alignment on the cross axis | `CrossAxisAlignment` | `no` |
| mainAxisAlignment | Alignment on the main axis | `MainAxisAlignment` | `no` |
| shapeFocus | Shape of the focus element | `ShapeFocus.oval`, `ShapeFocus.square`, `ShapeFocus.roundedSquare` | `no` |  

**Tutorial.show(context,items)**

show() -   the show () method, receives two parameters, the context and the list of TutorialItems you created
Now just run the Tutorial.show(context, items)

```
Tutorial.showTutorial(context, items);
```

###### This package is a fork of [this](https://pub.dev/packages/tutorial) package, that I reuploaded as a Flutter package due to the package maintainer not responding.