# Visitor pattern

## Intent

- Represent an operation to be performed on the elements of an object structure.
Visitor lets you define a new operation without changing the classes of the
elements on which it operates.
- The classic technique for recovering lost type information.
- Do the right thing based on the type of two objects.
- Double dispatch

## Structure

![First Example](https://sourcemaking.com/files/v2/content/patterns/Visitor1.png)

![Second
Example](https://sourcemaking.com/files/v2/content/patterns/Visitor_1.png)

## How to

1. Confirm that the current hierarchy (known as the Element hierarchy) will be
fairly stable and that the public interface of these classes is sufficient for
the access the Visitor classes will require. If these conditions are not met,
then the Visitor pattern is not a good match.
2. Create a Visitor base class with a `visit(ElementXxx)` method for each Element
derived type.
3. Add an `accept(Visitor)` method to the Element hierarchy. The implementation in
each Element derived class is always the same – `accept( Visitor v ) { v.visit(
this ); }`. Because of cyclic dependencies, the declaration of the Element and
Visitor classes will need to be interleaved.
4. The Element hierarchy is coupled only to the Visitor base class, but the
Visitor hierarchy is coupled to each Element derived class. If the stability of
the Element hierarchy is low, and the stability of the Visitor hierarchy is
high; consider swapping the 'roles' of the two hierarchies.
5. Create a Visitor derived class for each "operation" to be performed on
Element objects. `visit()` implementations will rely on the Element's public
interface.
6. The client creates Visitor objects and passes each to Element objects by
calling `accept()`.
