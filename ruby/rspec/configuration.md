# Configuration

## Filtering
**config.when_first_matching_example_defined(metadata, &block)**

Runs _block_ only once when an example defined by _metadata_ is first encountered

**config.example_status_persistence_file_path = 'spec/examples.txt'**

Tells RSpec where to store the passed, failed, or pending status of each
example between runs, enabling the _--only-failures_ and _--next-failure_ options.

**config.filter_run_excluding :specific_to_some_os**

Excludes examples from being run; useful for permanent exclusions
based on environmental factors like OS, Ruby version, or an environment
variable.

**config.filter_run_when_matching :some_metadata**

Sets a conditional filter that only applies when there are matching examples;
this is how, for instance, RSpec runs just the examples you’ve tagged
with the **:focus** metadata.

## Metadata

**config.define_derived_metadata(file_path: /unit/) { |meta| meta[:type] = :unit }**

Derives one metadata value from another. Here, we tag all the specs in
the unit directory with type: _:unit_. If we had left out the _file_path_ argument,
this call would have set metadata for all examples.

**config.alias_example_to :alias_for_it, some_metadata: :value**

Defines an alternative to the built-in it method that creates an example
and attaches metadata. This is how RSpec’s built-in fit method marks
examples you want to focus on.

**config.alias_example_group_to :alias_for_describe, some_metadata: :value**

Like the previous alias, except that it works onexample groups instead
of individual examples (like RSpec’s _fdescribe_).

## Output Options

**config.warnings = true**

Enables Ruby’s warnings mode. This helps you catch some mistakes (such as method redefinitions
and variable misspellings) but may report tons of extra warnings in third-party code,
unless you use something like ruby_warning_filter to cut some of the noise.

**config.profile_examples = 2**

RSpec will measure how long each spec took and print the given number
of slowest examples and groups (two, in this case). This is helpful for
keeping your test suite fast.

**config.backtrace_exclusion_patterns << /vendor/**

Excludes any lines from the backtrace matching the given regular
expressions; for example, lines containing the text vendor .

**config.filter_gems_from_backtrace :rack, :sinatra**

Excludes stack frames from specific libraries; here, we won't see calls
from inside the rack and sinatra gems.

## Hooks

```ruby
RSpec.configure do |config|
  config.before|after|around(:example|:context|:suite [, :metadata]) do
    # ...
  end
end
```

## Sharing Code
```ruby
class Performer
  include Singing # won't override Performer methods
  prepend Dancing # may override Performer methods
end
```

```ruby
average_person = AveragePerson.new
average_person.extend Singing
```

```ruby
RSpec.configure do |config|
  # Brings methods into each example
  config.include ExtraExampleMethods

  # Brings methods into each example,
  # overriding methods with the same name
  # (rarely used)
  config.prepend ImportantExampleMethods

  # Brings methods into each group (alongside let/describe/etc.)
  # Useful for adding to RSpec's domain-specific language
  config.extend ExtraGroupMethods
end
```

```ruby
RSpec.configure do |config|
  config.include_context 'My Shared Group'
end
```
