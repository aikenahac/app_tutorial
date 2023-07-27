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

**TutorialItems**
  - **globalKey**  - The Global Key of the component you want to focus on
  - **touchScreen** - Sets whether to move to the next tutorial items by clicking anywhere on the screen
  - **children** - List of widgets to compose the screen
  - **widgetNext** - A component to move to the next item, if touchScreen is equal to false, the click will be only on that component
  - **shapeFocus** -Focus shape can be chosen using **shapeFocus.oval**, **ShapeFocus.square** or **ShapeFocus.roundedSquare**
  - Can be aligned on the screen as well as positioned using **(top, bottom, left, right)**

| Property | Description | Type | Required |
| -------- | ----------- | ---- | -------- |
| globalKey | The Global Key of the component you want to focus on | GlobalKey | `yes` |


**Tutorial.show(context,items)**

show() -   the show () method, receives two parameters, the context and the list of TutorialItems you created
Now just run the Tutorial.show(context, items)

```
Tutorial.showTutorial(context, items);
```

###### This package is a fork of [this](https://pub.dev/packages/tutorial) package, that I reuploaded as a Flutter package due to the package maintainer not responding.