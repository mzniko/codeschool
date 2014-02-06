### What is the difference between ruby v1.9.3 and v2.0.0?

1. Links:
   Change note highlights and announcement: https://www.ruby-lang.org/en/news/2013/02/24/ruby-2-0-0-p0-is-released/
   Comprehensive rundown: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example/

2. [warning longer than two sentences] One of the biggest changes to Ruby 2.0.0 include keyword arguments which give APIs greater flexibility and can make API documentation self-descriptive (ie. instead of having 

      '10.step(100, 2)'' 

   you may instead have (if implemented this way)

      '10.step by: 2, to: 100'

   Also, instead of requiring defaults for positional arguments (or an **extra at the end), you can now use a mixture of named args, variables, blocks, defaults and catch-alls.

   *Extra:* 6 minute keyword argument rundown video: http://www.youtube.com/watch?v=u8Q6Of_mScI

   Other niceties include optimizations for various operations, including a special optimization for Rails startup, UTF-8 default encoding, and symbol list syntactic sugar (%i[apple pear plum]).

- - -

### What is a patch level?

1. Patch levels are non-functionality adding backwards compatible bugfixes that include critical bugs and security fixes. The patch number is the number of commits to source since the last minor release.

2. Ruby semantic versioning (post 2.1): https://www.ruby-lang.org/en/news/2013/12/21/semantic-versioning-after-2-1-0/
Semantic Versioning schema: http://semver.org/

- - -

### What is MRI, what are some alternative rubies?

1. MRI is "Matz's Ruby Interpreter", aka CRuby, and is the reference implementation of Ruby. The interpreter is written in C and uses a Ruby-specific virtual machine.

2. Other implementations: JRuby is an implementation on the Java virtual machine (JVM), and Rubinius seeks to use a pure Ruby compiler running in a C++ LLVM that interprets Ruby at runtime.

- - -

### What is a gem? What is "gem"?

1. A "gem" is the standardized format of a Ruby program or library for use with the RubyGems package manager. RubyGems allows for easy installation and distribution of gems, while programs like Bundler ease gem management within a project context.

2. Ruby gem hosting: http://rubygems.org/

3. Commands:
  + gem help
  + gem search <string>
  + gem list

- - -

### What are reserved words?

1. Reserved words are used by the Ruby interpreter to implement core Ruby functionality and cannot be used as variable names or method definitions as identifiers. Examples include: alias, begin, break, then, if, else, do.

2. Reserved words: http://www.zenspider.com/Languages/Ruby/QuickRef.html#reserved-words

3. You cannot use reserved words as an identifier because the interpreter will likely shit itself and throw a syntax error.

- - -

### What is a "class"? What is an "object"?

1. A class is a template for creating objects. In Ruby, everything is an object, identified by it's class (ex: 1 is class Fixnum, and Fixnum itself is class Class.)

2. Snippet:

  '''class NewClass
    attr_accessor :instancevar

    class << self
      attr_accessor :classvar
    end

    def public_method
    end

    private 
    def private_method
    # alternatively, methods may be made private all at once
    # with:
    #         private :private_method, :other_private_method
    end
  end'''

3. Method calls:

      thing = NewClass.new
      thing.public_method
      thing.instancevar = "set"
      thing.classvar = "set"

4. Eloquent Ruby Chapter 7 covers regular instance variables, accessors and visibility, while Chapter 14 covers class instance variables, including making self be a singleton class to enable class-level attribute accessors (singletons are covered in Chapter 13).

- - -

### As far as Ruby is concerned, what is truthiness?

1. The truthiness of something in Ruby is an object's boolean value when used in a boolean context (typecasting). In Ruby, everything except for nil and false are true. Even 0.

2. False:
..* false
..* nil

3. True:
..* Everything else

- - -

### = vs == vs ===

1. Ruby has an === operator (though for most classes it defaults to use ==), it is used for case statement methods (overridden) or as an alias for the kind_of? method when used against Class objects. (ex: (1...10) === 5 returns true, Float === 1.0 is true, but 1.0 === Float is false.)

2. Comparison:
'''
    var = 1 # = is an assignment operator
    var == 1 (true) # == is an equality operator
    FixNum === 1 (true) # === is an overridden case operator
'''
- - -

### Many happy returns

1. A return statement will return the inline value (and nil, if there is none  ) and exit the scope of the function that it is in. It is useful (and somewhat mandatory) because every method in Ruby returns a value by default. If a return statement is not explicit, it will return the value of the last statement, even if it is an assignment.

2. Break will exit from the innermost loop (if, for, until, etc.), return will exit the function completely with a value, and next will jump to the next iteration of the innermost loop.

3. The last statement.

4. Return is not idiomatic if it is used in a normal function with a single exit, as the final statement is known to be the return value. It is not discouraged if your function requires early termination and return adds clarity.