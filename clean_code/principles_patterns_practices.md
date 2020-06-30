### Principles, patterns and practices

From **Clean Code: A Handbook of Agile Software Craftsmanship**
By _Robert C. Martin_

## Naming

Names are everywhere in software. Because we do so much of it, we'd better do
it well

* **Use Intention-Revealing Names**

* **Avoid Disinformation**
  * Spelling similar concepts similarly is information.
    Using inconsistent spellings is disinformation.

* **Make Meaningful Distinctions**
  * If names must be different, then they should also mean something different.
  * Number-series naming and noise words are meaningless distinction
  * Distinguish names in such a way that the reader knows what the differences
    offer.

* **Use Searchable Names**
  * The length of a name should correspond to the size of its scope.

* **Avoid Encodings**
  * Encoding type or scope information into names simply adds an extra burden of
    deciphering.

* **Avoid Mental Mapping**
  * Readers shouldn't have to mentally translate your names into other names they already
    know.
  * This problem generally arises from a choice to use neither problem domain terms
    nor solution domain terms.
  * One difference between a smart programmer and a professional programmer is that
    the professional understands that clarity is king.

* **Class Names**
  * Classes and objects should have noun or noun phrase names;
  * a class name should not be a verb.

* **Method names**
  * Methods should have verb or verb phrase names;
  * accessors, mutators, and predicates should be named for their value.
  * (Java) Accessors, mutators, and predicates should be prefixed with _get_,
    _set_ and _is_, according to the
    [javabean standard](http://java.sun.com/products/javabeans/docs/spec.html).
  * When constructors are overloaded, use static factory methods with names that
    describe the arguments.

* **Don't Be Cute**
  * Choose clarity over entertainment value.
  * HolyHandGrenade is cute, but maybe in this case DeleteItems might be a
    better name.

* **Pick One Word per Concept and stick with it**
  * A consistent lexicon is a great boon to the programmers who must use your
    code.

* **Don't Pun**
  * Avoid using the same word for two purposes.
    Using the same term for two different ideas is essentially a pun.

* **Use Solution Domain Names**
  * Names from the Problem Domain might require the developer to ask the client.
  * Technical names for things might be better for programmers.

* **Use Problem Domain Names**
  * When there is no “programmer-eese” for what you're doing, use the name from
    the problem domain.
  * The code that has more to do with problem domain concepts should have names
    drawn from the problem domain.
* **Add Meaningful Context**
  * you need to place names in context for your reader by enclosing them in
    well-named classes, functions, or namespaces.
  * When all else fails, then prefixing the name may be necessary as a last
    resort.

* **Don't Add Gratuitous Context**
  * Shorter names are generally better than longer ones, so long as they are clear.
  * Add no more context to a name than is necessary.
* ****
* ****
