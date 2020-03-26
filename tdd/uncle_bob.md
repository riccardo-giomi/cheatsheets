Uncle Bob's rules
=================

[http://www.butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd]

* You are not allowed to write any production code unless it is to make a failing
  unit test pass.

* You are not allowed to write any more of a unit test than is sufficient to fail;
  and compilation failures are failures.

* You are not allowed to write any more production code than is sufficient to pass
  the one failing unit test.

Refactored version:
===================

* Write only enough of a unit test to fail.

* Write only enough production code to make the failing unit test pass.

Transformations
===============

When changing the code to pass a test, if you come to a decision point,
there's two ways (or more) to transform the code to make it work, choose
the one that's higher on this list.

From Wikipedia [https://en.wikipedia.org/wiki/Transformation_Priority_Premise]:

Transformation Priority Premise states that simpler transformations should be preferred:

    [...]Refactorings have counterparts called Transformations. Refactorings are simple
    operations that change the structure of code without changing its behavior.
    Transformations are simple operations that change the behavior of code.
    Transformations can be used as the sole means for passing the currently failing test
    in the red/green/refactor cycle. Transformations have a priority, or a preferred ordering,
    which if maintained, by the ordering of the tests, will prevent impasses,
    or long outages in the red/green/refactor cycle.

    - "Uncle Bob" Martin, "The Transformation Priority Premise", Uncle Bob's Blog

This approach facilitates the programmer doing the simplest possible thing for the purposes
of test-driven development as they can explicitly refer to the list of transformations and favor
the simpler transformations (from the top of the list) over those further down in the list in the
first instance.  

The Transformations
===================

* ({}            -> nil)                # no code at all -> code that employs nil
* (nil           -> constant)
* (constant      -> constant+)          # a simple constant to a more complex constant
* (constant      -> scalar)             # replacing a constant with a variable or an argument
* (statement     -> statements)         # adding more unconditional statements.
* (unconditional -> if)                 # splitting the execution path
* (scalar        -> array)
* (array         -> container)
* (statement     -> tail-recursion)
* (if            -> while)
* (statement     -> non-tail-recursion)
* (expression    -> function)           # replacing an expression with a function or algorithm
* (variable      -> assignment)         # replacing the value of a variable.
* (case)                                # adding a case (or else) to an existing switch or if

Uncle Bob also explicitly stated: "There are likely others".
