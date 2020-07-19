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

 10. Your tests are also code. Specifically, your tests are code that does not
     have tests.

 11. Think about both the short-term and long-term cost of tests as you write
     them.

 12. If you find yourself writing tests that already pass given the current
     state of the code, that often means you're writing too much code in each
     pass.

 13. Refactoring is where a lot of design happens in TDD, and it's easiest to
     do in small steps. Skip it at your peril.

 14. Try to extract methods when you see compound Booleans, local variables, or
     inline comments.

 15. Expectations that cover different branches of the application logic should
     be handled in separate specs.

 16. Fixtures are particularly useful for global semistatic data stored in the
     database.

 17. Your go-to build strategy for factory\_bot should be build\_stubbed unless
     there is a need for the object to be in the database during the test.

 18. Avoid defining associations automatically in factory\_bot definitions. Set
     them test by test, as needed. You'll wind up with more manageable test
     data.

 19. Use partial doubles when you want to ensure most of your real object
     behavior. Use full doubles when the behavior of the stubbed object doesn't
     matter—only its public interface does.

 20. The use of the allow\_any\_instance\_of stub modifier often means the
     underlying code being tested could be refactored with a more useful method
     to stub.

 21. A stubbed method that returns a stub is usually okay. A stubbed method
     that returns a stub that itself contains a stub probably means your code
     is too dependent on the internals of other objects.

 22. Don't mock what you don't own.

 23. By far the biggest and easiest trap you can fall into when dealing with
     integration tests is the temptation to use them like unit tests.

 24. Use Capybara's JavaScript integration-testing capabilities sparingly lest
     you be very, very annoyed. Test as much as possible within each layer,
     separate from the others.

 25. A request test should test behavior of a single request. A request test
     should not fail because of problems in the model.

 26. When testing a Boolean condition, make sure to write a test for both
     halves of the condition.

 27. When testing for view elements, try to test for DOM classes that you
     control rather than text or element names that might be subject to design
     changes.

 28. The decision to write tests is much more important than the testing tool
     you choose to write them.

 29. Security issues are often just bugs. Most of the practices you follow to
     keep your code bug-free will also help prevent and diagnose security
     issues.

 30. Always do security testing in pairs: the blocked logic and the okay logic.

 31. When a single change in your code breaks multiple tests, consider the idea
     that your testing strategy is flawed.

 32. Write your test to be as close as possible to the code logic that's being
     tested.

 33. Adding user authentication can be very disruptive to existing tests. Try
     to get the basic infrastructure in place early.

 34. Test for mass assignment any time you have an attribute that needs to be
     secure and a controller method that touches that class based on user
     input.

 35. Use an automatic security scanner to check for common security issues.

 36. Mediating interaction to an external server through an adapter that is
     part of your code makes the interaction both easier to test and easier to
     use.

 37. Use the VCR gem to allow your integration tests to run against server
     response data.

 38. Use the adapter to test client behavior without being dependent on the
     server API.

 39. Test the error code based on which object in the system needs to respond
     to the error.

 40. When a formerly passing test fails, something has changed.

 41. Using p and various related methods is a quick and easy way to get a sense
     of why a test is behaving badly.

 42. Use git bisect to track down mysterious failures in your code when you
     have no idea how they were inserted.

 43. If you have a slow test suite, you can mitigate the effects in practice by
     being able to run a relevant subset of tests.

 44. Use RSpec metadata like :focus or :slow to be able to run arbitrary groups
     at once.

 45. Use `rspec --only-failures` and `rspec --next-failure` to only run failing
     specs, which allows you to focus on failures easily.

 46. If you specify a test by line number, be sure not to add lines to the
     file. Added lines could make it so you aren't running the test you think
     you're running.

 47. Rails is not your application; it is a framework on which you build your
     application—unless you work at Basecamp and actually develop Rails.

 48. If you have enough time to break focus while your tests run, you aren't
     getting the full value of the TDD process.

 49. This is your regular reminder that software is complex and there are
     multiple paths to success.

 50. The only way to know the boundaries of a new coding tool is to go past
     them. Try things.

 51. You can use test doubles to remove test dependencies.

 52. You don't need to start with elaborate object indirection, but it's useful
     when logic gets complicated.

 53. When dealing with legacy code, respect code that works. You don't know
     what constraints the previous coders worked under.

 54. When writing initial unit tests for legacy code, use the test Prescription
     54 to explore the code's behavior. Try to write a passing test without
     changing code.
