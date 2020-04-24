## Gems and Bundler

### Install/uninstall a specific version of a gem

* Using the `-v` option:

```ruby
gem install GEM_NAME -v GEM_VERSION
```

* Using the `GEM_NAME:GEM_VERSION` convention 

```ruby
gem install GEM_NAME:GEM_VERSION
```

### Run a specific version of a gem's executable

```ruby
EXECUTABLE _VERSION_ OPTIONS
```

For example:

```ruby
rails _5.2.4.2_ --version
```

