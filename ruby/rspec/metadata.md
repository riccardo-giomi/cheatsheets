# Metadata

## Example metadata

```ruby
RSpec.describe Hash do
  it 'is used by RSpec for metadata' do |example|
    pp example.metadata
  end
end
```

### Information

  * `:description`, just the string we passed to it; in this case, "is used by RSpec...";
  * `:full_description`, includes the text passed to describe as well; in this case, "Hash is used by RSpec...";
  * `:described_class`, the class we passed to the outermost describe block; also available inside any example via RSpec's `described_class` method;
  * `:file_path`, directory and filename where the example is defined, relative to your project root; useful for filtering examples by location;
  * `:example_group`, gives you access to metadata from the enclosing example group;
  * `:last_run_status`, will be "passed", "pending", "failed", or "unknown"; the latter value appears if you haven't configured RS;

### Behaviour

  * `:aggregate_failures`, changes how RSpec reacts to failure so that each example runs to completion (instead of stopping at the first failed expectation);
  * `:pending`, indicates that you expect the example to fail; RSpec will run it and report it as pending if it did fail, or report it as a failure if it passed;
  * `:skip`, tells RSpec to skip the example entirely but still list the example in the output (unlike with filtering, which omits the example from the output);
  * `:order`, sets the order in which RSpec runs your specs (can be the same order as they’re defined, random order, or a custom order);
