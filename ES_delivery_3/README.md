# TPC#3: Acceptance Tests

In order to get some basic understanding about acceptance tests in the context
of mobile apps and specifically in the context of Flutter, I decided to read
through the available contents in the subject's page which lead me to the
official [Flutter Documentation](https://docs.flutter.dev/testing/overview)

---
In order to test the app developed for the first assignment, the following
tutorial on integration testing was used: [Flutter Integration Testing
Tutorial](https://docs.flutter.dev/testing/integration-tests), given the
simplicity of the app.

---
Now, using collaboration tools to fetch the work uploaded to the team's
repository, the tests were made using GenAI based on the integration test that
was showcased on the flutter tutorial mentioned earlier.

``` prompt
Write acceptance tests for the login and logout flow of the
application in this context while using app_test.dart as a base.
```

The entry point of the app was given as context alongside the tutorial's
example. The output generated was quite comprehensive, having produced tests
for the appearance of the login page and functionality. Moreover, the login and
logout flow making sure that the login button not only redirected to the home
page but also replaced the login page from the stack, and that the logout
button replaced the home page with a new login page.

The apps, acceptance tests and respective videos recorded with OBS showcasing
the apps being tested on my Android Device have been pushed to a [Personal
GitHub Repository](https://github.com/ComradeTusk/ESOF-Assignment) in order to
be evaluated.

## Critical Analisys

The use of GenAi for the completion of this assigment was a huge help in terms
of quickly delivering integrations tests. However, even after following the
available flutter documenation in regards to integration testing, the tests
provided by Claude feel a bit confusing and hard to follow mainly because of my
unfamiliarity with dart.
