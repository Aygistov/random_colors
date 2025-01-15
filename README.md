# Random Colors
[![flutter_project_template](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_badge?projectId=149)](https://nokycucwgzweensacwfy.supabase.co/functions/v1/get_project_url?projectId=149) 
[![style: solid](https://img.shields.io/badge/style-solid-orange)](https://pub.dev/packages/solid_lints)

## Test task:

1. Install Flutter
2. Create a test application
3. The application should: display the text "Hey there" in the middle of the screen and after tapping anywhere on the screen, a background color should be changed to a randomly generated color. You can also add any other feature to the app - that adds bonus points
4. Please do not use any external libraries for color generation
5. Use solid_lints to (https://pub.dev/packages/solid_lints) perform static code analysis and fix any issues.
6. Don't use any "AI tools" like ChatGPT or similar.
7. Push code to GitHub
8. Send the link to the GitHub repository back

You can find more information about this test task here: https://bit.ly/3wlSFzk

## Comments
To generate a random color, I used HSV Color Space from article:
https://martin.ankerl.com/2009/12/09/how-to-create-random-colors-programmatically/

### Run integration test:
flutter test integration_test/app_test.dart

Feature              | Package |
-------------------- | ------- |
State Management     | rxdart  |
Dependency Injection | get_it  |

