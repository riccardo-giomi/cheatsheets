# Matchers

## Value Matchers

### Equality/Identity

Matcher    | Passes if...  | Available aliases      
---------- | ------------- | -----------------
`eq(x)`    | `a == x`      | `an_object_eq_to(x)`
`eql(x)`   | `a.eql?(x)`   | `an_object_eql_to(x)`
`equal(x)` | `a.equal?(x)` | `be(x)`, `an_object_eql_to(x)`

### Truthiness and Nil

Matcher       | Passes if...             | Available aliases 
------------- | ------------------------ | -----------------
`be_truthy`   | `a != nil && a != false` | `a_truthy_value`
`be true`     | `a == true`              | 
`be_falsey`   | `a == nil || a == false` | `be_falsy`, `a_falsey_value`, `a_falsy_value`
`be false`    | `a == false`             |
`be_nil`      | `a.nil?`                 | `a_nil_value`

### Types

Matcher                    | Passes if...       | Available aliases      
-------------------------- | ------------------ | ----------------- 
`be_an_instance_of(klass)` | `a.class == klass` | `be_instance_of(klass)` 
                           |                    | `an_instance_of(klass)` 
`be_a_kind_of(klass)`      | `a.is_a(klass)`    | `a.is_a?(klass)`, `be_a(klass)`, `be_kind_of(klass)`, `a_kind_of(klass)`      

### Operator Comparisons

Matcher   | Passes if... | Available aliases  
--------- | ------------ | ------------------
`be == x` | `a == x`     | `a_value == x`    
`be < x`  | `a < x`      | `a_value < x`     
`be > x`  | `a > x`      | `a_value > x`     
`be <= x` | `a <= x`     | `a_value <= x`    
`be >= x` | `a >= x`     | `a_value >= x`    
`be =~ x` | `a =~ x`     | `a_value =~ x`    
`be === x`| `a === x`    | `a_value === x`   

### Delta/Range Comparisons

Matcher                       | Passes if...                 | Available aliases      
----------------------------- | ---------------------------- | ----------------- 
`be_between(1, 10).inclusive` |`a >= 1 && a <= 10`           | `be_between(1, 10)`, `a_value_between(1, 10).inclusive`, `a_value_between(1, 10)`
`be_between(1, 10).exclusive` | `a > 1 && a < 10`            | `a_value_between(1, 10).exclusive`
`be_within(0.1).of(x)`        | `(a - x).abs <= 0.1`         | `a_value_within(0.1).of(x)`
`be_within(5).percent_of(x)`  | `(a - x).abs <= (0.05 * x)`  | `a_value_within(5).percent_of(x)`
`cover(x, y)`                 | `a.cover?(x) && a.cover?(y)` | `a_range_covering(x, y)`

### Strings and Collections

Matcher                    | Passes if...                            | Available aliases      
-------------------------- | --------------------------------------- | ----------------- 
`contain_exactly(2, 1, 3)` | `a.sort == [2, 1, 3].sort`              | `match_array([2, 1, 3])`
                           |                                         | `a_collection_containing_exactly(2, 1, 3)`
`start_with(x, y)`         | `a[0] == x && a[1] == y`                | `a_collection_starting_with(x, y)`
                           |                                         | `a_string_starting_with(x, y)`
`end_with(x, y)`           | `a[-1] == x && a[-2] == y`              | `a_collection_starting_with(x, y)` (?????)
                           |                                         | `a_string_starting_with(x, y)` (????)
`include(x, y)`            | Include x and y as values or keys (\*)  | `a_collection_including(x, y)`
                           |                                         | `a_string_including(x, y)`
                           |                                         | `a_hash_including(x, y)`
