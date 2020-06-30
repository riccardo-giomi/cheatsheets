Words to live by
================

* Any change to the program logic should be driven by a failed test.

* If it's not tested, treat it like it's broken.

* Testing is supposed to help for the long term. The long term starts tomorrow,
  or maybe after lunch.

* It's not done until it works.

* Tests are code that doesn't have tests; keep them simple.

* Start a bug fix by writing a test.

* Tests monitor the quality of your codebase. If it becomes difficult to write
  tests, that often means your codebase is too interdependent.

Test prescriptions
==================

From the `Rails 5 test prescriptions` book.

1. Use the TDD process to create and adjust your code's design in small,
   incremental steps.

2. In a test-driven process, if it's difficult to write tests for a feature,
   strongly consider the possibility that the design of the underlying code
   needs to be changed.

3. Initializing objects is a good starting place for a TDD process.  Another
   good approach is to use the test to design what you want a successful
   interaction of the feature to look like.

4. When possible, write your tests to describe your code's behavior, not its
   implementation.

5. Keeping your code as simple as possible allows you to focus complexity on
   the areas that really need it.

6. Choose your test data and test-variable names to make it easy to diagnose
   failures when they happen. Meaningful names and data that doesn't overlap
   are helpful.

7. Using Capybara allows you to simulate user activity for end-to-end tests of
   your Rails features.

8. Placing business logic outside Rails classes makes that logic easier to test
   and manage.

 9. Use `:aggregate_failures` to get the best features of single-assertion and
    multiple-assertion tests.
