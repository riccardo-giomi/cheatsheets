Useful commands
===============

### Last 5 branches by commit date

```
git for-each-ref --count=5 --sort=-committerdate refs/heads/ --format='%(refname:short)'
```