`include(w: x, y: z)`      | `a[:w] == :x && a[:y] == :z`            | `a_hash_including(w: x, y: z)`
`all(matcher)`             | `a.all? { |e| matcher.matches?(e) }`    |
`match(x: matcher, y: 3)`  | `matcher.matches?(a[:x]) && a[:y] == 3` | `an_object_matching(x: matcher, y: 3)`
`match([3, matcher])`      | `a[0] == 3 && matcher.matches?(a[1])`   | `an_object_matching([3, matcher])`
`match("pattern")`         | `a.match("pattern")`                    | `a_string_matching("pattern")`
`match(/regex/)`           | `a.match(/regex/)`                      | `match_regex(/regex/)`, `a_string_matching(/regex/)`

\* `(a.include?(x) && a.include?(y)) || (a.key?(x) && a.key?(y))`

### Duck Typing and Attributes

Matcher                            | Passes if...                                   | Available aliases      
---------------------------------- | ---------------------------------------------- | ----------------- 
`have_attributes(w: x, y: z)`      | `a.w == x && a.y == z`                         | `an_object_having_attributes(w: x, y: z)`
`respond_to(:x, :y)`               | `a.respond_to?(:x) && a.respond_to?(:y)`       | `an_object_responding_to(:x, :y)`
`respond_to(:x).with(2).arguments` | `a.respond_to?(:x) && a.method(:x).arity == 2` | `an_object_responding_to(:x).with(2).arguments`

### Dynamic Predicates

Matcher               | Passes if...                            | Available aliases      
--------------------- | --------------------------------------- | ----------------- 
`be_xyz`              | `a.xyz? || a.xyzs?`                     | `be_a_xyz`, `be_an_xyz`
`be_foo(x, y, &b)`    | `a.foo(x, y, &b)? || a.foos(x, y, &b)?` | `be_a_foo(x, y, &b)`
`be_an_foo(x, y, &b)` | `have_xyz a.has_xyz?`                   | `have_foo(x, y, &b) a.has_foo(x, y, &b)?`

### Additional Matchers

Matcher                           | Passes if...                        | Available aliases      
--------------------------------- | ----------------------------------- | ----------------- 
`exist`                           | `a.exist? || a.exists?`             | `an_object_existing`
`exist(x, y)`                     | `a.exist(x, y)? || a.exists(x, y)?` | `an_object_existing(x, y)`
`satisfy { |x| ... }`             | Provided block returns true         | `an_object_satisfying { |x| ... }` 
`satisfy("criteria") { |x| ... }` | Provided block returns true         | `an_object_satisfying("...") { |x| ... }`

### Block Matchers

```ruby
expect { some_code }.to matcher
```

### Mutation

The change matcher captures a value before running the block (`old_value`) and again
after running the block (`new_value`). The value can be specified in two ways:

```ruby
expect { do_something }.to change(obj, :attr)
# or
expect { do_something }.to change { obj.attr }
```

Matcher                     | Passes if...
--------------------------- | ------------
`change { }`                | `old_value != new_value`
`change { }.by(x)`          | `(new_value - old_value) == x`
`change { }.by_at_least(x)` | `(new_value - old_value) >= x`
`change { }.by_at_most(x)`  | `(new_value - old_value) <= x`
`change { }.from(x)`        | `old_value != new_value && old_value == x`
`change { }.to(y)`          | `old_value != new_value && new_value == y`
`change { }.from(x).to(y)`  | `old_value != new_value && old_value == x && new_value == y`

### IO

