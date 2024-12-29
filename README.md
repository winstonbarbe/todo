# Todo App

## Exercise Overview

In this exercise, you will be creating a "Todo" app, an application that allows a user to keep track of personal tasks and chores that they need... to do.

In this terminal-based app, a user can create multiple lists of tasks, assign due dates to these tasks, and also mark tasks as "complete" once they're finished.

This exercise is slightly different than the previous deep dives. Previously, your job was to write a single, albeit complex, method. Here, we're jumping back into OOP fundamentals, and you'll be completing entire classes of objects. While we've provided the basic skeleton of two classes, you'll be filling in multiple methods for each class.

Another unique aspect of this exercise is that this README file does not contain the exact details of the code you're supposed to write. Instead, all of the details will be contained in the **test file**, as we'll explain below.

## A Note About OOP

While the main skills that deep dives aim to help you develop are _discovery_ and _decomposition_, you'll also get the chance to learn or review particular concepts. This deep dive does require a fundamental grasp of Object-Oriented Programming, commonly known as OOP.

It's normal to not remember all (or any?) of the details of OOP by the time you reach this deep dive. However, this is a good time to go back and review the OOP basics as you work through this exercise. Future deep dives will also have you work with OOP, so a thorough review of Ruby-style OOP is highly recommended at this point.

You may also discover that working through this exercise itself will serve as a refesher to the basic OOP concepts.

## Exercise Details

This exercise contains a bunch of extra moving parts, as there are four different files (besides this README) that you'll be dealing with.

### The Two Classes: Task and List

Your job is to complete _two_ of these files: `task.rb` and `list.rb`.

The `task.rb` file contains the skeleton of a `Task` class. A `Task` instance represents a single task that a user has assigned for themselves. Examples of tasks include mowing the lawn, writing a report, or organizing a photo album.

The `list.rb` file contains the `List` class. The notion of a list is that you can group a bunch of tasks into a single list. This can be useful for the sake of organization, as you may want to keep one list for, say, household chores, and a separate list for work-related tasks. In our Todo app, the user first creates a list, and can then add individual tasks to that list.

These two files contain multiple methods, and _your_ job is to write the code for all of the methods. We recommend that you begin with the `Task` class, and work your way from top to bottom. Then, you can complete the `List` methods from top to bottom.

### Class Attributes

The `Task` class revolves around three attributes:

- The `name` attribute should be a string that represents the task's name. This can be `"Take out trash"` or `"Clean carburetor"`, for example.
- The `due_date` attribute should be a `Date` object (a specialized class that comes with Ruby), and represents the date on which a task is due. A task doesn't _have_ to have a due date, though. The user can first create a task and only decide to assign a due date at some later point.
- The `completed` attribute should be a boolean (i.e. either `true` or `false`) and represents whether the task has already been completed. This attribute allows the user to use the app's most enjoyable feature - checking tasks off as completed!

The `List` class has two primary attributes:

- The `name` attribute is a string which represents the title of the list. For instance, this can be `"Chores"` or `"Personal"` or `"Work"`.
- The `tasks` attribute is an _array_. This array is intended to contain _instances of the `Task` object_. It is through this mechanism that a list can contain multiple tasks.

## Unit Tests

All of the unit tests are contained in the file `test_todo.rb`. You can run them in the terminal with:

```
ruby test_todo.rb
```

Note that by default, most of the tests are commented out. You need to uncomment each test to activate it.

## You Need These Tests!

In this exercise, the unit tests are more important than ever, because **the tests will serve as your sole set of instructions as how to complete this exercise**. In previous deep dives, the README contained sufficient information to describe what code you were supposed to write. Here, however, the tests _themselves are the instructions_.

You'll need to analyze each test carefully to determine what, exactly, your code is supposed to do.

### Test Example

Let's see an example by taking a quick look at the first unit test:

```
# # Test 1
puts "TEST 1: Test that new task has name"
task = Task.new("Mow lawn")
if task.name == "Mow lawn"
  puts "TEST #1 passed"
else
  puts "TEST #1 failed"
end
```

The description of each test is always helpful in providing some context as to what the test is dealing with. Here, we're apparently going to write code to ensure that a new task has a name.

The first line of the actual test says:

```
task = Task.new("Mow lawn")
```

This is a classic OOP move. We're using the `Task` class to create a brand new instance of a task. In this case, we're including the string `"Mow lawn"` as a parameter when we're creating this instance. We also take the created instance and save it to a variable called `task` (with a lowercase "t").

In the remaining test code, we can see that the test will pass if the following condition is met:

```
if task.name == "Mow lawn"
```

That is, if we call the `name` instance method on the `task` instance, the method should return the string `"Mow lawn"`.

It emerges that our job is to make sure that this sequence of code will work. That is, we need to make sure that:

1. If we create a new instance of `Task` while passing in the parameter of `"Mow lawn"`
2. that if we later call `task.name`,
3. we'll get back the string `"Mow lawn"` as a return value.

Does this mean that we need to create a `name` method? It could, theoretically, mean that. However, we also need to look at our `task.rb` file in conjunction with the unit test.

> Pro Tip: As you code, use your text editor's split screen feature. Keep your `task.rb` or `list.rb` file on the left-hand side, and the test file on the right-hand side. (Or vice versa.)

If we open `task.rb`, we'll see that it already contains a `name` method, by virtue of the line:

```
attr_reader :name, :due_date, :completed
```

Our Ruby-style OOP knowledge tells us that `attr_reader :name` actually creates a `name` method on our behalf, and will return the instance variable `@name`.

So, it turns out that our main job - for this test - is not to write a `name` method. Instead, we need to make sure that when we create a new instance of `Task`, that the `"Mow lawn"` string gets assigned to the instance variable `@name`. (Hint: To do this, recall that the `initialize` method in a class serves as the _constructor_ - that is, it automatically gets run when a new instance of a class is created.)

Likewise, you'll need to carefully read each unit test to help guide you through the coding of the entire app. These tests will serve as your precise instructions.

## The Runner File

As an added bonus, we've supplied a file called `runner.rb` which will allow you to actually run the completed Todo app in your terminal. This Ruby script will use the classes that you've created to allow a user to engage with your fully functional app. Of course, this script won't work correctly until you've finished your work.

You're encouraged to read through this script so as to gain a better understanding of how OOP works. When you write the code for standalone classes (like `Task` or `List`), it's all very abstract. The "runner" script, however, allows you to see how the classes you wrote can be used to create an actual, working app.

The runner app is very basic, and has just enough functionality to be useable. You are not expected to modify this file, but feel free to improve the app once you've gotten everything else to work!

You can run this file with:

```
ruby runner.rb
```

## Committing to Github

To commit your code to Github, you can run the following set of commands in the terminal:

```
git add --all
git commit -m "your commit message goes in between these quotation marks"
git push origin YOUR-GITHUB-USERNAME-GOES-HERE
```