Matcher                                    | Passes if...                                                                   | Available aliases      
------------------------------------------ | ------------------------------------------------------------------------------ | ----------------- 
`output("foo").to_stdout`                  | "foo" is printed to $stdout from this process                                  | `a_block_outputting("foo").to_stdout`
`output("foo").to_stderr`                  | "foo" is printed to $stderr from this process                                  | `a_block_outputting("foo").to_stderr`
`output(/bar/).to_stdout`                  | A string matching /bar/ is printed to $stdout from this process                | `a_block_outputting(/bar/).to_stdout` 
`output(/bar/).to_stderr`                  | A string matching /bar/ is printed to $stderr from this process                | `a_block_outputting(/bar/).to_stderr` 
`output("foo").to_stdout_from_any_process` | "foo" is printed to $stdout from this process or a subprocess                  | `a_block_outputting("foo").to_stdout_from_any_process`
`output("foo").to_stderr_from_any_process` | "foo" is printed to $stderr from this process or a subprocess                  | `a_block_outputting("foo").to_stderr_from_any_process`
`output(/foo/).to_stdout_from_any_process` | A string matching foo/ is printed to $stdout from this process or a subprocess | `a_block_outputting(/foo/).to_stdout_from_any_process`
`output(/foo/).to_stderr_from_any_process` | A string matching foo/ is printed to $stderr from this process or a subprocess | `a_block_outputting(/foo/).to_stderr_from_any_process`

### Raising/Throwing

Matcher                         | Passes if...                                                                 | Available aliases      
------------------------------- | ---------------------------------------------------------------------------- | ----------------- 
`raise_error("message")`        | Block raises an error and `error.message == "message"`                       | `raise_exception("message")`, `a_block_raising("message")`
`raise_error("message")`        | Block raises an error and `error.message =~ /regexp/`                        | `raise_exception("message")`, `a_block_raising("message")`
`error.is_a?(klass)`            | Block raises an error and `error.is_a?(klass)`                               | `raise_exception(klass)`, , `a_block_raising(kls)`
`raise_error(klass, "message")` | Block raises an error and `error.is_a?(klass) && error.message == "message"` | `raise_exception(klass, "message")`, `a_block_raising(klass, "message")`
`raise_error(klass, /regexp/)`  | Block raises an error and `error.is_a?(klass) && error.message =~ /regexp/`  | `raise_exception(klass, /regexp/)`, `a_block_raising(klass, /regexp/)`
`raise_error { |err| ... })`    | Block raises an error and `raise_error` block returns true                   | `raise_exception { |err| ... }`, `a_block_raising { |err| ... }`
`throw_symbol`                  | Block throws any symbol                                                      | `a_block_throwing`
`throw_symbol(:sym)`            | Block throws symbol :sym                                                     | `a_block_throwing(:sym)`
`throw_symbol(:sym, arg)`       | Block throws symbol :sym with argument arg                                   | `a_block_throwing(:sym, arg)`



### Yielding

To use the yield matchers, your expect block must receive an argument (a "yield probe")
and pass it on to the method-under-test using Ruby’s &block syntax:

```ruby
expect { |probe| obj.some_method(&probe) }.to yield_control
```

Matcher                                 | Passes if method called in block yields...                                           | Available aliases
--------------------------------------- | ------------------------------------------                                           | -----------------
`yield_control`                         | ...one or more times                                                                 | `yield_control.at_least(:once)`, `a_block_yielding_control`
`yield_control.once`                    | ...once                                                                              | `a_block_yielding_control.once`
`yield_control.twice`                   | ...twice                                                                             | `a_block_yielding_control.twice`
`yield_control.thruce`                  | ...thrice                                                                            | `a_block_yielding_control.thrice`
`yield_control.exactly(n).times`        | ...n times                                                                           | `a_block_yielding_control.exactly(n).times`
`yield_control.at_least(n).times`       | ...at least n times                                                                  | `a_block_yielding_control.at_least(n).times` 
`yield_control.at_most(n).times`        | ...at most n times                                                                   | `a_block_yielding_control.at_most(n).times` 
`yield_with_args(x, y)`                 | ...once with arguments that match x and y                                            | `a_block_yielding_with_args(x, y)`
`yield_with__no_args`                   | ...once with no arguments                                                            | `a_block_yielding_with_no_args`
`yield_successive_args([a, b], [c, d])` | ...once with arguments that match a and b and once with arguments that match c and d | `a_block_yielding_successive_args([a, b], [c, d])`
